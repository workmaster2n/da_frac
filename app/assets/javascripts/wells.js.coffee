# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
zoom_level = 1

set_up_tool_tips = ->
  $(".box").each ->
    stage = $(this).data("stage")
    well = $(this).data("well")
    $(this).qtip
      content:
        text: "top perf: #{stage.top_perf}, bottom perf: #{stage.bottom_perf}"
        title: "#{well.name}  (Stage: #{stage.number})"
        position:
          my: "top center"
          at: "top center"

adjust_width = ->
  $(".stage_box").each ->
    $(this).css("width", parseInt($(this).data("stage")["properties"]["stage_length"]) * zoom_level + "px")


ready =  ->
  if $("body.wells.index").length == 1
    set_up_tool_tips()
    lowest_gpi = gon.lowest_gpi
    highest_gpi = gon.highest_gpi
    update_stage_boxes = (low, high) ->
      $(".stage_box").each ()->
        stage_box = $(this)
        if parseInt(stage_box.data("stage")["properties"]["gpi"]) < low or parseInt(stage_box.data("stage")["properties"]["gpi"]) > high
          $(this).css({opacity: .25})
        else
          $(this).css({opacity: 1})
    $("#slider-range").slider
      range: true
      min: lowest_gpi
      max: highest_gpi
      values: [highest_gpi*.25, highest_gpi*.75]
      slide: (event, ui) ->
        $("#amount").val ui.values[0] + " - " + ui.values[1]
        update_stage_boxes ui.values[0], ui.values[1]

    $("#amount").val $("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1)



$(document).ready(ready)
$(document).on("page:load", ready)
$(document).on "change", ".attribute_check_box",()->
#  attr = $(this).val()
  selected_attr = []
  $(".attribute_check_box:checked").each ()->
    selected_attr.push($(this).val())
  $(".stage_box").each ()->
    stage_box = $(this)
    text = ""
    $(selected_attr).each (index, value) ->
      text = text + "#{value}: " + stage_box.data("stage").properties[value] + "</br> "
    $(this).html($("<div/>").html(text).addClass("stage_box_info"))
$(document).on "click", "#zoom_in", (e)->
  e.preventDefault()
  zoom_level *= 2
  adjust_width()
$(document).on "click", "#zoom_out", (e)->
  e.preventDefault()
  zoom_level *= 1/2
  adjust_width()



