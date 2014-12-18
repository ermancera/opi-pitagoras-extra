'use strict'


NavbarCtrl = ($scope, $document) ->
  $scope.btnLabel = 'Entrar'
  $scope.toggle = ($document.querySelector 'nav .toggle')

  $scope.toggleHeader = ->
    $scope.toggle.toggleClass '.hidden'

navbar = (angular.module 'navbar', [])
navbar.controller 'NavbarCtrl', NavbarCtrl

navbar.directive 'navbar', ->
  compile: (element, attr) ->
    items = $(element).find '#nav-links li'

    for li in items
      $a = $('a', li).first()
      continue unless ($a.text() is attr.current)
      $(li).addClass 'active'
      break

  replace: true
  transclude: true
  templateUrl: 'app/partials/navbar.jade'
