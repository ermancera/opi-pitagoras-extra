'use strict'


NavbarCtrl = ($document, $location, $log, $scope) ->
  $scope.isActive = (url) ->
    path = $location.path()

    switch url
      when '/acciones/*' then (path.search /^\/acciones\/\d+$/) is 0
      else (path is url)


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
  templateUrl: 'app/partials/$navbar.jade'
