# Advent of Code 2025

Ah, it is that time of year again. I truely _love_ [Advent of Code](https://adventofcode.com/) (AoC).
Eric Wastl's creativity, ranging from story telling and web site design to engaging puzzles brings
joy to each December.

And despite how much I enjoy AoC, I have never completed all of the puzzles.
This might surprise many people because I'm so enthusiastic about it. I use the yearly pilgrimage
to save Christmas to learn a new langauge, hone a skill, or push a technique. One year, I didn't
even finished the first day by the time January arrived. I had fallen into the
write-parser-combinators-in-c++ hole so far I never got out. But I learned. A lot. I first
learned about parser combinators. That got me into all kinds of "problem" teritory like
left recursion. And then I was reminded that I had sat in a C++Now session on parser
combinators... so I had to re-watch that talk and play with the ideas. And because there were
so many references about Haskell, I watched some Haskell talks. You get the idea... a lot
was happening but collecting stars was not one.

Historically, when I'm involved with a community or other people doing AoC I make it much
further. And so this is a _special_ year because I'm participating with Simon!

November 30 at 23:50 I was sitting on a couch at an AirBnB with my son ([Frosted-Raven](https://github.com/Frosted-Raven/)).
We had joined an "unlock party" on twitch, listening to the beats and waiting for the first
puzzle to be revealed. December 1 at 00::00 we both refreshed our browsers and I began to read out loud.
The rest of the family laughed at us  (o;

When I completed reading, Simon declared: "I'm going to do the puzzles in Haskell!"

So, this is the year that I'm finally going to learn Haskell. Thank you AoC for all the fun. Thank
you for providing opportunity to learn through creativity. Thank you for community and connections
that come from a shared experience.

## Learning Haskell

I use AoC to learn, grow, strengthen ... and to have fun! I have been exposed to Haskell since
2009-ish through BoostCon. As an Electrical Engineer, many Computer Sciencey things are "new"
by name but familiar in some strange way. My exposure to functional programming really started in
2009 when I fell into a crowd of Boost authors and was introduced to Template Meta-Programming (TMP)
and the glorious art of beautiful interface/library design. I was star-struck! Joel de Guzman became
a good friend and I began filling my toolbox with techniques and idioms that changed what I thought
was possible. Those BoostCon days were formative as I watched Bartosz Milewski, David Sankel, and
Ben Deane give form and names to the tools I had collected and then provide refinement and clarification
on how to properly handle the sharp parts. But I never really learned Haskell... I would just
squint at the slide and see a pretty version what I was trying to accomplish in C++.

Ben Deane and Luke Valenty were over for dinner during the summer and Simon was intrigued by their
talk about Haskell and the "Learn You a Haskell For Great Good" book. And so here we are! Simon
and I sitting on a couch in a snow-covered AirBnb, installing the Glasgow Haskell Compiler with our
"Learn You a Haskell For Great Good" PDFs open.

Wish us luck!

## The Setup

We are both using WSL and GHCup to get things setup. This seemed like the easiest way to get started.

I want to document my learnings... I don't know why.  (o;

I'm an emacs user so I'm going to use org-mode literate Haskell to document my journey. Of course,
this ended up being a bit of a challenge to setup. Luckily, not a month-long challenge. The `org-babel`
execution happens in ghci and I struggled with what worked out to be multiline issues. Things worked
in an `.hs` file but I just couldn't get stuff going in literate mode.

The _secret_ was to use the `:{ ... :{` syntax. I tried `:set +m` but that has interesting
problems with `do` statements. The `org` files have things like:

```haskell
:{
import Text.Read

findZeros :: [Int] -> Int
findZeros = length . filter (==0)
:}
```

which makes ghci happy at the expense of some minor noise.

(If I was more clever I would setup some lisp hook to do this `:{ ... :{` dance
automagically... but I can assure you I will never learn Haskell if I start
messing with lisp this week).

Each day is contained in an `org` file. Code is in chunks and assigned to sessions which are
supported with `org-babel` and Haskell. All of the buffer can be executed with `M-x org-babel-execute-buffer` which will convently generate the results into the `org` document.

The `org` files can also be tangled to produce the `.hs` file. For example, open `day1.org` and `M-x org-babel-tangle` to produce `day1.hs`.


I'm using the `haskell-mode` package:

```lisp
(use-package haskell-mode
  :mode "\\.hs\\'")
```

and have enabled it in `org-babel` like so:

```lisp
(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (C . t)
        (haskell . t)
        (python . t)))
```

## The Days

You can find the puzzles at [Advent of Code 2025](https://adventofcode.com/2025/). The puzzle "question" and input are available there.

github does a decent job at rendering `org` mode files. These should be readible as-is. The tangled `.hs` files are also checked in.

- [**Day 1**](day1.org) - [*tangled `.hs`*](day1.hs)
- [**Day 2**](day2.org) - [*tangled `.hs`*](day2.hs)
- [**Day 3**](day3.org) - [*tangled `.hs`*](day3.hs)


## References

I have some references that I'm using during this journey.

_Things I'm Actually Reading_

- [**"Learn You a Haskell For Great Good"**](https://learnyouahaskell.github.io/)
  This has been the key reference for my journey. The book is great! I read the first 6-chapters before
  starting Day 1. This was primarily a function of fly across the U.S. during the holiday and not my
  non-existent self-control.

- [**Hoogle**](https://hoogle.haskell.org/)
  I have a love/hate relationship going on so far with Hoogle. I assume that as I grow in this language that it will turn more love.

- **Favorite Search Engine**
  I have used the search engine far less than I thought I might. Occassionally I put some search terms in to help find a function I know
  must exist.

_Things I Have Collected_

- Various University Websites ... I saved links to a bunch but haven't used any yet

