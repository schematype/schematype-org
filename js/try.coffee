---
---
class TrySchemaType
  constructor: ->
    $('.tabset').tabs
      XXXevent: "mouseover"
    @resizer()
    window.onresize = @resizer
    $('input[name="schema-example"]').click (e)->
      st.get_example this, e

    @schema_tab = $('div#try>ul>li a:eq(1)')
    @data_tab = $('div#try>ul>li a:eq(2)')
    $(@schema_tab).click ->
      $(@).removeClass('status_success')
    $(@data_tab).click ->
      $(@).removeClass('status_success')

    @schematype_div = $('#tab-schema-schematype')
    @yaml_div = $('#tab-data-yaml')

  resizer: ->
    $('.ui-tabs-panel .ui-tabs-panel').height window.innerHeight - 280

  get_example: (input, event)->
    @get_example_file \
      "/example/#{input.value}.schema",
      @schema_tab,
      @schematype_div
    @get_example_file \
      "/example/#{input.value}.yaml",
        @data_tab,
        @yaml_div,
        @yaml_to_json

  get_example_file: (url, $tab, $div, next)->
    $tab.addClass 'status_pending'
    $.get url, (data)=>
      @render_pre $tab, $div, data
      if next?
        next.call(@)

  render_pre: ($tab, $div, text)->
    $pre = $div.html('<code></code>').find('code')
    $pre.html text
    $tab.removeClass 'status_pending'
    $tab.addClass 'status_success'

  yaml_to_json: ->
    # require js-yaml
    # load yaml
    # convert to json
    # render pre for json tab

$ ->
  window.st = window.try_schematype = new TrySchemaType
