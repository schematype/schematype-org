---
layout: docs
title: Quick-start guide
permalink: /docs/quickstart/
---

For the impatient, here's how to start using SchemaType right away:

{% highlight bash %}
$ npm install schematype
$ schematype generate -i something.yaml -o something.schema
$ schematype validate -s something.schema -i something.yaml
$ schematype translate -i something.schema -o something.json-schema
{% endhighlight %}

