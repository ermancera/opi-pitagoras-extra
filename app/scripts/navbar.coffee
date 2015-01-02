'use strict'


NavbarCtrl = ($document, $location, $log, $scope) ->
  $scope.isActive = (url) ->
    url is $location.path()

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
