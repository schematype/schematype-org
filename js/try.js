(function() {
  var TrySchemaType;

  TrySchemaType = (function() {
    function TrySchemaType() {
      $('.tabset').tabs({
        XXXevent: "mouseover"
      });
      this.resizer();
      window.onresize = this.resizer;
      $('input[name="schema-example"]').click(function(e) {
        return st.get_example(this, e);
      });
      this.schema_tab = $('div#try>ul>li a:eq(1)');
      this.data_tab = $('div#try>ul>li a:eq(2)');
      $(this.schema_tab).click(function() {
        return $(this).removeClass('status_success');
      });
      $(this.data_tab).click(function() {
        return $(this).removeClass('status_success');
      });
      this.schematype_div = $('#tab-schema-schematype');
      this.yaml_div = $('#tab-data-yaml');
    }

    TrySchemaType.prototype.resizer = function() {
      return $('.ui-tabs-panel .ui-tabs-panel').height(window.innerHeight - 280);
    };

    TrySchemaType.prototype.get_example = function(input, event) {
      this.get_example_file("/example/" + input.value + ".stp.txt", this.schema_tab, this.schematype_div);
      return this.get_example_file("/example/" + input.value + ".yaml.txt", this.data_tab, this.yaml_div, this.yaml_to_json);
    };

    TrySchemaType.prototype.get_example_file = function(url, $tab, $div, next) {
      $tab.addClass('status_pending');
      return $.get(url, (function(_this) {
        return function(data) {
          _this.render_pre($tab, $div, data);
          if (next != null) {
            return next.call(_this);
          }
        };
      })(this));
    };

    TrySchemaType.prototype.render_pre = function($tab, $div, text) {
      var $pre;
      $pre = $div.html('<code></code>').find('code');
      $pre.html(text);
      $tab.removeClass('status_pending');
      return $tab.addClass('status_success');
    };

    TrySchemaType.prototype.yaml_to_json = function() {};

    return TrySchemaType;

  })();

  $(function() {
    return window.st = window.try_schematype = new TrySchemaType;
  });

}).call(this);
