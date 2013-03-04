#= require_self
#= require services
#= require_tree ./controllers
#= require ui

bestclass = angular.module("bestclass", ['ngResource']).config(($routeProvider) ->
#  $httpProvider.defaults.headers.post["X-CSRF-Token"] = window.csrf_token
  $routeProvider.when("/",
    templateUrl: 'assets/views/main.html',
    controller: 'main_controller'
  ).when("/courses",
    templateUrl: "assets/views/courses/index.html"
    controller: "courses_controller"
  )
)

bestclass.config ["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = window.csrf_token
]