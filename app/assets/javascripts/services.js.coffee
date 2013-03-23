bestclass.factory "Courses", ($resource) ->
  $resource "/courses/:courses_id"

bestclass.factory "Handouts", ($resource) ->
  $resource "/courses/:courses_id/handouts/:handouts_id"

bestclass.factory "Works", ($resource) ->
  $resource "/courses/:courses_id/works/:work_id"

bestclass.factory "Task", ($resource) ->
  $resource "/courses/:courses_id/works/:work_id/tasks/:task_id"

bestclass.factory "TeacherTask", ($resource) ->
  $resource "/teacher/courses/:courses_id/works/:work_id/tasks/:id"