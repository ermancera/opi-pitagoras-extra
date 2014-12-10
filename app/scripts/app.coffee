'use strict'


deps = [
  'activity'
  'angularMoment'
  'app.templates'
  'duScroll'
  'FBAngular'
  'main'
  'modal'
  'navbar'
  'ngRoute'
  'ngStorage'
  'tools'
  'ui.bootstrap'
]

routes = ($routeProvider) ->
  $routeProvider
    .when('/',
      templateUrl: 'app/partials/base.jade'
      controller: 'MainCtrl'
    )
    .otherwise redirectTo: '/'

app = (angular.module 'app', deps)
app.config ['$routeProvider', routes]

app.constant 'angularMomentConfig',
  timezone: 'America/Mexico_City'

app.directive 'spinner', ->
  restrict: 'AE'
  template: '<div class="loading"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>'

app.run (amMoment) ->
  amMoment.changeLocale 'es'
