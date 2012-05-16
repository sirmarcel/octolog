---
layout: post
title: "Greeting the Kraken"
date: 2012-04-05 15:39
comments: true
categories: 
- Articles
- English
- Web
- Design
- Meta
- Octopress

meta:
 sub: So long, Wordpress.
 img: octopress
---

*TL;DR: I moved this blog from Wordpress to Octopress, and used the chance to touch up the design. Hopefully, you like it as much as I do, if you notice any wonkiness, let me know. And now for the nerdiness.*

It all started with a small realisation: Even though running this blog on a virtual private server at [Slicehost](http://slicehost.com) taught me a lot about the way the web works, I really don't have the knowledge (and spare time) to keep everything running smoothly and securely. So I decided to move to [Webfaction](http://webfaction.com), a hosting company that provides managed web hosting while still allowing SSH access.

The mere thought of once again migrating Wordpress, however, sent shivers running down my spine. I did the only logical thing: I decided to move my blog to [Octopress](http://octopress.org). Of course, that's not exactly less work, but certainly a lot more interesting than just screwing around with database dumps, weird encoding issues and other assorted Wordpress shenanigans. And let's face it: Interesting beats the crap out of slightly easier, but boring every single time. It's hard to resist playing with a new tool.

Octopress is everything Wordpress is not. While Wordpress runs on your server, dynamically rendering pages as users come along and request them, Octopress runs locally and just generates every single page of your blog exactly once and then saves them as static HTML files. It even automatically uploads these files to a web server, and once they get there, you have a ridiculously fast web site that is almost impossible to break. The first one appeals to my inner nerd, the latter to the little paranoid guy sitting on my shoulder... Perfect.

As a result, obviously, Octopress is incredibly nerdy. It doesn't try to hide the technology behind it the way Wordpress does, it (rightfully) calls itself a "blogging framework for hackers". There is no graphical user interface, just a bunch of cunningly arranged Ruby scripts, config files and assorted command line tools. Obviously, this fact makes it utterly unusable for about 90% of the blogging population{% fn_ref 1 %}, but amazing for the people that (at least kind of, in my case) know what they're doing. 

Where was I? Ah. I had just decided to switch to Octopress. At that point, I was aware that there was a way to transfer posts, but none to migrate the template. So I ended up deciding to also write a new theme. In a few minutes of arguing with myself, the simple decision to change my hosting company had cascaded into a complete overhaul of the front- and back end of this blog. I sometimes suspect that this is not a very practical way to handle minor changes in infrastructure, but at least it's incredibly fun.

### Migration

Octopress processes blog posts as individual, markdown-formatted text files. This is, of course, terribly cool. To edit a post, you just open a plain-text file on your computer in your favourite text editor, save and run one single script. No more logging into weird, slow web interfaces, just some sweet plain-text editing.

Before enjoying that, however, you need to somehow get the posts out of the Wordpress database and into neatly separated text files. Fortunately, Wordpress has a built-in export function that generates a single XML file with all blog posts, and Octopress comes with a migration script that is able to parse that single file into correctly formatted, separated files. It even correctly assigns the posts their original tags and categories. The only thing it (obviously) couldn't deal with was my quite hacky, custom way of doing link posts. Luckily, with the help of a friend, [pfleidi](https://twitter.com/pfleidi), I finally managed to get that working as well. There were a few weird cases where I had to manually intervene, especially with the posts that used the Wordpress way of dealing with images, but overall, the process was pretty straightforward. Nothing to be afraid of.

### Theme

In the last fews months, I have seen more and more blogs being redesigned with very pared-down, minimalist layouts that greatly rely on beautiful web typography provided by [Typekit](http://typekit.com) and similar services. Maybe that's a bit of a backlash against the widget-crazy "Web 2.0" times where every blog post absolutely *needed* about a dozen different sharing buttons. It's also an aesthetic I can absolutely agree with. (Additionally, I'm lazy, and building a minimal layout is just *easier* than implementing every possible feature under the sun.) I decided to run with that, and after a bit of pondering and discussing and staring at [Kottke](http://kottke.org), [Es Bueno](http://esbueno.noahstokes.com/) and [Pat Dryburgh's blog](http://patdryburgh.com/), I decided that I didn't need a sidebar. "Go, go, single column!" I thought, quickly sketched a first draft and started to look for a nice, minimal template to build on. Just customising the default Octopress theme was not really an option; I like to actually (at least mostly) understand how the design works. I finally settled on forking [Ethan Turkeltaub's](http://ethan.heroku.com/) theme. It's a very basic one, but that's what made it a perfect starting point for learning the templating language Octopress uses. And boy, it's a step up from Wordpress, where you practically insert straight PHP into your template to make it work. 

Actually developing the theme was pretty straightforward. Once I got a basic layout working, I could just iterate and add features as I went along. Octopress seems to be built for this kind of development. It supports SCSS out of the box, which makes writing CSS about 20% less annoying and also has a built-in preview mode. You just type "rake preview" into the command line to start a local web server that even auto-compiles SCSS files when they are saved.{% fn_ref 2 %}

When I finally added the fonts from Typekit, it was a revelation. I'm completely in love with Museo Slab and Museo Sans, especially with the way they look on Retina screens. Just stunning. Every single site on the web should have nice fonts like this. It's not even that much work, the hardest part is choosing the right ones.

Because this blog now has a single-column layout, it was ridiculously easy to make it responsive. At the moment, it basically just stays fixed for screen sizes (or browser window widths) above 800 pixels and simply scales to 90% of the width below. I am amazed by the fact that this works so well and so easily. There are only very minor changes in the design I had to make for smaller screens: The font size decreases slightly below 640px to save everyone a bit of scrolling on iPhones and the two columns in the footer stack on top of each other. That's about it. I don't really know what to do with the article heading on the iPhone, though. They don't look particularly broken right now, but it's not perfect either. We'll see.

If you're still reading at this point, you deserve a web geek medal and should probably just head over to [Github](https://github.com/sirmarcel/octolog) to peek at the source code first-hand. It's not that much. :) Feel free to fork it and make it your own. Just change the colours and fonts a bit, I'm not terribly comfortable with two blogs looking exactly alike. It's creepy.

Well, that's pretty much all I have to say. And that, my friends, is how you don't finish an article.


{% footnotes %}
{% fn 1. Which is perfectly legitimate. Nobody should need to fool around on the command line just to put content on the web. That's something many nerds tend to forget: The web no longer belongs only to people who know how to code, and it's better off that way. I don't want a brilliant writer to waste his time reading documentation when he could be writing his next story instead. %}
{% fn 2. Here's a little pro tip: When you start developing, move the category_generator.rb plugin out of the plugin directory. If you're just testing the layout, you don't really need to render new categories every few minutes. Don't forget to actually build a category archive template and re-enable the plugin, though. ;) %}
{% endfootnotes %}
