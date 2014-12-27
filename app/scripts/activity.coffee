'use strict'


ActivityCtrl = ($http, $log, $routeParams, $scope) ->
  return unless $routeParams.id?
  id = (Number $routeParams.id)

  $scope.sync false, (data) ->
    for a in data.activities
      continue unless a.id is id
      $scope.a = a

activity = angular.module 'activity', []
activity.controller 'ActivityCtrl', ActivityCtrl
