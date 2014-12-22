'use strict'


# Animate a number up to a value
# Inspired by http://stackoverflow.com/a/21265200/4028999
counter = (angular.module 'counter', [])

directive = ($interval) ->
  return (scope, element, attrs) ->
    ticks = 0

    stop = ->
      $interval.cancel ticker

    ticker = $interval ->
      if ticks < attrs.to
        ticks += (attrs.to * 0.1)
        element.text (Math.floor ticks)
      else stop()
    , (Number attrs.delay) or 100

    element.on '$destroy', ->
      stop()

counter.directive 'counter', ['$interval', directive]
