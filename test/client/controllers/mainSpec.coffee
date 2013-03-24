beforeEach module 'ngResource'
beforeEach module 'ui'
beforeEach module 'app'

beforeEach () ->
  this.addMatchers { toEqualData: (expected) ->
    angular.equals this.actual, expected }

describe 'test controller', ->
  describe 'initializing', ->

    scope = {}
    ctrl = {}
    $rootScope = {}

    beforeEach inject ($rootScope, $injector, $controller) ->
      scope = $rootScope.$new()
      ctrl = $controller('mainController'
      , { $scope: scope })

    it 'should set message',()->
      expect(scope.message).toEqual "Hello Gintellect"