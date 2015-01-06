'use strict'


ActivityCtrl = ($http, $log, $routeParams, $scope, $translate, uiCalendarConfig) ->
  return unless $routeParams.id?
  id = (Number $routeParams.id)

  onDayClick = (event) ->
    $log.debug event

  $scope.calTitle = ''
  $scope.calView = 'month'

  $scope.calViewRendered = (view, element) ->
    $log.debug "View Changed: ", view, element
    $scope.calTitle = view.title

  $scope.calendarConfig =
    dayClick: onDayClick
    editable: true
    header: false
    height: 500
    lang: $translate.use()
    viewRender: $scope.calViewRendered

  $scope.changeCal = (command, value=null) ->
    uiCalendarConfig.calendars['full'].fullCalendar command, value

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
