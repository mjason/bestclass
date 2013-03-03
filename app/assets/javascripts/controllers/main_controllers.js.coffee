angular.module("bestclass").controller "main_controller", ($scope) ->
  $scope.awesomeThings = []

angular.module("bestclass").controller "courses_controller", ($scope, Courses) ->
#  $httpProvider.defaults.headers.post["X-CSRF-Token"] = window.csrf_token
  $scope.youname = "manjia"

  $scope.courses = Courses.query()
  console.log Courses.get courses_id: "51333e40d196a74ecf000001"
  Courses.delete courses_id: "51333e40d196a74ecf000001"

  $scope.restName = ->
    $scope.youname = "蛮假"
