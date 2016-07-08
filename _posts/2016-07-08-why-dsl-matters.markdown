---
type: news
layout: news_item
title: Why DSL Matters
date: 2016-07-08 09:00:00 -0700
author: ingydotnet
categories: [blog]
---

In [my last post](/news/2016/07/06/schematype-basic-language-design/) I gave
you an introduction to the SchemaType language. It was meant to raise questions
and I got a few. Mostly they were centered around using DSL shortcuts instead
of using pure data. In this post I'll tell more of the SchemaType language
story.

Let's consider this [JSON Schema flagship
example](http://json-schema.org/examples.html).

```
{
    "$schema": "http://json-schema.org/draft-04/schema#",
    "title": "Example Schema",
    "type": "object",
    "properties": {
        "firstName": {
            "type": "string"
        },
        "lastName": {
            "type": "string"
        },
        "age": {
            "description": "Age in years",
            "type": "integer",
            "minimum": 0
        }
    },
    "required": ["firstName", "lastName"]
}
```

In SchemaType, this would look like:

```yaml
-spec: schematype.org/v0.0.1
-from: github:schematype/type/#v0.1.2
-desc: Example Schema
firstName: +string
lastName: +string
age?: +int 0.. --Age in years
```

Two things come to mind. Either you love it because it is so tight, or you hate
it because it is so tight! Well don't worry, SchemaType has you covered.

The DSL syntax used above is just syntactic sugar for the more explicit syntax:

```yaml
firstName:
  -type: string
lastName:
  -type: string
age:
  -type: int
  -min: 0
  -desc: Age in years
  -opt: true
```

You can also use a mix like this:

```yaml
firstName: +string
lastName: +string
age?:
  -: +int 0..
  -desc: Age in years
```

For the `age` field we use the DSL for the type and `min` constraint. These go
under the special `-` key which indicates DSL is in the value. This is needed
since the outer value is an object now, instead of a single YAML string value.
Then we use the explicit `-desc` for the description field. You might find that
this form looks best in your schema.

Note that in the more explicit example above, there is still some DSL; namely
the `-` in front of the SchemaType keywords. Of course we can work out other
ways to turn that into data too, but then we approach looking like JSON Schema.

The point is to make these documents, which can become massive in size,
readable and maintainable. What happens when the schema you are defining has an
object with keys like "type", "description" and "required"? Well you have to
figure out what level you are at to determine whether they are for your schema
or for JSON Schema. With SchemaType, everything is instantly recognizable
because of the DSL features.

That's the main point that I want to convey in this post. For SchemaType to
become popular it not only needs to be extremely powerful, it needs to have a
flexible syntax so that people actually like working with it. You might have
noticed that even though SchemaType is a YAML based format, none of the YAML
quoting styles are ever used. This is on purpose. YAML only requires quoting
when the first character is a space or YAML syntax character, or when there is
a `_#` or `:_` sequence in the string. The SchemaType DSL syntax is careful to
avoid these so that you can use unquoted strings for everything.

One nice thing about the SchemaType syntax is that you don't need to decide up
front which style to use. The `schematype` CLI can reformat your schema files
for you:

```
$ schematype format --compact some.schema
$ schematype format --explicit some.schema
```

In fact, SchemaType schemas get compiled before they are used. All the external
references are pulled in and tied together into one big and very explicit data
structure that is even more unreadable than JSON Schema. You never need to look
at these files unless you are debugging something. When you publish a
SchemaType schema, you are encouraged to publish the compiled form:

```
$ schematype compile --sign some.schema -o some.schema.v0-0-1
```

This will create a digitally signed compiled schema file, that other schema
types will use when they reference your hosted schema.

#### Stay Tuned

I've written a few blog posts this week to give you an idea of where SchemaType
is headed as a language and as a software development framework. The next
things I'll be working on are:

* SchemaType Language Documentation
* `schematype` CLI tool
  * `compile` a SchemaType schema file to the canonical immutable form
  * `import` a SchemaType file from an existing JSON Schema file
  * `export` a SchemaType file to a JSON Schema file
  * `validate` a data file against a schema file
  * `generate` various software components. Examples:
    * Go lang data structs
    * HTML input form
    * SQL schema file
    * Protobuf message definition
    * Swagger v2 schema definitions
* Start the SchemaType v0.0.1 specification

[Please join me](/help/) if you have ideas to contribute or just want to play
along. Cheers!

-- Ingy döt Net
