---
type: news
layout: news_item
title: SchemaType! Can you define that for me?
date: 2016-07-05 09:00:00 -0700
author: ingydotnet
categories: [blog]
---

SchemaType is a new definition language for data. More specifically the data
formats of the web that don't already have definitions. Formats like YAML, JSON
and CSV. Basically any format where the data is (or can be) represented as
"objects"; ie mappings of known string keys to typed values. There's more to
the language of course, but defining objects is certainly a core principle.

SchemaType, as the name implies, defines **schemas** and **types**. Effectively
schemas and types are the same thing: named structural and semantic definitions
of data points. The word "type" is usually applied to single values; things
like "string", "integer", "boolean" and "date". The term "schema", on the other
hand, is applied to data collection types; things like "address", which might
be composed of "street", "city", "state", and "postal-code". The SchemaType
language is concerned with the definitions of both.

#### Define the Data Web by 2018

The SchemaType project would like to define all open, undefined data in the
next 2 years. This is a lofty goal, but the return on investment is grand, as
I'll try to show. Also, it turns out that schema can be substantially generated
from valid data, so the data of the web could be crawled and a massive set of
schemas could be started.

How would this be useful though? Glad you asked. It is my belief that software
development is moving away from people writing code, and having computers write
(generate) code from data. Writing and maintaining the same kinds of code for
every data source in many programming languages becomes infeasible. There are
many types of code that can be written for you, and written better and faster
and more continuously than any human possibly could. If you accept this logic,
then the only programming left to do is writing the code that generates more
code.

I think we are a long ways off from replacing software development with code
generation, but we can make inroads immediately. What's missing? Well the
biggest missing part is accurately defined data, ie **Schema**. Schema needs a
language that can move beyond basic validation, and provide richer semantic
info (I like to call them "hints") on what code should be generated in various
contexts. For instance, declaring that an object property is a "string" is
fairly useless. Saying that it is a multi line, printable unicode text
paragraph (which happens to inherit from string), can provide an input UI
generator with the right hint to make a good UI.

Here are a few of the kinds of code that generation I see Schema helping make
possible:

* Data validation (obviously)
* End user input UI
* Data visualization
* Test data generation
* Language specific "typedef" code
* Translators between formats
* RDBMS modeling and SQL generation
* Protobuf definition generators

I'll talk more about each of these points in upcoming posts.

#### Why SchemaType?

As one of the creators of YAML, I have known for a decade that Schema is the
next big effort. It seems that now, in the middle of 2016, all the stars have
aligned, the mass has become critical and time is ripe for SchemaType.

JSON Schema is the closest effort to compare SchemaType to. It has gained some
acceptance in various places but seems to have stalled out in forward progress.
Still it is a good starting point to research, as much time has been invested
in it. I believe SchemaType will offer at least these advantages:

* Simpler to author, read and maintain
  * JSON Schema gets too complex too quickly
  * SchemaType docs look closer to the data they are defining
* Easy to publish and share important schemas
  * Like GitHub, _forking_ schemas is a good thing
* Leverage ready-made code generation tools
  * SchemaType will have an ever growing set of tools
* Provide type/schema definition immutability
  * Schemas import other schemas at specific commit points
* Provide digital signing to published open types
  * Know, verify and trust the sources of your import schemas
* Promote multiple authorities of trust
  * Anyone can define, host, fork the base schemas
* International
  * SchemaType will consider I18N issues from the get-go

To get things rolling with SchemaType, early implementations will be able to
not only import JSON Schema to SchemaType but also to export SchemaType
definitions back to JSON SchemaType. Therefore if you are already invested in
JSON Schema, it will be easy to either make the switch, or simply use the more
expressive and elegant SchemaType and then save it back to JSON Schema.

#### Join The Schema Revolution

Strong type definitions for simple open data sources, combined with code
generators for the common parts of software development is the future; and you
can help bring it about sooner. SchemaType will be defined and implemented in
the open. If you are interested please [join us](http://www.schematype.org/help/).

Yours truly, Ingy döt Net.
