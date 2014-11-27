'use strict'


AccordionCtrl = ($scope) ->
  $scope.currentTemplate = null
  $scope.oneAtATime = true

  $scope.groups = [
    {
      beneficiaries: 12
      budget:
        total: 90000
      code: '06.002.05.1.1.2.2.'
      goal: 50
      notes: true
      payments: 6
      template: 'app/partials/element.jade'
      visits: true
    }
    {
      beneficiaries: 24
      budget:
        total: 90000
      code: '06.007.01.1.2.4.2.'
      goal: 75
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
