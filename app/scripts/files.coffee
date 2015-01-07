'use strict'


FilesCtrl = ($scope) ->
  $scope.files = []

  $scope.fillDummyFiles = ->
    file =
      date: new Date()
      dependency: 'Colima'
      description: 'Lorem ipsum blah blah'
      type: 'Convenio de Adhesión'

    ($scope.files.push file) for i in [0...40]

  $scope.fillDummyFiles()


files = (angular.module 'files', [])
files.controller 'FilesCtrl', FilesCtrl
