'use strict'


AccordionCtrl = ($scope) ->
  $scope.currentTemplate = null
  $scope.oneAtATime = true

  $scope.groups = [
    {
      title: 'Grupo 1'
      template: 'app/partials/element.jade'
    }
    {
      title: 'Grupo 2'
      template: 'app/partials/element.jade'
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
