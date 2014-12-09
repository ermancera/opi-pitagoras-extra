'use strict'

modal = (angular.module 'modal', [])

ModalCtrl = ($scope, $modalInstance) ->
  $scope.cancel = ->
    $modalInstance.dismiss 'cancel'

  $scope.ok = ->
    $modalInstance.close()

modal.controller 'ModalCtrl', ModalCtrl
