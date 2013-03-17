bestclass.factory "Courses", ($resource) ->
  $resource "/courses/:courses_id"

bestclass.factory "Handouts", ($resource) ->
  $resource "/courses/:courses_id/handouts/:handouts_id"

bestclass.factory "Works", ($resource) ->
  $resource "/courses/:courses_id/works/:work_id"
