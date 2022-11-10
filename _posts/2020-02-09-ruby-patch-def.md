---
title: Monkey-patching graciously
date: 2020-02-09 13:16:31 +0800
categories:
- programming
tags:
- ruby
- meta programming
- long paper
layout: post
excerpt: 'Monkey-patching is a powerful tool in programming.
In this article, I used techniques of Ruby metaprogramming to define a series of methods
`def_after`, `def_before`, etc. to help monkey-patching.
They look graciously in that we can use it to shorten the codes for monkey-patching
(avoiding aliasing and repeating codes).'
---

I am going to show how to monkey-patch graciously using
[Ruby](https://www.ruby-lang.org/){:target="_blank"}.

The original idea is to implement a method `Module#def_after` so that
I can easily make something to be done after the original method.
Like this:
```ruby
class Foo
  def bar
    print 'before'
  end
end

class Foo
  def_after :bar do
    puts ' & after'
  end
end

Foo.new.bar # => before & after
```
The implementation is a little easy:
```ruby
class Module
  def def_after method_name, &refine_block
    old = instance_method method_name
    define_method method_name do |*args, **opts, &block|
      old.bind_call self, *args, **opts, &block
      refine_block.(*args, **opts, &block)
    end
  end
end
```
However, there is a little problem. The `self` in `refine_block`
depends on how and where `refine_block` is defined instead of
just being the instance receiving the method.

Since an instance method (`UnboundMethod` object) defined in a
`Module` can `bind` any other object, we can use
`Module#define_method` and send `refine_block` as a block parameter,
and then bind the instance method to `self`:
```ruby
class Proc
  def bind receiver
    Module.new.module_exec self do |block|
      instance_method define_method :_, &block
    end.bind receiver
  end
  def bind_call receiver, *args, **opts, &block
    bind(receiver).(*args, **opts, &block)
  end
end
class Module
  def def_after method_name, &refine_block
    old = instance_method method_name
    define_method method_name do |*args, **opts, &block|
      old.bind_call self, *args, **opts, &block
      refine_block.bind_call self, *args, **opts, &block
    end
  end
end
```
The `self` can successfully be converted. You can test it yourself.

Here is still a problem. When the new instance method is defined,
its visibility is `public`, while the original visibility may be
`private` or `protected`.

Use the following means to get the visibility beforehand and set
the visibility afterward:
```ruby
class Module
  def method_visibility method_name
    %i[public protected private].find do |visibility|
      __send__ :"#{visibility}_method_defined?", method_name
    end
  end
  def def_after method_name, &refine_block
    visibility = method_visibility method_name
    old = instance_method method_name
    define_method method_name do |*args, **opts, &block|
      old.bind_call self, *args, **opts, &block
      refine_block.bind_call self, *args, **opts, &block
    end
    __send__ visibility, method_name
  end
end
```
There can be some improvement. If we need to refine a singleton
method, calling `def_after` on its `singleton_class` will lead to
calling `obj.singleton_class.instance_method(sym).bind_call(obj, *)`,
which is way too complex. The straightforward way to do it is to call
`obj.method(sym).call(*)`.

With this inspiration, we can implement `Object#def_after`:
```ruby
class Object
  def def_after method_name, &refine_block
    visibility = singleton_class.method_visibility method_name
    old = method method_name
    define_singleton_method method_name do |*args, **opts, &block|
      old.(*args, **opts, &block)
      refine_block.bind_call self, *args, **opts, &block
    end
    singleton_class.__send__ visibility, method_name
  end
end
```
Then there comes a new problem. A `Module` also has singleton
methods, while `Module#def_after` can only change its instance
methods instead of its singleton methods.
The way to solve this is to judge whether `is_a? Module` in
`Object#def_after`, and add a keyword argument `singleton`:
```ruby
class Object
  def def_after method_name, singleton: false, &refine_block
    singleton ||= !is_a?(Module)
    # mod: the module containing the old method
    # get_method: the method to get the Method/UnboundMethod obj
    # def_method: the method to define a new method
    mod, get_method, def_method = singleton ?
        [singleton_class, method(:method), method(:define_singleton_method)] :
        [self, method(:instance_method), method(:define_method)]
    # get visibility
    visibility = mod.method_visibility method_name
    # get old
    old = get_method.(method_name)
    # override
    def_method.(method_name) do |*args, **opts, &block|
      old = old.bind self unless old.is_a? Method
      old.(*args, **opts, &block)
      refine_block.bind_call *args, **opts, &block
    end
    # set visibility
    mod.__send__ visibility, method_name
  end
end
```
What about parsing a callable object as an argument instead of
through `refine_block`?
Parsing a `Symbol` can also be useful. Like this:
```ruby
Object.def_after :display, :puts
```
Then `Object#def_after` will be a little complex:
```ruby
class Object
  # pat: when refine_block is nil, it is used to represent a refinement
  # singleton: force singleton when self is a Module
  def def_after method_name, pat = nil , singleton: false, &refine_block
    singleton ||= !is_a?(Module)
    # mod: the module containing the old method
    # get_method: the method to get the Method/UnboundMethod obj
    # def_method: the method to define a new method
    mod, get_method, def_method = singleton ?
        [singleton_class, method(:method), method(:define_singleton_method)] :
        [self, method(:instance_method), method(:define_method)]
    # get visibility
    visibility = mod.method_visibility method_name
    # get pat
    pat = refine_block || {
      to_sym:  ->symbol { get_method.(symbol.to_sym) },
      to_proc: :to_proc.to_proc,
      call:    ->callable { callable.method :call }
    }.each do |duck, out|
      break out.(pat) if pat.respond_to? duck
    end
    # get old
    old = get_method.(method_name)
    # override
    def_method.(method_name) do |*args, **opts, &block|
      # bind old
      old = old.bind self unless old.is_a? Method
      # bind pat
      pat = pat.bind self unless pat.is_a? Method
      # call the new method
      old.(*args, **opts, &block)
      pat.(*args, **opts, &block)
    end
    # set visibility
    mod.__send__ visibility, method_name
  end
end
```
We are still not satisfied. We need to define a lot of methods like
`def_after`, such as `def_before`, `def_if`...
Maybe we should define `Object::def_` and use it like this:
```ruby
class Object
  # use this binding to eval to avoid excessive local variables
  def self.class_binding
    binding
  end
  {
    after:  'result = old.(*); pat.(*); result',
    after!: 'old.(*); pat.(*)',
    before: 'pat.(*); old.(*)',
    with:   'pat.(old.(*), *)',
    chain:  'pat.(old, *)',
    and:    'old.(*) && pat.(*)',
    or:     'old.(*) || pat.(*)',
    if:     'pat.(*) && old.(*)',
    unless: 'pat.(*) || old.(*)'
  }.each do |sym, code|
    str = "def_(:#{sym}) { |old, pat, *| #{code} }"
    str.gsub! ?*, '*args, **opts, &block'
    class_binding.eval str
  end
  singleton_class.undef_method :def_, :class_binding
end
```
The main difficulty is to implement `Object::def_`.
We can accomplish this just by editing the `Object#def_after` we
defined before:
```ruby
class Object
  # the method is going to be undefined soon
  def self.def_ sym, &def_block
    # pat: when refine_block is nil, it is used to represent a refinement
    # singleton: force singleton when self is a Module
    define_method :"def_#{sym}" do |method_name, pat = nil, singleton: false,
                                    &refine_block|
      singleton ||= !is_a?(Module)
      # mod: the module containing the old method
      # get_method: the method to get the Method/UnboundMethod obj
      # def_method: the method to define a new method
      mod, get_method, def_method = singleton ?
          [singleton_class, method(:method), method(:define_singleton_method)] :
          [self, method(:instance_method), method(:define_method)]
      # get visibility
      visibility = mod.method_visibility method_name
      # get pat
      pat = refine_block || {
        to_sym:  ->symbol { get_method.(symbol.to_sym) },
        to_proc: :to_proc.to_proc,
        call:    ->callable { callable.method :call }
      }.each do |duck, out|
        break out.(pat) if pat.respond_to? duck
      end
      # get old
      old = get_method.(method_name)
      # override
      def_method.(method_name) do |*args, **opts, &block|
        # bind old
        old = old.bind self unless old.is_a? Method
        # bind pat
        pat = pat.bind self unless pat.is_a? Method
        # call the new method
        def_block.(old, pat, *args, **opts, &block)
      end
      # set visibility
      mod.__send__ visibility, method_name
    end
  end
end
```
The final source code can be found [here](/assets/codes/patch_def.rb).

The reason why I do not use `Module#refine` and `Module#using` is
that they currently have too much limitations and even bugs.
I have already found as many as two bugs
([#16107](https://bugs.ruby-lang.org/issues/16107){:target="_blank"}
and
[#16617](https://bugs.ruby-lang.org/issues/16617){:target="_blank"}).
Although both of them have been fixed (or will be fixed),
I cannot be sure that there will not be further and fatal bugs.
I do not think these features are very reliable in recent Ruby versions.
