---
layout: page
title: SchemaType Playground
---


<div style="height: 600px">
  <div id="left" class="split split-vertical">
    <h1 id="head-left">Schema</h1>
    <textarea id="text-left"></textarea>
  </div>
  <div id="right" class="split split-vertical">
    <h1 id="head-right">Data</h1>
    <textarea id="text-right"></textarea>
  </div>
</div>

<script src="/js/split.js"></script>
<style>
.split {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.split, .gutter.gutter-horizontal {
  height: 100%;
  float: left;
}
.split {
  background-color: #fff !important;
  overflow-y: auto;
  overflow-x: hidden;
}
.gutter {
  background-color: #eee;
  background-repeat: no-repeat;
  background-position: 50%;
}
.gutter.gutter-horizontal {
  background-image: url('/img/grip-vertical.png');
  cursor: ew-resize;
}
.gutter.gutter-vertical {
  background-image: url('/img/grip-horizontal.png');
  cursor: ns-resize;
}
.split textarea {
  color: black;
  font-family: monospace;
  font-size: small;
  height: 100%;
  width: 100%;
}
.split h1 {
  color: blue;
}
</style>
<script>
Split(['#left', '#right'], {
  // direction: 'vertical'
});
</script>
