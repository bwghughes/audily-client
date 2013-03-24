angular.module('app').directive 'testform', ->
  restrict: 'E'
  templateUrl: '/views/testForm.html'
  scope:
    submit: '&'
    submitText: '@'
  link: (scope, elm, attrs) ->
  
    scope.save = () ->
      scope.submit()