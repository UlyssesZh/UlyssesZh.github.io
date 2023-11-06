---
title: An 🎃 easy 👻 but 🍬 *spooky* 💀 Ruby challenge
date: 2023-10-31 17:30:48 -0700
categories:
- programming
tags:
- ruby
- code golf
- fooling around
layout: post
excerpt: '"It''s the weekend and you''ve just completed a seance with friends.
After communing with the dead, you realize a mysterious message was left behind."
What is the decoded message? Use your Ruby skills to find out!'
---

This was a challenge in the [Ruby Discord server](https://discord.gg/ad2acQFtkh){target="_blank"}.
The contents of the challenge is:<sup>&copy;</sup>

> ## Halloween Challenge
>
> It's the weekend and you've just completed a seance with friends. After communing with the dead, you realize a mysterious message was left behind.
>
> ```plaintext
> 3🍬4🎃04🎃6👻00🎃62🎃6👻32👻5🎃4🍬42🎃4🎃2🎃6🍬3🎃52🍬3🎃6💀0🎃2🎃6🍬13🍬0🎃432👻4👻4🎃230🎃62🎃1🍬03🎃2🍬6
🍬4👻5👻3🎃220🎃5👻0👻5🎃4🎃6👻42🎃4👻01🎃60🍬1🎃2👻3👻30🎃6💀0👻0🍬3🎃5👻0👻5🎃6👻0🍬30🎃61🍬0🎃1🎃2🎃6🎃42👻3🍬03🎃2💀3
🎃0🎃2👻5🎃22🍬3🎃5🎃6🍬3🎃5🎃2🎃6🎃52🍬4👻5🍬3🎃2🎃1🎃6👻4🍬0🍬0👻5🍬6🎃6👻0🍬30🎃604👻5🍬32💀1🎃6💀0🎃2🎃6🎃2💀1🍬1👻3🍬03🎃2🍬6
4🎃2🍬3🎃6👻0👻5🎃6🍬3🎃5🎃2🎃6💀0🍬03👻3🎃1🎃6🍬0🎃3🎃6🍬13🍬0🎃432👻4👻4👻0👻5🎃4🍬6🎃6👻0🍬3🎃6🍬3🎃53👻0🍬5🎃20🎃6🎃2🍬5🎃2👻5🎃6👻4🍬03🎃2💀3
> 
> 👻0👻5🎃6🍬3🎃5🎃2🎃6134🍬1🍬3👻01🎃6👻4🎃2🍬3🎃5🍬0🎃10🍬6🎃6💀0🎃5🎃23🎃2🎃6🎃2🎃23👻0🎃2🎃6🎃0🍬4🎃40🎃6👻424🎃6🍬33🎃22🎃1🍬6
0👻2🎃2👻3🎃2🍬3🍬0👻50🎃6🍬0🎃3🎃6🎃233🍬030🎃6👻0👻5🎃6🍬3🎃5🎃2🎃6🎃123👻2🎃623🎃2🎃6💀0👻0🎃1🎃20🍬13🎃22🎃1💀3
> 
> 👻5🍬0🍬3🎃62🎃6👻32👻5🎃4🍬42🎃4🎃2🎃6🍬0🎃3🎃6🍬3🎃5🎃2🎃6🍬120🍬3🍬6🎃6🎃0🍬4🍬3🎃6🍬0👻5🎃2🎃6💀0🎃2🎃6🎃5🍬0👻3🎃1🎃6🍬0🍬43🎃6🎃5🎃22🎃10🍬6
🍬0🍬5🎃23🎃61🍬0🍬4👻5🍬3👻3🎃200🎃6🍬13🍬0👻1🎃21🍬30🍬6🎃6💀0🎃5🎃23🎃2🎃6👻0🍬30🎃6🍬1🍬0💀0🎃23🎃6🎃520🎃60🍬13🎃22🎃1💀3
🍬3🎃5🎃2🎃6🍬33👻01👻20🎃62👻5🎃1🎃6🍬33🎃22🍬30🎃6🍬0🎃3🎃63🍬4🎃04🍬6🎃6👻3👻0👻2🎃2🎃6💀0👻0🍬31🎃5🎃20👻6🎃61🎃523👻40🍬6🎃61🍬0👻5🍬5🎃2👻5🎃2🍬6
> 
> 🎃132💀0👻0👻5🎃4🎃6🍬40🎃6👻0👻5🍬3🍬0🎃6👻0🍬30🎃6💀0🍬03👻3🎃1🍬6🎃6💀0🎃5🎃23🎃2🎃6🍬3🎃5🎃2🎃60🍬4🎃0👻3👻0👻4🎃2🎃6👻00🎃60🎃2🎃2👻5💀3
🎃2👻51🎃52👻5🍬3👻0👻5🎃4🎃6🍬40🎃6💀0👻0🍬3🎃5🎃6🎃4🎃2👻40🍬6🎃6👻0🍬3👻60🎃6🎃2🍬5🎃234🎃61🍬0🎃1🎃23👻60🎃6🎃13🎃22👻4🍬6
2🎃1🍬5🎃2👻5🍬3🍬43🎃20🎃6👻0👻5🎃6🍬3🎃5🎃2🎃61🍬0🎃1🎃2🍬6🎃6💀0🎃5🎃23🎃2🎃6🍬3🎃5🎃2🎃6🎃2🎃23👻0🎃2👻60🎃63🍬0🍬4🍬3👻0👻5🎃2💀3
🎃1🎃22🍬3🎃5🎃6👻424🎃60🎃2🎃2👻4🎃6🍬3🍬0🎃6👻3🍬43👻2🍬6🎃6🎃0🍬4🍬3🎃6🎃3🍬03🎃63🍬4🎃04🎃6👻0🍬3👻60🎃6🎃52👻3👻3🍬0💀0🎃2🎃2👻56
> ```
> 
> However, with your unique Ouija board you should have no problem deciphering what they left!
>
> ### Objective
>
> Your Ouija board looks like the following
> [straddling checkerboard](https://en.wikipedia.org/wiki/Straddling_checkerboard){target="_blank"}:
>
> ```plaintext
> ==================================
> |    | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
> |    | S | C | A | R | Y | ? | ! |
> | 🎃 | B | D | E | F | G | H |   |
> | 👻 | I | J | K | L | M | N | ' |
> | 🍬 | O | P | Q | T | U | V | , |
> | 💀 | W | X | Z | . | # | $ | : |
> ==================================
> ```
>
> Use your Ruby skills and the board above to decrypt the message.
> I have attached a file to help get you started. You don't need to use it if you don't want to.
>
> You may also find this
> [link](https://www.ciphermachinesandcryptology.com/en/table.htm){target="_blank"} helpful too.
>
> ### Requirements
>
> - Must use Ruby
> - Decrypt the message
> - **Determine the hidden message _within_ the decrypted message**
>

## My solution

I am too stupid to think of regular expressions at first, so I wrote this:

```ruby
" 0123456\n SCARY?!\n🎃BDEFGH \n👻IJKLMN'\n🍬OPQTUV,\n💀WXZ.\#$:".split(?\n).map(&:chars).tap{|b|<<M.chars.reduce(nil){|r,e|e==?\n?print(e): r ?print(b[r][b[0].index e]): b.index{_1[0]==e}||print(b[1][b[0].index e])}}
3🍬4🎃04...
M
```

I did not want to code golf, but I did intend to wrote a one-liner.
It seems hard to understand, but it is pretty straightforward if it is expanded:

```ruby
board = [' ', '0', '1', '2', '3', '4', '5', '6'],
        [' ', 'S', 'C', 'A', 'R', 'Y', '?', '!'],
        ['🎃', 'B', 'D', 'E', 'F', 'G', 'H', ' '],
        ['👻', 'I', 'J', 'K', 'L', 'M', 'N', "'"],
        ['🍬', 'O', 'P', 'Q', 'T', 'U', 'V', ','],
        ['💀', 'W', 'X', 'Z', '.', '#', '$', ':']
message = <<MESSAGE
3🍬4🎃04...
MESSAGE

message.chars.reduce nil do |row, encoded_char|
	if encoded_char == ?\n # newline in the message
		print encoded_char
	elsif row # last char is an emoji, corresponding to a row in the board
		print board[row][board[0].index encoded_char]
		nil
	elsif new_row = board.index { _1[0] == encoded_char }
		new_row
	else
		print board[1][board[0].index encoded_char]
		nil
	end
end
```

Then I realized that I could have used regular expressions, so I wrote a cleaner version:

```ruby
puts <<M.gsub(/([🎃👻🍬💀])?([0-6])/){|s|{nil=>'SCARY?!',🎃:'BDEFGH ',👻:"IJKLMN'",🍬:'OPQTUV,',💀:'WXZ.#$:'}[$1&.to_sym][$2.to_i]}
3🍬4🎃04...
M
```

Then I suddenly become creative and realized that I can use another regular expression to implement a string-based indexing,
and that I can use `-p` option of Ruby command line to save even more characters
(here I smelled code golfing):

```ruby
#!/usr/bin/env ruby -p
gsub(/(\D?)(\d)/){'SCARY?!🎃BDEFGH 👻IJKLMN\'🍬OPQTUV,💀WXZ.#$:'[/#$1.{#$2}(.)/,1]}
```

Here are some [other solutions](https://gist.github.com/ParadoxV5/77cab0e2b47004712deba623fe5ea816){target="_blank"}.
Check them out!

### Some explanations for the code golf solution

- The `-p` option basically wraps the code in a `while gets` loop, and you can access the current line with `$_`.
Ruby will output the contents of `$_` after each iteration.
- The method `Kernel#gsub` modifies `$_` (the current processing input line).
It is only available when running Ruby with `-p` option.
- The method `String#[]` returns a substring.
What is good about this method is that, if you use a regular expression to find the substring,
you can use the second argument to specify which capture group in the regular expression you want to return.
- In a string literal, you can use `#$some_global_variable` as a shortcut of `#{$some_global_variable}`.
This is also true for instance variables and class variables.

## The message

The decoded message is:<sup>&copy;</sup>

```plaintext
RUBY IS A LANGUAGE THAT WE PROGRAMMERS ADORE,
UNLEASHING MAGIC SPELLS WITHIN ITS CODE GALORE.
BENEATH THE HAUNTED MOON, ITS SYNTAX WE EXPLORE,
YET IN THE WORLD OF PROGRAMMING, IT THRIVES EVEN MORE.

IN THE CRYPTIC METHODS, WHERE EERIE BUGS MAY TREAD,
SKELETONS OF ERRORS IN THE DARK ARE WIDESPREAD.

NOT A LANGUAGE OF THE PAST, BUT ONE WE HOLD OUR HEADS,
OVER COUNTLESS PROJECTS, WHERE ITS POWER HAS SPREAD.
THE TRICKS AND TREATS OF RUBY, LIKE WITCHES' CHARMS, CONVENE,

DRAWING US INTO ITS WORLD, WHERE THE SUBLIME IS SEEN.
ENCHANTING US WITH GEMS, IT'S EVERY CODER'S DREAM,
ADVENTURES IN THE CODE, WHERE THE EERIE'S ROUTINE.
DEATH MAY SEEM TO LURK, BUT FOR RUBY IT'S HALLOWEEN!
```

(The contents do not share the license of this blog.)

Did you spot the hidden message?
