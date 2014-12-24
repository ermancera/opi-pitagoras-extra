'use strict'


# Animate a number up to a value
# Inspired by http://stackoverflow.com/a/21265200/4028999
counter = (angular.module 'counter', [])

directive = ($interval, $timeout) ->
  return (scope, element, attrs) ->
    ticks = 0

    $timeout ->
      value = element.text()
      element.text 0

      stop = ->
        $interval.cancel ticker

      ticker = $interval ->
        if (ticks < value)
          ticks += (value * 0.1)
          element.text (Math.floor ticks)
        else stop()
      , (Number attrs.delay) or 1

      element.on '$destroy', ->
        stop()
    , 1000

counter.directive 'counter', ['$interval', '$timeout', directive]
