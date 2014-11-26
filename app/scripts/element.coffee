element = (angular.module 'element', [])

ElementCtrl = ($scope) ->
  $scope.max = 200

  $scope.random = ->
    value = (Math.floor (Math.random() * 100) + 1)
    type = undefined

    if (value < 25)
      type = 'success'

    else if (value < 50)
      type = 'info'

    else if (value < 75)
      type = 'warning'

    else
      type = 'danger'

    $scope.showWarning = (type is 'danger' or type is 'warning')
    $scope.dynamic = value
    $scope.type = type
    return

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

  $scope.random()
  $scope.randomStacked()
  return

element.controller 'ElementCtrl', ElementCtrl
