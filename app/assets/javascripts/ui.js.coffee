@ui = {}
@ui.set_course_show_with = () ->
  document.getElementById("courses-show").style.width = document.getElementById("courses-show-span").scrollWidth + "px"

window.close_work_up = () ->
  $("#work-up").modal("hide")