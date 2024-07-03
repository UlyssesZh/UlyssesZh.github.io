---
title: Writing a DSL with commands split by space
date: 2020-04-27 20:39:39 +0800
categories:
- programming
tags:
- ruby
- meta programming
layout: post
excerpt: 'DSL means domain-specific language.
Ruby is a powerful script language in terms of building DSLs (as sublanguages of Ruby).
In this article, I implemented my idea of a DSL with commands split by space.
For example, you may just write `a b c` to run the commands `a`, `b`, and `c` one after another!
This trick is heavily applied in my project [alda-rb](/doc/alda-rb).
How do I achieve this?'
---

We want to have a DSL where we can write statements separated with space.
Like this:

```ruby
Robot.new do
	a b c
	d e
	f g h i
	j
end.run
```

<p class="no-indent">
outputs
</p>

```plain
Go to a
Go to b
Go to c
Go to d
Go to e
Go to f
Go to g
Go to h
Go to i
Go to j
```

Since separating by space means method invocation in Ruby,
we need to hack into `method_missing`.

I am just posting the codes and will not give it further explanation.
Look into the details yourself.

```ruby
class Robot
	attr_accessor :movements
	def initialize &block
		@movements = []
		@last_length = 0
		instance_eval &block if block
		rearrange
	end
	def method_missing name, *args
		case args.size
		when 0
			rearrange
			@movements.push result = Movement.new(name)
			@last_length += 1
			result
		when 1
			@movements.push result = Movement.new(name)
			@last_length += 1
			result
		else
			super
		end
	end
	def rearrange
		last_movements = @movements.last @last_length
		@movements[@movements.size - @last_length..] = last_movements.reverse
		@last_length = 0
	end
	def run
		puts @movements
	end
	class Movement
		attr_accessor :target
		def initialize target
			@target = target
		end
		def to_s
			"Go to #@target"
		end
	end
end
```

Similar tricks are used in my other Ruby project [alda-rb](/doc/alda-rb/).
The codes can be found
[on GitHub](https://github.com/UlyssesZh/alda-rb).
