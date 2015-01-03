'use strict'


AppCtrl = ($http, $log, $localStorage, $route, $routeParams, $scope, $translate) ->
  data =
    activities: []

    calculated_values:
      beneficiaries:
        planned: 0
        real: 0

      budget:
        accruable_percent:
          value: 0

        discharged_percent:
          value: 0

        pledged_percent:
          value: 0

        por_ejercer_percent:
          value: 0

      goals:
        planned: 0
        completed: 0

    pagination:
      page: 0

  $scope.$data = $localStorage.$default {data}
  $scope.$route = $route
  $scope.$routeParams = $routeParams

  $scope.sync = (forced=false, callback=false) ->
    if $localStorage.lastSync?
      # checks if last sync was done less than 15 mins ago
      last = (Date.parse $localStorage.lastSync)
      forced |= (Math.floor (new Date() - last) / 1000) > 1800
    else forced = true

    unless forced
      $scope.$data = $localStorage.data
      (callback $scope.$data) if callback
      $log.debug 'loading cached data'
      return
    else $log.debug 'forced refresh'

    #url = 'http://pitagoras.nightly.opi.la/api/activities'
    url = '/js/activities.json'
    get = ($http.get url)

    get.error (data, status, headers, config) ->
      $log.error 'GET error'

    get.success (data, status, headers, config) ->
      $localStorage.lastSync = new Date()
      $scope.$data = $localStorage.data = data
      (callback data) if callback
      $log.debug 'loaded data from server'

  $scope.toggleLang = ->
    $translate.use if ($translate.use() is 'en') then 'es' else 'en'


dependencies = [
  'activities'
  'activity'
  'angularMoment'
  'app.templates'
  'cgPrompt'
  'counter'
  'dashboard'
  'duScroll'
  'FBAngular'
  'files'
  'modal'
  'navbar'
  'ngAnimate'
  'ngRoute'
  'ngStorage'
  'omr.angularFileDnD'
  'pascalprecht.translate'
  'picardy.fontawesome'
  'translations'
  'ui.bootstrap'
]


$routeProvider = ($routeProvider) ->
  routes =
    activities:
      all:
        controller: 'AppCtrl'
        reloadOnSearch: false
        templateUrl: 'app/partials/activities/main.jade'

      one:
        controller: 'ActivityCtrl'
        reloadOnSearch: false
        templateUrl: 'app/partials/activities/single.jade'

    dashboard:
      controller: 'DashboardCtrl'
      templateUrl: 'app/partials/dashboard/main.jade'

    files:
      controller: 'FilesCtrl'
      templateUrl: 'app/partials/files/main.jade'

  $routeProvider
    .when('/acciones', routes.activities.all)
    .when('/acciones/:id', routes.activities.one)
    .when('/archivos', routes.files)
    .when('/panel', routes.dashboard)
    .otherwise redirectTo: '/acciones'


app = (angular.module 'app', dependencies)

app.config ['$routeProvider', $routeProvider]
app.constant 'angularMomentConfig', timezone: 'America/Mexico_City'
app.controller 'AppCtrl', AppCtrl

app.directive 'main', ->
  replace: true
  template: '<div class="main" ng-view></div>'

app.run (amMoment) ->
  amMoment.changeLocale 'es'
