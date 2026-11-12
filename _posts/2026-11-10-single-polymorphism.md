---
title: Polymorphism on a single object in Ruby
date: 2026-11-10 02:58:31 -0800
categories:
  - programming
tags:
  - ruby
  - metaprogramming
layout: post
excerpt: >
  By dynamically redefining singleton methods on an object
  and instance methods on an extended module,
  we can achieve polymorphism on a single object based on the context.
  With the new `Proc#refined` method in Ruby 4.1, this can be done
  in a simpler way.
---

Consider the following code snippet:

```ruby
class MyData
	attr_accessor :x, :y, :text

	extend Binary

	MASK = [0xdeadbeef].pack ?V
	def mask data
		data.bytes.zip((MASK * (data.bytesize / MASK.bytesize + 1)).bytes).map { _1 ^ _2 }.pack 'C*'
	end

	read do
		raise 'incorrect format' if bytes(4) != 'Poly'
		read_raw mask rest
	end

	read :raw do
		@x = u8
		@y = u8
		raise 'incorrect format' if @x + @y != u8
		@text = string
	end

	write do
		bytes 'Poly'
		bytes mask write_raw
	end

	write :raw do
		u8 @x
		u8 @y
		u8 @x + @y
		string @text
	end
end

obj = MyData.new
obj.x, obj.y = 1, 2
obj.text = "Hello, World!"
bin = obj.write # => "Poly\xEE\xBC\xEC\xB3..."

obj2 = MyData.new
obj2.read bin
p obj2.x, obj2.y, obj2.text # => 1, 2, "Hello, World!"
```

The semantics is clear:
The `read do ... end` block defines a method `MyData#read`
that populates the instance variables from binary data,
where another method `MyData#read_raw`, defined by a `read :raw do ... end` block,
is called to read some processed binary data.
Similarly, the `write do ... end` block defines a method `MyData#write`
that serializes the object into binary data, where another method
`MyData#write_raw`, defined by a `write :raw do ... end` block,
is called to write some processed binary data.

In those blocks, methods like `u8`, `u32`, `bytes`, and `string` are called.
What is interesting is that they should be instance methods of `MyData`
(because they are called in the same scope where the instance variables can be accessed directly),
but they behave differently in the `read` and `write` blocks.
For example, `u8` in the `read` block accepts no arguments and returns an integer read from data,
while `u8` in the `write` block accepts an integer argument to write into data.

What we have here, is what I call the polymorphism on a single object:
the same object has different behaviors in different contexts.
In this case, it is the same `MyData` object that behaves differently
in the `read` and `write` blocks.
How can we achieve this?

One natural idea is to extend the object with a module that defines those polymorphic methods
at the start of the block
and to un-extend at the end of the block.
The extended module should be different for the `read` and `write` blocks,
so that the methods with the same name can have different implementations.
The problem with this approach is that,
if you look up the core library documentation of Ruby,
you will find that there is no method to un-extend a module in pure Ruby.
It is, however, possible to do this with C extensions,
and there is a [gem](https://github.com/banister/remix)
that has been developed for this exact purpose,
but the gem is ancient and is not compatible with Ruby 1.9 and later.

The next idea, then, is to modify the extended module
so that the methods are defined at the start of the block
and removed at the end of the block.
To create a module, to extend it, and to define all methods from another module `mod` in it, we can do the following:

```ruby
extend ext = Module.new
mod.instance_methods.each { ext.define_method _1, mod.instance_method(_1) }
```

<p class="no-indent">
It is just as easy as that.
Now, if `mod` is a module contains the definitions of the methods `u8`, `bytes`, etc.,
then they will now be available to `self`.
After we are done, we can remove those methods from the extended module:
</p>

```ruby
ext.instance_methods.each { ext.remove_method _1 }
```

<p class="no-indent">
It is also very easy.
Now, although we still cannot un-extend `ext`,
the methods are no longer available, which effectively makes the object behave as if it un-extended `ext`.
</p>

A problem with this approach is that,
if a method like `read` or `write` is called many times on the same object,
then its `singleton_class.ancestors` will contain many garbage extended modules.
Therefore, we should reuse the same extended module for the same object.
At the start of the block in which the polymorphic methods are available,
we should back up the original instance methods of the extended module,
and at the end of the block, we should restore them.
Another problem is that manipulating ancestors and methods is not thread-safe,
so we need to lock the object while we are doing this.
After considering all these problems, we can implement a `TempExtend` module like this:

```ruby
module TempExtend
	class Extendee < Module
		MUTEX = Mutex.new
		ALL = ObjectSpace::WeakMap.new
		def self.[] receiver
			e = MUTEX.synchronize do
				break ALL[receiver] if ALL[receiver]
				TempExtend.check_frozen receiver
				ALL[receiver] = new receiver
			end
			block_given? ? e.lock.synchronize { yield e } : e
		end

		def initialize receiver
			super()
			@receiver = receiver.extend self
			@lock = Monitor.new
		end
		attr_reader :lock

		VS = %i[public protected private]
		def before mod, body
			old = VS.map { |v| __send__(:"#{v}_instance_methods").map { instance_method _1 }.each { remove_method _1.name } }
			VS.each { |v| mod.__send__(:"#{v}_instance_methods").each { __send__ v, define_method(_1, mod.instance_method(_1)) } }
			meth = @receiver.define_singleton_method (1..).each { @receiver.singleton_method(n = ?_*_1) rescue break n }, &body
			[old, meth]
		end

		def after old, meth
			@receiver.singleton_class.remove_method meth
			VS.each { |v| __send__(:"#{v}_instance_methods").each { remove_method _1 } }
			VS.zip(old) { |v, m| m.each { __send__ v, define_method(_1.name, _1) } }
		end
	end

	def self.check_frozen object
		return if [object, object.singleton_class].none? &:frozen?
		raise FrozenError.new "can't modify frozen #{object.class}: #{object.inspect}", receiver: object
	end

	def def_extend name, mod, before: nil, after: nil, &body
		define_method name do |*args, **opts, &block|
			Extendee[self] do |ext|
				instance_eval &before if before
				TempExtend.check_frozen self
				old, meth = ext.before mod, body
				begin
					__send__ meth, *args, **opts, &block
				ensure
					ext.after old, meth
					instance_eval &after if after
				end
			end
		end
	end
end
```

<p class="no-indent">
There is a notable interesting pattern here when defining `meth`
(though it is not closely related to the topic of this article)
as it finds an unused singleton method name to define a singleton method
with the given block
to circumvent the limitation of `instance_exec` that it cannot pass a block;
I opened a feature request for
[anonymous methods](https://bugs.ruby-lang.org/issues/22486)
hoping that the same workaround is not needed in the future.
</p>

We can now finally define our version of `Binary` module,
extended by `MyData`, that enables it to use `read` and `write` methods
to define blocks for polymorphic methods.

```ruby
module Binary
	include TempExtend

	BEFORE = proc { (@stack ||= []).push [@data, @pos] if @data }
	AFTER = proc { @data, @pos = @stack&.pop }

	def read name = nil, &block
		def_extend name ? :"read_#{name}" : :read, Reader, before: BEFORE, after: AFTER do |data, pos = 0|
			@data = data
			@pos = pos
			instance_eval &block
			@pos
		end
	end

	def write name = nil, &block
		def_extend name ? :"write_#{name}" : :write, Writer, before: BEFORE, after: AFTER do |data = ''.b|
			@data = data
			instance_eval &block
			@data
		end
	end

	module Reader
		def u8 = bytes(1).unpack1 ?C
		def u16 = bytes(2).unpack1 ?v
		def u32 = bytes(4).unpack1 ?V
		def var_uint = (n = u8) == 0xff ? (n = u16) == 0xffff ? u32 : n : n
		def string = bytes(var_uint).force_encoding Encoding::UTF_8
		def rest = bytes @data.bytesize - @pos
		def bytes(n) = @data[@pos...@pos += n]
	end

	module Writer
		def u8(v) = bytes [v].pack ?C
		def u16(v) = bytes [v].pack ?v
		def u32(v) = bytes [v].pack ?V
		def var_uint(v) = v < 0xff ? u8(v) : (u8 0xff; v < 0xffff ? u16(v) : (u16 0xffff; u32 v))
		def string(v) = (var_uint v.bytesize; bytes v.encoding == Encoding::BINARY ? v : v.b)
		def bytes(v) = @data.concat v
	end
end
```

For Ruby 4.1 and later, there is a new method `Proc#refined`
that can be used to modify the methods available in a block.
Our `TempExtend` module is of no use anymore, and we can simplify the `Binary` module as follows:

```ruby
module Binary
	BEFORE = proc { (@stack ||= []).push [@data, @pos] if @data }
	AFTER = proc { @data, @pos = @stack&.pop }

	def read name = nil, &block
		block = block.refined Module.new.tap { _1.send(:refine, self) { import_methods Reader } }
		define_method name ? :"read_#{name}" : :read do |data, pos = 0|
			instance_eval &BEFORE
			@data = data
			@pos = pos
			begin
				instance_eval &block
				@pos
			ensure
				instance_eval &AFTER
			end
		end
	end

	def write name = nil, &block
		block = block.refined Module.new.tap { _1.send(:refine, self) { import_methods Writer } }
		define_method name ? :"write_#{name}" : :write do |data = ''.b|
			instance_eval &BEFORE
			@data = data
			begin
				instance_eval &block
				@data
			ensure
				instance_eval &AFTER
			end
		end
	end

	module Reader
		# ...
	end
	module Writer
		# ...
	end
end
```

<p class="no-indent">
Not only is this approach cleaner, it is also effectively better:
the extended module is now invisible in the ancestors of the object,
and the methods are now truly local to the block protected by the lexical scope of the block.
The latter advantage is, however, also a disadvantage in some use cases:
if you want to define a method in `MyData` outside of `Binary::Reader` or `Binary::Writer` that
calls methods like `u8`, it will not work
because the method definition is outside of the lexical scope of the block.
</p>
