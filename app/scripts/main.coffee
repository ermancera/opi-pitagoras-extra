'use strict'


MainCtrl = ($scope, $document, $log, $localStorage, $sessionStorage) ->
  $scope.displayMode = 'compact'
  $scope.orderBy = 'Presupuesto'
  toggle = (angular.element document.querySelector 'nav .toggle')

  $document.on 'scroll', ->
    # TODO fix this
    toggle.toggleClass 'hidden', ($scope.displayMode is 'expanded') or ($document.scrollTop() < 390)
    #$log.info "Scrolled to #{$document.scrollLeft()}, #{$document.scrollTop()}"

  #$scope.$storage = ($localStorage.$default accounts: [ 500, 250 ], history: [])

  $scope.formatMoney = (amount) ->
    accounting.formatMoney amount

main = (angular.module 'main', [])
main.controller 'MainCtrl', MainCtrl

main.directive 'main', ->
  replace: true
  template: '<div ng-view></div>'
