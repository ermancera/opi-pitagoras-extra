'use strict'


AccordionCtrl = ($scope) ->
  $scope.currentTemplate = null
  $scope.oneAtATime = true


  $scope.progressType = (value) ->
    type = switch
      when (value < 25) then 'danger'
      when (value < 50) then 'warning'
      when (value < 75) then 'info'
      else 'success'


  $scope.groups = [
    {
      benefs: 12
      budget: 25
      code: '06.002.05.1.1.2.2.'
      goals: 50
      notes: true
      payments: 6
      template: 'app/partials/element.jade'
      visits: true
    }
    {
      benefs: 24
      budget: 50
      code: '06.007.01.1.2.4.2.'
      goals: 75
      notes: false
      payments: 4
      template: 'app/partials/element.jade'
      visits: true
    }
  ]

  return


accordion = (angular.module 'accordion', [])
accordion.controller 'AccordionCtrl', AccordionCtrl

accordion.directive 'onAccordionGroupClick', ->
  link: ($scope, element, attrs) ->
    template = attrs.onAccordionGroupClick

    element.on 'click', ->
      $scope.currentTemplate = template
      $scope.$apply()

  require: '^accordion'
  restrict: 'A'

accordion.controller 'ChildController1', ->
  alert 'Init child controller 1'

accordion.controller 'ChildController2', ->
  alert 'Init child controller 2'
