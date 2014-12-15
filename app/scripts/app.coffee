'use strict'


deps = [
  'activity'
  'angularMoment'
  'app.templates'
  'cgPrompt'
  'duScroll'
  'FBAngular'
  'main'
  'modal'
  'navbar'
  'ngRoute'
  'ngStorage'
  'pascalprecht.translate'
  'ui.bootstrap'
]

routes = ($routeProvider) ->
  $routeProvider
    .when('/',
      templateUrl: 'app/partials/base.jade'
      controller: 'MainCtrl'
    )
    .otherwise redirectTo: '/'

translations = ($translateProvider) ->
  $translateProvider.useUrlLoader 'app/assets/js/lang.json'
  $translateProvider.preferredLanguage 'es'
  $translateProvider.useLocalStorage()

app = (angular.module 'app', deps)
app.config ['$routeProvider', routes]
#app.config ['$translateProvider', translations]

app.constant 'angularMomentConfig',
  timezone: 'America/Mexico_City'

app.directive 'spinner', ->
  restrict: 'AE'
  template: '<div class="loading"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>'

app.run (amMoment) ->
  amMoment.changeLocale 'es'
