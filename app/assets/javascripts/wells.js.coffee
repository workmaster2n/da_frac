# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
  if $(".wells.show").length == 1
    stages = $("#canvas_container").data("stages")
    depth = 100
    for stage in stages
      depth += stage.stage_length
    offset = 50
    for stage in stages
      thing = $('<div/>').attr("class", "stage_box").css("left", offset).css("width", stage.stage_length).appendTo("#canvas_container")
      thing.qtip
        content:
          text: "top perf: #{stage.top_perf}, bottom perf: #{stage.bottom_perf}"
          title: "Stage: #{stage.number}"
        position:
          my: "top center"
          at: "top center"
          target: $("#canvas_container")

      offset += stage.stage_length



$(document).ready(ready)
$(document).on("page:load", ready)