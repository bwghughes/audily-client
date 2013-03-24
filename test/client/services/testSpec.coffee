beforeEach module 'ngResource'
beforeEach module 'ui'
beforeEach module 'app'
beforeEach () ->
  this.addMatchers { toEqualData: (expected) ->
    angular.equals this.actual, expected }

describe 'test service', ->
  describe 'factory', ->
    $httpBackend = {}
    service = {}
    describe 'all', ->
      beforeEach inject (_$httpBackend_, $injector) ->
        $httpBackend = _$httpBackend_
        service = $injector.get 'Test'
        $httpBackend.expectGET('/tests.json')
        .respond [
          {_id: '12541', name: 'bob'},
          {_id: '6846', name: 'toto'}]
      it 'should get all accounts',()->
        service.all (result)->
          expect(result).toEqualData(
            [{_id: '12541', name: 'bob'},
            {_id: '6846', name: 'toto'}]
          )
        $httpBackend.flush()