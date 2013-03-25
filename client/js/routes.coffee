angular.module('app').config ['$routeProvider', '$locationProvider'
, ($routeProvider, $locationProvider) ->
  $routeProvider
  .when '/test',
    controller: 'testController'
    templateUrl: '/views/test.html'
  .when '/select2',
    controller: 'select2Controller'
    templateUrl: '/views/select2.html'
  .otherwise
    redirectTo: '/'
  $locationProvider.html5Mode(true)
  .hashPrefix '!'
]