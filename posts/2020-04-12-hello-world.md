---
title: Hello World
tags: meta
---

Hello world! And welcome to Restyled's first blog post.

```hs
main :: IO ()
main = puStrLn "Hello world"
```

This post serves as an (overdue) introduction to Restyled the product. Its
purpose is to provide context for the more technical posts that I hope will
follow on this blog. If you're already familiar with the product, feel free to
skip this post.

### What is Restyled?

Restyled is a [GitHub App][app] for moving to, and maintaining a consistent
style throughout your projects -- regardless of who is contributing, or what
language(s) you work in.

[app]: https://github.com/marketplace/restyled-io

### Why does this matter?

It's not particularly contested that working in a code-base with a consistent
style has very real and tangible benefits. These range from personal happiness,
to improved readability and understand-ability, to reduced bugs.

Developers, in my experience, tend to fall into one of two camps on this:

1. These benefits are so important that we should work towards this consistent
   style in any way possible -- including detailed style guides and rigid
   enforcement through code review.

1. These benefits are not worth the very real human tax of endless subjective
   style discussions, nitpicked code review, and ultimately humans being humans
   and ending up with inconsistent style anyway.

For much of my own career it was not possible to unify these camps. You either
cared or you didn't. And if you did care, you would piss off the folks who
didn't -- and vice versa.

However, there has been significant advancement in the auto-formatter space, as
pioneered by `gofmt`. This offers a new stance that I think both camps can rally
behind: _just fix it for me_.

In this world, you never think about style -- but you also live in a completely
consistent code-base. You type things out and in a flash all the code snaps into
whatever the defined style is for that project. All of the benefit, none of the
work.

(Maybe you're not convinced, maybe you think the auto-formatted style is ugly,
I'd encourage you to try it out for a week or two. As someone from the first
camp, who took pride in knowing and enforcing a consistent style across the
team, the experience of letting go has been _delightful_.)

### So what's the problem?

Let's say you jump on this. You've found, selected, and/or configured an
auto-formatter to address style and you expect to never think about it again.

What happens when someone else contributes to this project? Maybe it's open
source, or maybe this is a work project with a large team. Can you expect
everyone on your team to run the same tooling in this area?

What if someone who typically works on the JavaScript side is going to make a
quick Backend change, or your Haskeller wants to fix a Frontend bug? Can they be
expected to have this level of local tooling correctly-configured all the time
-- for a language they don't typically use?

Of course not. Instead, you'll find your auto-formatter generating huge and
unnecessary diffs in your Pull Requests, because you happened to touch a file
that someone else had authored. You find yourself still constantly dealing with
style, just from another angle -- and worse, the auto-formatter feels at fault.

### How does Restyled help?

Restyled takes a complementary approach to whatever editor tooling or git-hooks
you've decided to set up. When any collaborator opens a Pull Request, Restyled
runs any changed files through its known auto-formatters. [There are
many][restylers] (and you can easily [contribute what's missing][add_restyler]),
and they will respect any configuration you've defined within the repository
([or in a file that can be downloaded][remote_files]).

[restylers]: https://github.com/restyled-io/restyled.io/wiki/Available-Restylers
[add_restyler]: https://github.com/restyled-io/restyled.io/wiki/Adding-a-Restyler
[remote_files]: https://github.com/restyled-io/restyled.io/wiki/Configuring-Restyled#remote-files

If it finds differences after "restyling", it opens a new Pull Request with
yours as its base:

![](https://restyled.io/static/img/docs/minor-differences.png)

To accept the style fixes, you can merge that Pull Request into yours without
ever leaving GitHub.

![](https://restyled.io/static/img/docs/merge-button.png)

This "PR-from-PR" flow is meant to be un-obtrusive and easy for the occasional
contributor making minor or drive-by changes. They see the restyled Pull
Request, merge it and move on. For those that are constantly having all of their
Pull Requests re-written by Restyled, they will probably seek to configure their
editors to match the rest of the team. In this way, Restyled acts as a
(friendly) forcing function, naturally nudging the team towards a consistent
setup and outcomes.

👉 If you're interested in trying this out, head over to the [GitHub
Marketplace][app].

## What else?

All code powering Restyled, from the web app, to the backend services, to the
operational tooling is itself [open source][org]. This means you can dig into
every aspect of how Restyled works, [track what we're working on][project] as it
happens, contribute your own fixes, or even [stand up an instance in your own
VPC][stacks].

[org]: https://github.com/restyled-io
[project]: https://github.com/orgs/restyled-io/projects/1
[stacks]: https://github.com/restyled-io/ops/tree/master/infra/stacks

## What's next?

On this blog, I plan to discuss mostly technical details about how Restyled is
built and operates. I may also announce new features, discuss outages, or
present product level decisions for feedback. Here are some ideas I'm
considering, which I'll replace with links once the content lands:

- **Automatically Scaling Restyled**: architecture overview, focused on our
  "Restyle Machines", which is a group of instances that automatically resize
  according to queue depth -- all built with AWS primitives

- **Penny Jobs**: outlining our all-in costs and how we do what we do for 10,000
  Restyle Jobs for under $100 every month

- **Suggested Changes**: why implementing Restyled on GitHub's Suggested Changes
  feature makes total sense, but is also nearly impossible

- **Contributor Round-up**: thanking everyone who has contributed fixes or
  Restylers to this project so far

- **CHANGELOG Back-fill**: a post or posts detailing important changes to
  Restyled's features that landed over the lifetime of the project

Until then, cheers!
