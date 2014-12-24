'use strict'


_deps = [
  'activity'
  'angularMoment'
  'app.templates'
  'cgPrompt'
  'counter'
  'duScroll'
  'FBAngular'
  'main'
  'modal'
  'navbar'
  'ngAnimate'
  'ngRoute'
  'ngStorage'
  'pascalprecht.translate'
  'picardy.fontawesome'
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


app = (angular.module 'app', _deps)
app.config ['$routeProvider', routes]
#app.config ['$translateProvider', translations]

app.constant 'angularMomentConfig',
  timezone: 'America/Mexico_City'

app.run (amMoment) ->
  amMoment.changeLocale 'es'
