'use strict'

ActivityCtrl = ($scope, $http, Fullscreen) ->
  $scope.activities = []
  $scope.benefs = (Math.floor (Math.random() * 99) + 1)
  $scope.currentPage = 3
  $scope.entries = [] #cambios
  $scope.expanded = false
  $scope.facturas = []
  $scope.files = [] #evidencia
  $scope.goals = (Math.floor (Math.random() * 99) + 1)
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
    total = 0

    types = [
      'success'
      'info'
      'warning'
      'danger'
    ]

    random = ->
      value = (Math.floor (Math.random() * 24) + 1)
      total += value
      value

    for i in [0...4]
      $scope.stacked.push
        value: if (i < 3) then random() else (100 - total)
        type: types[i]

  $scope.setPage = (page) ->
    $scope.currentPage = page

  $scope.today = ->
    $scope.date = new Date()

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
  $scope.today()
  return


activity = (angular.module 'activity', [])
activity.controller 'ActivityCtrl', ActivityCtrl
