'use strict'

Widget = ->
  replace: true
  restrict: 'AE'
  template: '<div class="widget"></div>'
  transclude: true

WidgetsCtrl = ($scope) ->
  $scope.widgets = []

  $scope.addWidget = ->
    $scope.widgets.push {}

widgets = (angular.module 'widgets', [])
widgets.controller 'WidgetsCtrl', WidgetsCtrl
widgets.directive 'widget', Widget
