'use strict'


MainCtrl = ($scope, $document, $log, $localStorage, $sessionStorage) ->
  #$scope.$storage = ($localStorage.$default accounts: [ 500, 250 ], history: [])

  $scope.formatMoney = (amount) ->
    accounting.formatMoney amount

main = (angular.module 'main', [])
main.controller 'MainCtrl', MainCtrl

main.directive 'main', ->
  replace: true
  template: '<div class="main" ng-view></div>'
