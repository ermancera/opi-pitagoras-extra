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


$routeProvider_data = ($routeProvider, $locationProvider) ->
  #$locationProvider.html5mode = true

  $routeProvider
    .when('/acciones',
      templateUrl: 'app/partials/app.jade'
      controller: 'AppCtrl'
    )
    .when('/acciones/:id',
      templateUrl: 'app/partials/cards/$activity.jade'
      controller: 'ActivityCtrl'
    )
    .otherwise redirectTo: '/acciones'


$translateProvider = ($translateProvider) ->
  $translateProvider.useUrlLoader 'app/assets/js/lang.json'
  $translateProvider.preferredLanguage 'es'
  $translateProvider.useLocalStorage()


app = (angular.module 'app', dependencies)
app.config ['$routeProvider', $routeProvider_data]
#app.config ['$translateProvider', $translateProvider]
app.constant 'angularMomentConfig', timezone: 'America/Mexico_City'
app.controller 'AppCtrl', AppCtrl

app.directive 'main', ->
  replace: true
  template: '<div class="main" ng-view></div>'

app.run (amMoment) ->
  amMoment.changeLocale 'es'
