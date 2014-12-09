'use strict'

deps = [
  'accordion'
  'angularMoment'
  'app.templates'
  'FBAngular'
  'main'
  'navbar'
  'ngRoute'
  'ngStorage'
  'ui.bootstrap'
]

app = (angular.module 'app', deps)

routes = ($routeProvider) ->
  $routeProvider
    .when('/',
      templateUrl: 'app/partials/base.jade'
      controller: 'MainCtrl'
    )
    .otherwise redirectTo: '/'

app.config ['$routeProvider', routes]

app.constant 'angularMomentConfig',
  timezone: 'America/Mexico_City'

app.directive 'spinner', ->
  restrict: 'AE'
  template: '<div class="loading"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>'

app.run (amMoment) ->
  amMoment.changeLocale 'es'
