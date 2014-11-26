'use strict'


attr =
  get: {do: 'Retirar', dir: 'de'}
  put: {do: 'Depositar', dir: 'en'}


ModalCtrl = ($scope, $modal, $log) ->
  build = (type) ->
    $scope.items = []
    total = 0

    add = (index, action, id, desc, max) ->
      $scope.items.push {index, action, id, desc, max}

    for amt, i in $scope.accounts
      a = attr[type]
      get = (type is 'get')
      num = (i + 1)

      if get
        max = " (max. $#{amt})"
        total += amt
      else max = ''

      add i, a, "#{type}#{num}", "#{a.do} monedas #{a.dir} la cuenta #{num}#{max}", amt

    if ($scope.accounts.length > 1)
      unless get
        per = (Math.floor $scope.pocket / $scope.accounts.length)
        (total = "#{per}/cuenta")
      else per = -1

      if (get and per < 0) or (!get and per > 0)
        (add i, a, 'all', "#{a.do} monedas #{a.dir} todas las cuentas ($#{total})", total)

    (add i, a, 'new', 'Depositar monedas en una cuenta nueva', $scope.pocket) unless get
    return items: -> $scope.items

  $scope.open = (type) ->
    instance = $modal.open
      controller: 'ModalInstanceCtrl'
      resolve: (build type)
      templateUrl: "app/partials/modal.jade"

    select = (selected) ->
      switch type
        when 'get'
          switch selected.item.id
            when 'all' then ($scope.get -1)
            else $scope.get selected.item.index, (selected.item.max * selected.multi)

        when 'put'
          amount  = ($scope.pocket * selected.multi)

          switch selected.item.id
            when 'all' then $scope.distribute()
            when 'new' then ($scope.put -1, amount)
            else ($scope.put selected.item.index, amount)

      $scope.selected = selected.item

    instance.result.then select, ->
      $log.info "Modal dismissed at #{new Date()}"


ModalInstanceCtrl = ($scope, $modalInstance, items) ->
  $scope.action = items[0].id

  $scope.cancel = -> ($modalInstance.dismiss 'cancel')

  $scope.change = (multi=-1, persist=true) ->
    (multi = $scope.multi) if (multi < 0)
    ($scope.multi = multi) if persist

    $scope.amount = ($scope.active.max * multi)

  $scope.hover = (multi=-1) ->
    $scope.change multi, false

  $scope.hoverMenu = (item=null) ->
    $scope.active = if item? then item else $scope.selected
    ($scope.select item, false) if item?

  $scope.items = items

  $scope.ok = -> ($modalInstance.close item: $scope.selected, multi: $scope.multi)

  $scope.select = (item, persist=true) ->
    if persist
      $("label.active:not(:nth-child(#{item.index+1}))", 'div.btn-group-vertical').removeClass 'active'
      $scope.selected = item

    $scope.active = item
    $scope.change (if persist then 1.00 else -1), persist

  $scope.title = (id) ->
    switch id
      when 'all' then 'todas las cuentas'
      when 'new' then 'una cuenta nueva'
      else "la cuenta ##{id.slice 3}" if id?

  $scope.active = items[0]
  $scope.selected = items[0]
  $scope.change(1.00)


modal = (angular.module 'modal', [])
modal.controller 'ModalCtrl', ModalCtrl
modal.controller 'ModalInstanceCtrl', ModalInstanceCtrl
