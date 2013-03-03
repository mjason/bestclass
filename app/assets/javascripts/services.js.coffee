angular.module("bestclass").factory "Courses", ($resource) ->
  $resource "/courses/:courses_id"
