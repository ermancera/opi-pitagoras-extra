'use strict'


ActivityCtrl = ($http, $log, $routeParams, $scope) ->
  id = (Number $routeParams.id)
  return unless id?

  url = "/js/activities.json"
  get = ($http.get url)

  get.error (data, status, headers, config) ->
    $log.info 'GET error'

  get.success (data, status, headers, config) ->
    for a in data.activities
      continue unless a.id is id
      $scope.a = a


activity = angular.module 'activity', []
activity.controller 'ActivityCtrl', ActivityCtrl
