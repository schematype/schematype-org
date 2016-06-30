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
    # $('input[name="schema-example"]').prop('disabled', true)
    @get_example_file \
      "/example/#{input.value}.schema",
      @schema_tab,
      @schematype_div
    @get_example_file \
      "/example/#{input.value}.yaml",
        @data_tab,
        @yaml_div

  get_example_file: (url, $tab, $div)->
    $tab.addClass 'status_pending'
    @pre = $pre = $div.html('<code></code>').find('code')
    $.get url, (data)->
      $pre.html data
      $tab.removeClass 'status_pending'
      $tab.addClass 'status_success'

$ ->
  window.st = window.try_schematype = new TrySchemaType
