beforeEach module 'ngResource'
beforeEach module 'ui'
beforeEach module 'app'
beforeEach () ->
  this.addMatchers { toEqualData: (expected) ->
    angular.equals this.actual, expected }

describe 'test barcode service', ->
  describe 'Retrieving barcode', ->
    $httpBackend = {}
    service = {}
    describe 'get product from barcode', ->
      productName = 'Benson & Hedges 20'
      beforeEach inject (_$httpBackend_, $injector) ->
        $httpBackend = _$httpBackend_
        service = $injector.get 'BarCode'
        $httpBackend.expectGET('/api/product/123456')
        .respond {_id: '123456', name: productName}

      it 'should get a product from a barcode',()->
        service.getProduct("123456").then (product) ->
          expect(product.name).toEqual productName

        $httpBackend.flush()