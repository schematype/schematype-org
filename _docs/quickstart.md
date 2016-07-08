---
layout: docs
title: Quick-start guide
permalink: /docs/quickstart/
---

For the impatient, here's how to start using SchemaType right away:

{% highlight bash %}
$ npm install schematype
$ schematype generate -i something.yaml -o something.stp
$ schematype validate -s something.stp -i something.yaml
$ schematype translate -i something.stp -o something.json-schema
{% endhighlight %}

