angular.module('app').config ['$routeProvider', '$locationProvider'
, ($routeProvider, $locationProvider) ->
  $routeProvider
  .when '/test',
    controller: 'testController'
    templateUrl: '/views/test.html'
  .otherwise
    redirectTo: '/'
  $locationProvider.html5Mode(true)
  .hashPrefix '!'
]