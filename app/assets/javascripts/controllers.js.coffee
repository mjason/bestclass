bestclass.controller "main_controller", ($scope) ->
  $scope.awesomeThings = []

bestclass.controller "courses_controller", ($scope, Courses, Handouts, Works) ->
  $scope.courses = Courses.query()

  $scope.show = (id) ->
    $scope.course = Courses.get courses_id: id
    $scope.handouts = Handouts.query courses_id: id
    $scope.works = Works.query courses_id: id
    window.courses_id = id

  $scope.new_task = (id, title) ->
    window.this_work = {"id": id, "title": title}
    $("#work-up").modal("show")

bestclass.controller "taskCtrl", ($scope, Task) ->
  $("#work-up").on "show", ->
    console.log "show"
    $scope.title = window.this_work.title