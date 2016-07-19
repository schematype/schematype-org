---
layout: docs
title: Welcome
permalink: /docs/home/
redirect_from: /docs/index.html
---

This site aims to be a comprehensive guide to SchemaType.

## What is SchemaType?

SchemaType is a Data Definition Language for structured data formats like YAML,
JSON, CSV, etc. Traditionally, DTDs are used for data validation. SchemaType
has this goal, certainly, but it goes much further than that. When data is well
defined, much of the software that deals with the data can be generated rather
than written by hand. Put another way, the more well-defined data you have in
your system, the less code you have to write.

Interestingly, the data definitions (schemas) can be partially generated from
valid input. THe more valid input that you feed such a generator, the more
accurately it can define the schema. This makes the adoption of SchemaType
easier and more appealing. Use your data to create the schema; review and tune
it by hand; then use the schema to generate much of your software.

This guide describes the SchemaType language in full. It has reference material
and also tutorials for getting you up to speed. It also describes the reference
implementation: a CLI tool called `stp`, which also runs the online SchemaType
Editor.

## Helpful Hints

Throughout this guide there are a number of small-but-handy pieces of
information that can make using SchemaType easier, more interesting, and less
hazardous. Here’s what to look out for.

<div class="note">
  <h5>ProTips™ help you get more from SchemaType</h5>
  <p>These are tips and tricks that will help you be a SchemaType wizard!</p>
</div>

<div class="note info">
  <h5>Notes are handy pieces of information</h5>
  <p>These are for the extra tidbits sometimes necessary to understand
     SchemaType.</p>
</div>

<div class="note warning">
  <h5>Warnings help you not blow things up</h5>
  <p>Be aware of these messages if you wish to avoid certain death.</p>
</div>

<div class="note unreleased">
  <h5>You'll see this by a feature that hasn't been released</h5>
  <p>Some pieces of this website are for future versions of SchemaType that
    are not yet released.</p>
</div>

If you come across anything along the way that we haven’t covered, or if you
know of a tip you think others would find handy, please [file an
issue]({{ site.repository }}/issues/new) and we’ll see about
including it in this guide.
