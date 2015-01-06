'use strict'


ActivityCtrl = ($http, $log, $routeParams, $scope, $translate, uiCalendarConfig) ->
  return unless $routeParams.id?
  id = (Number $routeParams.id)

  onDayClick = (event) ->
    $log.debug event

  $scope.calendarConfig =
    dayClick: onDayClick
    editable: true
    header: false
    height: 500
    lang: $translate.use()

  $scope.eventSources = [
    events :
      url: 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic'
      currentTimezone: 'America/Chicago'
  ]

  $scope.sync false, (data) ->
    (return $scope.a = a) if (a.id is id) for a in data.activities
    return false

  $scope.$watch ($scope) ->
    $scope.calendarConfig.lang = $translate.use()

activity = (angular.module 'activity', [])
activity.controller 'ActivityCtrl', ActivityCtrl
