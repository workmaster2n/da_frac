# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
  if $(".wells.show").length == 1
    paper = new Raphael("canvas_container", 500, 500)
    circle = paper.circle(100, 100, 80)

$(document).ready(ready)
$(document).on("page:load", ready)