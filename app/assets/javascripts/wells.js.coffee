# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
  if $(".wells.show").length == 1
    stages = $("#canvas_container").data("stages")
    wells = $("#canvas_container").data("wells")
    colors = ["red", "blue", "green", "orange", "pink", "teal"]
    vertical_count = 0
    for well in wells
      stages = well.stages
      offset = 50
      count = 1
      for stage in stages
        thing = $('<div/>').attr("class", "stage_box").css("top", vertical_count*100 + ((vertical_count-1)*10)+20).css("left", offset).css("width", stage.stage_length).css("background-color", colors[count%colors.length]).appendTo("#canvas_container")
        thing.qtip
          content:
            text: "top perf: #{stage.top_perf}, bottom perf: #{stage.bottom_perf}"
            title: "Stage: #{stage.number}"
          position:
            my: "top center"
            at: "top center"
            target: $("#canvas_container")

        offset += stage.stage_length
        count += 1
      vertical_count += 1



$(document).ready(ready)
$(document).on("page:load", ready)