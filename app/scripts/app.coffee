'use strict'


AppCtrl = ($log, $localStorage, $location, $route, $routeParams, $scope) ->
  #$scope.$storage = ($localStorage.$default accounts: [ 500, 250 ], history: [])
  $scope.$location = $location
  $scope.$route = $route
  $scope.$routeParams = $routeParams


dependencies = [
  'activities'
  'activity'
  'angularMoment'
  'app.templates'
  'cgPrompt'
  'counter'
  'duScroll'
  'FBAngular'
  'modal'
  'navbar'
  'ngAnimate'
  'ngRoute'
  'ngStorage'
  'pascalprecht.translate'
  'picardy.fontawesome'
  'ui.bootstrap'
]


$routeProvider = ($routeProvider, $locationProvider) ->
  #$locationProvider.html5mode = true

  routes =
    activities:
      many:
        templateUrl: 'app/partials/app.jade'
        controller: 'AppCtrl'

      one:
        templateUrl: 'app/partials/cards/$activity.jade'
        controller: 'ActivityCtrl'

  $routeProvider
    .when('/acciones', routes.activities.many)
    .when('/acciones/:id', routes.activities.one)
    .otherwise redirectTo: '/acciones'


$translateProvider = ($translateProvider) ->
  $translateProvider.useUrlLoader 'app/assets/js/lang.json'
  $translateProvider.preferredLanguage 'es'
  $translateProvider.useLocalStorage()


app = (angular.module 'app', dependencies)
app.config ['$routeProvider', $routeProvider]
#app.config ['$translateProvider', $translateProvider]
app.constant 'angularMomentConfig', timezone: 'America/Mexico_City'
app.controller 'AppCtrl', AppCtrl

app.directive 'main', ->
  replace: true
  template: '<div class="main" ng-view></div>'

app.run (amMoment) ->
  amMoment.changeLocale 'es'
