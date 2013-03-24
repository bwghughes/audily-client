angular.module('app').controller 'testController'
, ['$scope', 'Test'
, ($scope, Test) ->

  $scope.tests = []

  $scope.getData = ->
    Test.all (data) ->
      $scope.tests = data

  $scope.save = ->
    $scope.info = "you hit save"

  $scope.getData()
]