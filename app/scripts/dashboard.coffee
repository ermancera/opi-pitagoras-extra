'use strict'


DashboardCtrl = ($scope) ->
  $scope.image =
    file: null
    name: ''


dashboard = (angular.module 'dashboard', [])
dashboard.controller 'DashboardCtrl', DashboardCtrl
