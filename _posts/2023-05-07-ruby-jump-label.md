---
title: 'Labeled `break`, `next`, and `redo` in Ruby'
date: 2023-05-07 13:36:16 -0700
categories:
- programming
tags:
- meta programming
- ruby
layout: post
excerpt: 'Many languages support breaking out of nested loops,
such as Perl, Java, JavaScript, C#, etc.
Languages that have `goto` can also do this easily.
However, in most other languages, it is not easy to break out of nested loops.
I want to introduce a way to do this in Ruby.'
---

Many languages support breaking out of nested loops.
There are some typical ways of doing this:

- Some languages can name loops by providing a label for the loop.
In those languages, you can use `break` together with a label to specify which loop to break out of.
Examples: Perl, Java, JavaScript, and some others.
- Some languages can specify the number of layers of loops to break out of.
In those languages, you can use `break` together with a number
to specify how many layers of loops to break out of.
The only example that I know is C#.
- Some languages have `goto` statements.
You can easily break from loops to wherever you want by using `goto`
(actually breaking out of nested loops is among the only recommended cases for using `goto`).
Examples: C, C++.

However, in most other languages, it is not easy to break out of nested loops.
A typical solution is this:

```ruby
outer_loop do
	break_outer = false
	inner_loop do
		if condition
			break_outer = true
			break
		end
	end
	break if break_outer
end
```

In languages with exceptions, another possible workaround is to use exceptions
(the catch--throw control flow):

```ruby
catch :outer_loop do
	outer_loop do
		inner_loop do
			throw :outer_loop if condition
		end
	end
end
```

I wrote a simple module to better use this workaround.

```ruby
class JumpLabel < StandardError
	attr_reader :reason, :arg
	{break: true, next: true, redo: false}.each do |reason, has_args|
		define_method reason do |*args|
			@reason = reason
			@arg = args.size == 1 ? args.first : args if has_args
			raise self
		end
	end
end

class Module
	def register_label *method_names
		method_names.each do |name|
			old = instance_method name
			define_method name do |*args, **opts, &block|
				return old.bind_call self, *args, **opts unless block
				old.bind_call self, *args, **opts do |*bargs, **bopts, &bblock|
					block.call *bargs, **bopts, jump_label: label = JumpLabel.new, &bblock
				rescue JumpLabel => catched_label
					raise catched_label unless catched_label == label
					case label.reason
					when :break then break label.arg
					when :next then next label.arg
					when :redo then redo
					end
				end
			end
		end
	end
end
```

Example usage:

```ruby
Integer.register_label :upto, :downto
1.upto 520 do |i, jump_label:|
	print i
	1.downto -1314 do |j|
		print j
		jump_label.break 8 if j == 0
	end
end.tap { puts _1 }
# => 1108
```
