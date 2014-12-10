'use strict'


ToolsCtrl = ($scope) ->
  $scope.full = false

  $scope.toggle = ->
    $scope.full = !$scope.full


tools = (angular.module 'tools', [])
tools.controller 'ToolsCtrl', ToolsCtrl
