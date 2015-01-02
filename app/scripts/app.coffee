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
  'dashboard'
  'duScroll'
  'files'
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


$routeProvider = ($routeProvider) ->
  routes =
    activities:
      all:
        controller: 'AppCtrl'
        templateUrl: 'app/partials/activities.jade'

      one:
        controller: 'ActivityCtrl'
        templateUrl: 'app/partials/activities/single.jade'

    dashboard:
      controller: 'DashboardCtrl'
      templateUrl: 'app/partials/dashboard.jade'

    files:
      controller: 'FilesCtrl'
      templateUrl: 'app/partials/files.jade'

  $routeProvider
    .when('/acciones', routes.activities.all)
    .when('/acciones/:id', routes.activities.one)
    .when('/archivos', routes.files)
    .when('/panel', routes.dashboard)
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
