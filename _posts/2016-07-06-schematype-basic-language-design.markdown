---
type: news
layout: news_item
title: SchemaType Basic Language Design
date: 2016-07-05 09:00:00 -0700
author: ingydotnet
categories: [blog]
---

In [yesterday's post](/news/2016/07/05/schematype-can-you-define-that/) I
talked in broad terms about the scope, purpose and intention of SchemaType
without actually showing what the language looks like.  In this post I'll fix
that!

Assume you have this `person.yaml` file:

```yaml
name: Ingy döt Net
age: 17
dead: false
```

The simplest way to define a `person.schema` file might look like this:

```yaml
name: string
age: integer
dead: boolean
```

This is the starting point of SchemaType. Let's talk about what we have so far.
First off the overall input format for SchemaType is YAML. Note that since JSON
is a proper subset of YAML, you could also write SchemaType files in JSON.

The definition of an object is simply a mapping of its keys to the _type_ of
its value. This is very simple (which is good), but it's too simple to be a
real language. Let's move forward with a few additions:

```yaml
-name: /person
-desc: Data about a person
-spec: schematype.org/v0.0.1
-from: github:schematype/type/#v0.1.6

name: +human/name
age: +int 1..100
dead?: +boolean
```

This _is_ a valid and complete SchemaType definition. You could publish this
file for reuse at `http://yourdomain.net/person.schema`.

The first thing you probably noticed are the unusual punctuation characters
like `-`, `+`, `?` and `%`. SchemaType is a _YAML based **DSL**_. The intention
of the DSL is to keep the definitions concise. At the expense of learning just
a few syntax concepts, you can keep simple things simple and massive things
manageable.

Keys that begin with a `-` belong to the SchemaType language. The first 4 keys
will be present in almost every SchemaType definition.

The `-name` field refers to the name of the type being defined in this file. It
should match the base name of the file that it is stored in. A SchemaType file
can define multiple types. In that case the name should be set to `/` and the
file name should be `index.schema`. A condensed example of an `index.schema`
file that defines the types `type1` and `type2` would look like:

```
-name: /
+type1: ...
+type2: ...
```

Interestingly the `...` is actually SchemaType syntax. It denotes a type
reference of `+any`, ie any type. More about that in a future post.

The `-desc` field is a short description of the purpose of this schema. The
`-spec` field indicates the version of the SchemaType Language Specification
being used.

The most important keyword here is `from`. Within a SchemaType definition,
types are referenced by names preceded with a `+`. In reality, each `+type1`
reference expands to a full URL like
`https://github.com/schematype/type/blob/f54b0aa/type1`. The `-from` is a set
of type shorthands to their immutable definition URLs. Again, more about that
in future posts.

Back to the meat of our SchemaType example from above:

```yaml
name: +human/name
age: +int 1..100
dead?: +boolean
```

If you see a SchemaType definition that uses `+string` it should be a red flag
that the schema author is DoingItWrong™. The `+human/name` type (defined by
`schematype/type`) inherits from `+string` but it places much more strict
constraints on valid values. For instance a URL or a GUID or the full text of
the US Constitution are all valid strings but will not be valid names of
people.

SchemaType is very big on type **inheritance**. SchemaType only defines 5 types
in its spec: `String`, `Number`, `Boolean`, `Null`, and `Any`, but none of
these are ever referenced directly in schemas.

Next consider the `age` field. This is actually creating a new temporary or
anonymous type. It inherits from `+int` but then places a range constraint on
it. Another way to do this would be:

```yaml
name: +human/name
age: +age
dead?: +boolean

+age: +int 1..100
```

The difference here is that we named the subtype. It is therefore available
publicly as `person/age` in our schema publication.

Last, but certainly not least is the `?` n `dead?`. It simply means that the
`dead` key/value pair is optional. This implies the `name` and `age` are
required. And that's true. All keys in a definition are required by default.
This stands in contrast to JSON Schema where all pairs are optional by default
and unspecified keys are allowed. To allow any extra key/value pair in
SchemaType you need to declare it like this:

```yaml
name: +human/name
age: +int 1..100
dead?: +boolean
...: ...
```

There's that `...` again. This means that any key is allowed to map to any
value type.

That wraps up the explanation of a very basic SchemaType document. For
comparison, let's look at the JSON Schema equivalent of our example:

```json
{
    "$schema": "http://json-schema.org/draft-04/schema#",
    "title": "Person",
    "type": "object",
    "properties": {
        "name": {
            "$ref": "https://example.com/json.schema#human/name"
        },
        "age": {
            "type": "integer",
            "minimum": 1,
            "maximum": 100
        },
        "dead": {
            "type": "boolean"
        }
    },
    "additionalProperties": false,
    "required": [
      "name",
      "age"
    ]
}
```

This is a _rough_ equivalent. This example is not so bad because you can see
the whole thing on one page. In reality, JSON Schema gets unwieldy fast. A
primary reason is that things like `required` are not made known in the place
where the key is defined. I've seen many files where that information is 1000s
of lines apart. The other thing is that it is hard to tell what parts are the
JSON Schema language words and what parts are the data you are defining.
SchemaType tries to make all this easy, compact and less painful.

This post is an introduction to the language basics. It was intended to raise
more questions than it answers. There is much more to cover, but hopefully
that's enough to start you thinking about SchemaType!
