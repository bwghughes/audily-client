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
          id: '1'
          description: 'Option 1'
        },
        {
          id: '2'
          description: 'Option 2'
        },
        {
          id: '3'
          description: 'Option 3'
        }
      ]
      expect(scope.sources).toEqualData(data)