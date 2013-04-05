angular.module('app').controller 'stockEntryController'
    # We have in an array because we're going to minify the file.
    # If they werent there - the Scope varialbe would be renamed
    # to something shorter. Protect the scope keyword.
, ['$scope', 'BarCode'
, ($scope, BarCode) ->
    $scope.processBarCode = (barCode) ->
        $scope.barCode = barCode
        BarCode.get(barCode).then (product) ->
            $scope.product = product
]