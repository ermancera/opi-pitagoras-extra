'use strict'


ActivityCtrl = ($http, $log, $routeParams, $scope, $timeout, $translate, uiCalendarConfig) ->
  return unless $routeParams.id?
  id = (Number $routeParams.id)

  onDayClick = (event) ->
    $log.debug event

  $scope.calTitle = ''
  $scope.calView = 'month'

  $scope.calendarConfig =
    dayClick: onDayClick
    editable: true
    header:
      left: 'title'
      center: ''
      right: ''
    height: 500
    lang: $translate.use()

  $scope.changeCal = (command, value=null) ->
    uiCalendarConfig.calendars['full'].fullCalendar command, value
    $scope.getCalTitle()

  $scope.eventSources = [
    url: '/js/dummy-events.json'
  ]

  $scope.getCalTitle = ->
    $scope.calTitle = (document.querySelector '.fc-toolbar h2')?.innerText

  $timeout ->
    $scope.getCalTitle()
  , 100

  $scope.sync false, (data) ->
    (return $scope.a = a) if (a.id is id) for a in data.activities
    return false

  $scope.$watch ($scope) ->
    $scope.calendarConfig.lang = $translate.use()


activity = (angular.module 'activity', [])
activity.controller 'ActivityCtrl', ActivityCtrl
