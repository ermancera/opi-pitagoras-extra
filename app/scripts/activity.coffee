'use strict'


ActivityCtrl = ($scope, $http, $document, $modal, $log, $timeout, Fullscreen, prompt) ->
  $scope.activities = []
  $scope.benefs = (Math.floor (Math.random() * 99) + 1)
  $scope.currentPage = 3
  $scope.displayMode = 'compact'
  $scope.entries = [] #cambios
  $scope.facturas = []
  $scope.files = [] #evidencia
  $scope.fullSearch = false
  $scope.goals = (Math.floor (Math.random() * 99) + 1)
  $scope.orderBy = 'Presupuesto'
  $scope.single = false
  $scope.totalPages = 25
  $scope.zoomed = false


  $scope.ask = (what) ->
    question = switch what
      when 'benefs' then "Actualizar el número de beneficiarios (min. 0):"
      when 'goals' then "Actualizar el número de metas (min. 0):"

    prompt(
      input: true
      label: what
      message: question
      title: 'Actualizar'
    ).then (response) ->
      $log.info "The response was '#{response}'."
    , ->
      $log.info "No response registered."


  $scope.enableTab = (id, index) ->
    sel = "#a#{id} ul.nav-tabs li:nth-child(#{index}) a"

    $timeout ->
      (angular.element document.querySelector sel).triggerHandler 'click'
    , 0


  $scope.hideHeader = ->
    # TODO fix this
    $log.info (angular.element @).addClass 'hidden'
    return false


  $scope.openModal = (template='modal', size='lg') ->
    $modal.open
      templateUrl: "#{template}.html"
      controller: 'ModalCtrl'
      size: size


  $scope.pageChanged = ->
    console.log "Page changed to #{$scope.currentPage}"


  $scope.progressType = (value) ->
    type = switch
      when (value < 25) then 'danger'
      when (value < 50) then 'warning'
      when (value < 75) then 'info'
      else 'success'


  $scope.setPage = (page) ->
    $scope.currentPage = page


  $scope.zoom = (element) ->
    el = (document.querySelector "#a#{element} > .panel-collapse")
    $scope.zoomed = Fullscreen.isEnabled()

    unless $scope.zoomed then (Fullscreen.enable el)
    else Fullscreen.cancel()

    $scope.zoomed = !$scope.zoomed

    return


  getActivities = ->
    #url = 'http://pitagoras.nightly.opi.la/api/activities'
    url = '/js/activities.json'
    get = ($http.get url)

    get.error (data, status, headers, config) ->
      console.log 'GET error'

    get.success (data, status, headers, config) ->
      console.log "GET #{status}"

      $scope.activities = data.activities


  randomProgress = ->
    $scope.stacked = []
    i = 0
    total = 0

    random = ->
      value = (Math.floor (Math.random() * 24) + 1)
      total += value
      value

    types = [
      'success'
      'info'
      'warning'
      'danger'
    ]

    for i in [0...4]
      $scope.stacked.push
        value: if (i < 3) then random() else (100 - total)
        type: types[i]


  setupContextualHeader = ->
    toggle = (angular.element document.querySelector 'nav .toggle')
    top = Math.floor $('accordion').offset()['top'] - 80 # padding

    $document.on 'scroll', ->
      expanded = ($scope.displayMode is 'expanded')
      toggle.toggleClass 'hidden', expanded or ($document.scrollTop() < top)

    $scope.$watch 'displayMode', (mode) ->
      expanded = ($scope.displayMode is 'expanded')
      $scope.single = !expanded

      for activity in $scope.activities
        activity.disabled = activity.isOpen = expanded


  setupContextualHeader()
  getActivities()
  randomProgress()
  return


activity = (angular.module 'activity', [])
activity.controller 'ActivityCtrl', ActivityCtrl
