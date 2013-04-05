angular.module('app').factory 'BarCode'
, ['$resource', '$q', ($resource, $q) ->

  resource = $resource '/api/product/:id', {}

  getProduct = (barCode) ->
    deferred = $q.defer()
    resource.get {id: barCode}, (product) ->
      deferred.resolve product
      return
    deferred.promise

  return { getProduct: getProduct }
]