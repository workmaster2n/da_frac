# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
  if $("body.wells.index").length == 1
    wells = $("#canvas_container").data("wells")
    colors = ["red", "blue", "green", "orange", "pink", "teal"]
    vertical_count = 0
    for well in wells
      stages = well.stages
      offset = 50
      count = 1
      for stage in stages
        thing = $('<div/>').attr("class", "stage_box")
        .css("top", vertical_count*100 + ((vertical_count-1)*10)+20)
        .css("left", offset).css("width", stage.stage_length)
        .css("background-color", colors[count%colors.length])
        .data("stage", stage)
        .appendTo("#canvas_container")
        info_box = $('<div/>').html("GPI: #{stage.gpi}</br>GPI2: #{stage.gpi2}").css("background-color", "grey").appendTo(thing)
        thing.qtip
          content:
            text: "top perf: #{stage.top_perf}, bottom perf: #{stage.bottom_perf}"
            title: "#{well.name}  (Stage: #{stage.number})"
          position:
            my: "top center"
            at: "top center"
            target: $("#canvas_container")
        offset += stage.stage_length
        count += 1
      vertical_count += 1

  $("#slider-range").slider
    range: true
    min: 0
    max: 500
    values: [75, 300]
    slide: (event, ui) ->
      $("#amount").val "$" + ui.values[0] + " - $" + ui.values[1]

  $("#amount").val "$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1)



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
      text = text + "#{value}: " + stage_box.data("stage")[value] + "</br> "
    $(this).html($("<div/>").html(text).addClass("stage_box_info"))
