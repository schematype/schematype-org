---
layout: try
title: SchemaType Playground
---

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/try.css">

<div id="try" class="tabset">
  <ul>
    <li><a href="#tab-main-control">Control Panel</a></li>
    <li><a href="#tab-main-schema">Schema</a></li>
    <li><a href="#tab-main-data">Data</a></li>
  </ul>

  <div id="tab-main-control">
    <div class="tabset">
      <ul>
        <li><a href="#tab-control-doc">Documentation</a></li>
        <li><a href="#tab-control-config">Configuration</a></li>
        <li><a href="#tab-control-pref">Preferences</a></li>
      </ul>
      <div id="tab-control-doc">
        {% capture md %}{% include try/doc.md %}{% endcapture %}{{ md|markdownify }}
      </div>
      <div id="tab-control-config">
        {% capture md %}{% include try/config.md %}{% endcapture %}{{ md|markdownify }}
      </div>
      <div id="tab-control-pref">
        {% capture md %}{% include try/pref.md %}{% endcapture %}{{ md|markdownify }}
      </div>
    </div>
  </div>

  <div id="tab-main-schema">
    <div class="tabset">
      <ul>
        <li><a href="#tab-schema-schematype">SchemaType</a></li>
        <li><a href="#tab-schema-compiled">Compiled</a></li>
        <li><a href="#tab-schema-jsonschema">JSON Schema</a></li>
      </ul>
      <div id="tab-schema-schematype">
      </div>
      <div id="tab-schema-compiled">
      </div>
      <div id="tab-schema-jsonschema">
      </div>
    </div>
  </div>

  <div id="tab-main-data">
    <div class="tabset">
      <ul>
        <li><a href="#tab-data-yaml">YAML</a></li>
        <li><a href="#tab-data-json">JSON</a></li>
      </ul>
      <div id="tab-data-yaml">
      </div>
      <div id="tab-data-json">
      </div>
    </div>
  </div>
</div>

<script src="/js/try.js"></script>
