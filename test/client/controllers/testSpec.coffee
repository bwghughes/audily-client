beforeEach module 'ngResource'
beforeEach module 'ui'
beforeEach module 'app'

beforeEach () ->
  this.addMatchers { toEqualData: (expected) ->
    angular.equals this.actual, expected }

mockTestService =
  tests: [{name: 'aRole'}]
  all: (callback) ->
    callback(@roles) if callback

describe 'Test Controller', ->

  scope = {}
  ctrl = {}
  $rootScope = {}

  beforeEach inject ($rootScope, $injector, $controller) ->
    sinon.spy(mockTestService, 'all')
    scope = $rootScope.$new()
    ctrl = $controller('testController'
    , { $scope: scope, Test: mockTestService})

  describe 'initializing', ->

    it 'should get the roles', () ->
      expect(mockTestService.all.callCount).toEqual(1)