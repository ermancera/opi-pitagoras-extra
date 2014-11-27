'use strict'


ElementCtrl = ($scope) ->
  $scope.max = 200


  $scope.randomStacked = ->
    $scope.stacked = []

    i = 0
    n = Math.floor((Math.random() * 4) + 1)

    types = [
      'success'
      'info'
      'warning'
      'danger'
    ]

    while i < n
      index = Math.floor((Math.random() * 4))

      $scope.stacked.push
        value: Math.floor((Math.random() * 30) + 1)
        type: types[index]

      i++

    return


  $scope.randomStacked()
  return

element = (angular.module 'element', [])
element.controller 'ElementCtrl', ElementCtrl
