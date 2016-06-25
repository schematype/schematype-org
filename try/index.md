---
layout: try
title: SchemaType Playground
---

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/try.css">
<script>
$(function() {
  $( "#tabs" ).tabs({
    event: "mouseover"
  });
});
</script>

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Setup</a></li>
    <li><a href="#tabs-2">Schema</a></li>
    <li><a href="#tabs-3">Data</a></li>
  </ul>
  <div id="tabs-1">
    <p>...</p>
  </div>
  <div id="tabs-2">
    <p>...</p>
  </div>
  <div id="tabs-3">
    <p>...</p>
  </div>
</div>

<style>
#tabs li, #tabs p {
  font-size: small;
}
</style>
