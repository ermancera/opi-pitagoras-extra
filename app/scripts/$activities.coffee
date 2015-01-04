'use strict'


ActivitiesCtrl = ($route, $scope, $document, $localStorage, $log, $timeout, Fullscreen, prompt) ->
  $scope.busy = false # is the tab container busy navigating to the tab you asked for?
  $scope.calView = 'Mensual'
  $scope.displayMode = 'collapsed'
  $scope.fullSearch = false
  $scope.sort = by: 'budget_breakthrough', reverse: false
  $scope.single = false
  $scope.zoomed = false


  $scope.$watch 'displayMode', ->
    expanded = ($scope.displayMode is 'expanded')
    $scope.single = !expanded

    if $scope.$data.activities?.length
      a.disabled = a.isOpen = expanded for a in $scope.$data.activities

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


  $scope.getProgress = (key) ->
    return unless $scope.$data.calculated_values?

    value = switch key
      when 'benefs'
        b = $scope.$data.calculated_values.beneficiaries
        (Math.floor (b.real * 100) / b.planned)

      when 'goals'
        g = $scope.$data.calculated_values.goals
        (Math.floor (g.completed * 100) / g.planned)

    return value


  # Hides an accordion's header once clicked
  $scope.hideHeader = (id) ->
    opened = (angular.element document.querySelector 'accordion .open')

    if opened.length
      (angular.element document.querySelector 'accordion .open .hidden').removeClass 'hidden'
      opened.removeClass 'open'

    element = (document.getElementById "a#{id}")
    (angular.element element).addClass 'open'
    (angular.element element.querySelector '.panel-heading').addClass 'hidden'

    $timeout ->
      # FIXME can't fix this until JSON is fixed
      # see
      $scope.benefs = randomProgress()
      $scope.goals = randomProgress()
    , 350

    $scope.enableTab id
    return false


  $scope.pageChanged = ->
    $log.info "Page changed to #{$scope.$data.pagination.page}"


  $scope.progressType = (value) ->
    type = switch
      when (value < 16) then 'danger'
      when (value < 26) then 'warning'
      when (value < 76) then 'primary'
      else 'success'


  $scope.setPage = (page) ->
    $scope.currentPage = page


  $scope.sortBy = (key) ->
    if (key is $scope.sort.by)
      $scope.sort.reverse = !$scope.sort.reverse

    else
      $scope.sort.by = key
      $scope.sort.reverse = false

    return false

  $scope.zoom = (element) ->
    el = (document.querySelector "#a#{element} > .panel-collapse")
    $scope.zoomed = Fullscreen.isEnabled()

    unless $scope.zoomed then (Fullscreen.enable el)
    else Fullscreen.cancel()

    $scope.zoomed = !$scope.zoomed
    return false


  drawGlobalProgress = (data) ->
    $scope.stacked = []

    b = data.calculated_values.budget
    i = 0
    total = 0

    types = [
      'primary'
      'info'
      'success'
      'danger'
    ]

    values = [
      b.pledged_percent.value
      b.accruable_percent.value
      b.discharged_percent.value
      # FIXME (see https://github.com/opintel/pitagoras/issues/1183)
      #b.por_ejercer_percent.value
      100 - (b.pledged_percent.value + b.accruable_percent.value + b.discharged_percent.value)
    ]

    for i in [0...4]
      $scope.stacked.push
        value: values[i]
        type: types[i]

    return false


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


  setupContextualHeader()
  $scope.sync false, (data) ->
    drawGlobalProgress data
    $scope.$data = data
  return false


activities = (angular.module 'activities', [])
activities.controller 'ActivitiesCtrl', ActivitiesCtrl
