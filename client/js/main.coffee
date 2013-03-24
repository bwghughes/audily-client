require
  shim:
    'libs/angular-resource': deps: ['libs/angular' ]
    'libs/bootstrap': deps: ['libs/jquery-1.8.3' ]
    'libs/jquery-ui-1.10.1.custom': deps: ['libs/jquery-1.8.3']
    'libs/angular-ui':
      deps: [
        'libs/angular'
        , 'libs/jquery-ui-1.10.1.custom'
      ]
    'app':
      deps: [
        'libs/angular'
        , 'libs/angular-resource'
        , 'libs/angular-ui'
      ]
    'bootstrap': deps: ['app']
    'routes': deps: ['app']
    'views': deps: ['app']
    'services/test': deps: ['app']
    'directives/testForm': deps: ['app']
    'controllers/main': deps: ['app']
    'controllers/test':
      deps: [
        'services/test',
        'directives/testForm'
      ]
  [
    'require'
    'libs/bootstrap'
    'libs/angular-ui'
    'views'
    'routes'
    'controllers/main'
    'controllers/test'
    'directives/testForm'
  ], (require) ->
    require ['bootstrap']