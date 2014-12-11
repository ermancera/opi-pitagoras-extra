'use strict'


MainCtrl = ($scope, $document, $log, $localStorage, $sessionStorage) ->
  $scope.orderBy = 'Presupuesto'
  toggle = (angular.element document.querySelector 'nav .toggle')

  $document.on 'scroll', =>
    expanded = (document.querySelector 'body > div.main > div.expanded')
    toggle.toggleClass 'hidden', expanded? or ($document.scrollTop() < 400)

  #$scope.$storage = ($localStorage.$default accounts: [ 500, 250 ], history: [])

  $scope.formatMoney = (amount) ->
    accounting.formatMoney amount

main = (angular.module 'main', [])
main.controller 'MainCtrl', MainCtrl

main.directive 'main', ->
  replace: true
  template: '<div class="main" ng-view></div>'
