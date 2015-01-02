'use strict'


ActivityCtrl = ($http, $log, $routeParams, $scope) ->
  return unless $routeParams.id?
  id = (Number $routeParams.id)

  $scope.sync false, (data) ->
    (return $scope.a = a) if (a.id is id) for a in data.activities
    return false

activity = angular.module 'activity', []
activity.controller 'ActivityCtrl', ActivityCtrl
