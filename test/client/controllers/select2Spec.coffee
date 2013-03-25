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
      ctrl = $controller('select2Controller'
      , { $scope: scope })

    it 'should set sources',()->
      data = [
        {
          _id: '1'
          description: 'Option 1'
        },
        {
          _id: '2'
          description: 'Option 2'
        }
      ]
      expect(scope.sources).toEqualData(data)