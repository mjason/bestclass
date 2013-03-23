bestclass.controller "main_controller", ($scope) ->
  $scope.awesomeThings = []

bestclass.controller "courses_controller", ($scope, Courses, Handouts, Works) ->
  $scope.courses = Courses.query()

  $("#work-up").on "hide", ->
    $scope.works = Works.query courses_id: window.mj_course_id, query: "false"
    $scope.old_works = Works.query courses_id: window.mj_course_id, query: "true"

  $scope.show = (id) ->
    window.mj_course_id = id
    $scope.course = Courses.get courses_id: id
    $scope.handouts = Handouts.query courses_id: id
    $scope.works = Works.query courses_id: id, query: "false"
    $scope.old_works = Works.query courses_id: id, query: "true"
    window.courses_id = id

  $scope.new_task = (id, title) ->
    window.this_work = {"id": id, "title": title}
    $("#work-up").modal("show")

  $scope.preview = (swf) ->
    window.handout_swf = swf
    $("#handout").modal("show")
    flexpaper(swf)


bestclass.controller "taskCtrl", ($scope, Task) ->
  $("#work-up").on "show", ->
    console.log "show"
    $scope.title = window.this_work.title
    $scope.url = "/courses/" + window.courses_id + "/works/" + window.this_work.id + "/tasks"
    $scope.token = window.csrf_token

bestclass.controller "teacherCtrl", ($scope, $http, TeacherTask) ->
  # $scope.courseName = "manjia"
  $scope.show = (id, name, courses_id) ->
    $scope.courses_id = courses_id
    $scope.work_id = id
    $scope.courseName = name
    url = "/teacher/courses/" + courses_id + "/works/" + id + ".json?tasks=true"
    url1 = "/teacher/courses/" + courses_id + "/works/" + id + ".json?tasks=false"
    $http.get(url).success (data, status) ->
      $scope.ok_tasks = data
      console.log data
    $http.get(url1).success (data, status) ->
      $scope.no_tasks = data

  $scope.grade_click = (id) ->
    $scope.task_id = id
    $('#grade').modal('show')

  $scope.grade_sub = () ->
    url = "/teacher/courses/" + $scope.courses_id + "/works/" + $scope.work_id + "/tasks/" + $scope.task_id
    $http.put(url, {"grade": $scope.grade_model}, ).success (data, status) ->
      if status == 200
        $scope.show($scope.work_id, $scope.courseName, $scope.courses_id)
        $('#grade').modal('hide')