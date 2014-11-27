'use strict'

deps = [
  'accordion'
  'angularMoment'
  'app.templates'
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
      templateUrl: 'app/partials/home.jade'
      controller: 'MainCtrl'
    )
    .when('/panel',
      templateUrl: 'app/partials/panel.jade'
      controller: 'MainCtrl'
    )
    .when('/historial',
      templateUrl: 'app/partials/historial.jade'
      controller: 'MainCtrl'
    )
    .otherwise redirectTo: '/'


app.config ['$routeProvider', routes]


app.constant 'angularMomentConfig',
  timezone: 'America/Mexico_City'


app.directive 'spinner', ->
  restrict: 'AE'
  template: '<div class="loading"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>'

dataService = ($http) ->
  getData: ->
    return # AJAX

app.factory 'dataService', ['$http', dataService]


app.run (amMoment) ->
  amMoment.changeLocale 'es'
