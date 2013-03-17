#= require_self
#= require services
#= require controllers
#= require ui

window.bestclass = angular.module("bestclass", ['ngResource']).config(($routeProvider) ->
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
