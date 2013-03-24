angular.module('app').factory 'Test'
, ['$resource', ($resource) ->

  methods =
    query:
      method: 'GET'
      params: {}
      isArray: true
    save:
      method: 'PUT'
      params: {}
      isArray: false
    create:
      method: 'POST'
      params: {}
      isArray: false

  resource = $resource '/tests.json', {}, methods

  all = (callback) ->
    resource.query (results) ->
      callback results if callback

  all: all

]