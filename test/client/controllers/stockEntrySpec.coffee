beforeEach module 'ngResource'
beforeEach module 'ui'
beforeEach module 'app'

beforeEach () ->
  this.addMatchers { toEqualData: (expected) ->
    angular.equals this.actual, expected }

describe 'Stock Controller', ->
  describe 'processing bar code text', ->

    scope = null
    ctrl = null
    $rootScope = null
    deferred = null
    q = null
    mockBarCodeService =
      get: (barCode) ->
        deferred = q.defer()
        deferred.promise

    beforeEach inject ($rootScope, $injector, $controller, $q) ->
      scope = $rootScope.$new()
      q = $q
      ctrl = $controller('stockEntryController'
      , { $scope: scope, BarCode: mockBarCodeService})

    it 'should get barcode text',()->
      scope.processBarCode "123456"
      expect(scope.barCode).toEqual "123456"
      scope.processBarCode "456789"
      expect(scope.barCode).toEqual "456789"

    it 'should call the barcode service',()->
      scope.processBarCode "123456"
      deferred.resolve({name: "Benson & Hedges 20"})
      scope.$root.$digest()
      expect(scope.product.name).toEqual "Benson & Hedges 20"


