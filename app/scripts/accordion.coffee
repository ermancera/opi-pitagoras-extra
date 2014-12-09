'use strict'

AccordionCtrl = ($scope, $http, Fullscreen) ->
  $scope.activities = []
  $scope.currentPage = 3
  $scope.expanded = false
  $scope.single = false
  $scope.totalPages = 25
  $scope.zoomed = false

  $scope.expand = (state=false) ->
    $scope.expanded = state
    $scope.single = !state

    for activity in $scope.activities
      activity.disabled = $scope.expanded
      activity.isOpen = $scope.expanded

  $scope.pageChanged = ->
    console.log "Page changed to #{$scope.currentPage}"

  $scope.progressType = (value) ->
    type = switch
      when (value < 25) then 'danger'
      when (value < 50) then 'warning'
      when (value < 75) then 'info'
      else 'success'

  $scope.randomProgress = ->
    $scope.stacked = []

    i = 0
    n = Math.floor((Math.random() * 4) + 1)

    types = [
      'success'
      'info'
      'warning'
      'danger'
    ]

    while i < n
      index = (Math.floor (Math.random() * 4))

      $scope.stacked.push
        value: (Math.floor (Math.random() * 30) + 1)
        type: types[index]

      i++

  $scope.setPage = (page) ->
    $scope.currentPage = page

  $scope.zoom = (element) ->
    el = (document.querySelector "#a#{element} > .panel-collapse")
    $scope.zoomed = Fullscreen.isEnabled()

    unless $scope.zoomed then (Fullscreen.enable el)
    else Fullscreen.cancel()

    $scope.zoomed = !$scope.zoomed
    return

  #url = 'http://pitagoras.nightly.opi.la/api/activities'
  url = '/js/activities.json'
  get = ($http.get url)

  get.error (data, status, headers, config) ->
    console.log 'GET error'

  get.success (data, status, headers, config) ->
    console.log "GET #{status}"
    $scope.activities = data.activities

  ###
  $scope.activities = [
    {
      benefs: 12
      budget: 25
      code: '06.002.05.1.1.2.2.'
      goals: 50
      notes: true
      payments: 6
      visits: true
    }
    {
      benefs: 24
      budget: 50
      code: '06.007.01.1.2.4.2.'
      goals: 75
      notes: false
      payments: 4
      visits: true
    }
  ]
  ###

  $scope.expand()
  $scope.randomProgress()
  return


accordion = (angular.module 'accordion', [])
accordion.controller 'AccordionCtrl', AccordionCtrl
