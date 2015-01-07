'use strict'


ModalCtrl = ($scope, $modalInstance) ->
  $scope.breadcrumbs = true

  $scope.cancel = ->
    $modalInstance.dismiss 'cancel'

  $scope.ok = ->
    $modalInstance.close()


modal = (angular.module 'modal', [])
modal.controller 'ModalCtrl', ModalCtrl
