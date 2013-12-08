# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
  if $(".wells.show").length == 1
    stages = $("#canvas_container").data("stages")
    depth = 100
    for stage in stages
      depth += stage.stage_length

    paper = new Raphael("canvas_container", depth, 200)
    offset = 50
    for stage in stages
      paper.rect(offset, 50, stage.stage_length, 100)
      offset += stage.stage_length

$(document).ready(ready)
$(document).on("page:load", ready)