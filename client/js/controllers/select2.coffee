angular.module('app').controller 'select2Controller'
, ['$scope'
, ($scope) ->

  $scope.sources = [
    {
      _id: '1'
      description: 'Option 1'
    },
    {
      _id: '2'
      description: 'Option 2'
    }
  ]
]