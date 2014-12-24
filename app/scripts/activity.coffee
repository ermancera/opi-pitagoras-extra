'use strict'


ActivityCtrl = ($scope, $http, $document, $modal, $log, $timeout, Fullscreen, prompt) ->
  $scope.D = {} # JSON data
  $scope.busy = false # is the tab container busy navigating to the tab you asked for?
  $scope.calView = 'Mensual'
  $scope.displayMode = 'collapsed'
  $scope.fullSearch = false
  $scope.orderBy = 'budget_breakthrough'
  $scope.single = false
  $scope.zoomed = false


  $scope.$watch 'displayMode', ->
    get = (what) ->
      (angular.element document.querySelectorAll what)

    switch $scope.displayMode
      when 'collapsed'
        (get '.panel.open').removeClass 'open'
        (get '.panel-heading.hidden').removeClass 'hidden'

      when 'expanded' then (get '.panel').addClass 'open'


  # TODO not finished
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


  $scope.enableTab = (id, index=1) ->
    return if $scope.busy

    $scope.busy = true
    sel = "#a#{id} ul.nav-tabs li:nth-child(#{index}) a"
    tab = (angular.element document.querySelector sel)

    $timeout ->
      (tab.triggerHandler 'click')
      $scope.busy = false
    , 0


  # Hides an accordion's header once clicked
  $scope.hideHeader = (id) ->
    opened = (angular.element document.querySelector 'accordion .open')

    if opened.length
      (angular.element document.querySelector 'accordion .open .hidden').removeClass 'hidden'
      opened.removeClass 'open'

    element = (document.getElementById "a#{id}")
    (angular.element element).addClass 'open'
    (angular.element element.querySelector '.panel-heading').addClass 'hidden'

    $scope.benefs = $scope.goals = 0

    $timeout ->
      randomMultiProgress()
      $scope.benefs = randomProgress()
      $scope.goals = randomProgress()
    , 350

    $scope.enableTab id
    return false


  $scope.openModal = (template='full', size='lg') ->
    $modal.open
      controller: 'ModalCtrl'
      size: size
      templateUrl: "#{template}.html"


  $scope.pageChanged = ->
    $log.info "Page changed to #{$scope.D.pagination.page}"


  $scope.progressType = (value) ->
    type = switch
      when (value < 75) then 'primary'
      when (value < 50) then 'warning'
      when (value < 25) then 'danger'
      else 'success'


  $scope.setPage = (page) ->
    $scope.currentPage = page


  $scope.zoom = (element) ->
    el = (document.querySelector "#a#{element} > .panel-collapse")
    $scope.zoomed = Fullscreen.isEnabled()

    unless $scope.zoomed then (Fullscreen.enable el)
    else Fullscreen.cancel()

    $scope.zoomed = !$scope.zoomed
    return false


  getActivities = ->
    #url = 'http://pitagoras.nightly.opi.la/api/activities'
    url = '/js/activities.json'
    get = ($http.get url)

    get.error (data, status, headers, config) ->
      $log.info 'GET error'

    get.success (data, status, headers, config) ->
      $scope.D = data



  # TODO This should be deleted at some point.
  randomMultiProgress = ->
    $scope.stacked = []
    i = 0
    total = 0

    random = ->
      value = (Math.floor (Math.random() * 24) + 1)
      total += value
      return value

    types = [
      'primary'
      'info'
      'success'
      'danger'
    ]

    for i in [0...4]
      $scope.stacked.push
        value: if (i < 3) then random() else (100 - total)
        type: types[i]


  randomProgress = ->
    Math.floor (Math.random() * 99) + 1


  setupContextualHeader = ->
    inner = (angular.element document.querySelector 'nav .navbar-inner')
    toggle = (angular.element document.querySelector 'nav .toggle')

    $document.on 'scroll', ->
      expanded = ($scope.displayMode is 'expanded')
      hidden = expanded or ($document.scrollTop() < 510)
      inner.toggleClass 'normal', hidden
      toggle.toggleClass 'hidden', hidden

    $scope.$watch 'displayMode', (mode) ->
      expanded = ($scope.displayMode is 'expanded')
      $scope.single = !expanded

      return unless $scope.D.activities
      for activity in $scope.D.activities
        activity.disabled = activity.isOpen = expanded


  setupContextualHeader()
  getActivities()
  randomMultiProgress()
  return


activity = (angular.module 'activity', [])
activity.controller 'ActivityCtrl', ActivityCtrl
