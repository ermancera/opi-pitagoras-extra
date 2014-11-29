'use strict';
var AccordionCtrl, accordion;

AccordionCtrl = function($scope, $http, Fullscreen) {
  var get, url;
  $scope.groups = [];
  $scope.oneAtATime = true;
  $scope.progressType = function(value) {
    var type;
    return type = (function() {
      switch (false) {
        case !(value < 25):
          return 'danger';
        case !(value < 50):
          return 'warning';
        case !(value < 75):
          return 'info';
        default:
          return 'success';
      }
    })();
  };
  $scope.randomStacked = function() {
    var i, index, n, types, _results;
    $scope.stacked = [];
    i = 0;
    n = Math.floor((Math.random() * 4) + 1);
    types = ['success', 'info', 'warning', 'danger'];
    _results = [];
    while (i < n) {
      index = Math.floor(Math.random() * 4);
      $scope.stacked.push({
        value: Math.floor((Math.random() * 30) + 1),
        type: types[index]
      });
      _results.push(i++);
    }
    return _results;
  };
  $scope.zoom = function(element) {
    if (Fullscreen.isEnabled()) {
      return Fullscreen.cancel();
    } else {
      return Fullscreen.enable(document.querySelector("#a" + element));
    }
  };
  url = '/js/activities.json';
  get = $http.get(url);
  get.error(function(data, status, headers, config) {
    return console.log('GET error');
  });
  get.success(function(data, status, headers, config) {
    console.log("GET " + status);
    return $scope.groups = data.activities;
  });

  /*
  $scope.groups = [
    {
      benefs: 12
      budget: 25
      code: '06.002.05.1.1.2.2.'
      goals: 50
      notes: true
      payments: 6
      visits: true
    }
    {
      benefs: 24
      budget: 50
      code: '06.007.01.1.2.4.2.'
      goals: 75
      notes: false
      payments: 4
      visits: true
    }
  ]
   */
  $scope.randomStacked();
};

accordion = angular.module('accordion', []);

accordion.controller('AccordionCtrl', AccordionCtrl);

accordion.directive('onAccordionGroupClick', function() {
  return {
    link: function($scope, element, attrs) {
      return element.on('click', function() {

        /*
        $scope.currentTemplate = template
        $scope.$apply()
         */
      });
    },
    require: '^accordion',
    restrict: 'A'
  };
});
;'use strict';
var app, dataService, deps, routes;

deps = ['accordion', 'angularMoment', 'app.templates', 'FBAngular', 'main', 'navbar', 'ngRoute', 'ngStorage', 'ui.bootstrap'];

app = angular.module('app', deps);

routes = function($routeProvider) {
  return $routeProvider.when('/', {
    templateUrl: 'app/partials/home.jade',
    controller: 'MainCtrl'
  }).when('/panel', {
    templateUrl: 'app/partials/panel.jade',
    controller: 'MainCtrl'
  }).when('/historial', {
    templateUrl: 'app/partials/historial.jade',
    controller: 'MainCtrl'
  }).otherwise({
    redirectTo: '/'
  });
};

app.config(['$routeProvider', routes]);

app.constant('angularMomentConfig', {
  timezone: 'America/Mexico_City'
});

app.directive('spinner', function() {
  return {
    restrict: 'AE',
    template: '<div class="loading"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>'
  };
});

dataService = function($http) {
  return {
    getData: function() {}
  };
};

app.factory('dataService', ['$http', dataService]);

app.run(function(amMoment) {
  return amMoment.changeLocale('es');
});
;'use strict';
var MainCtrl, main;

MainCtrl = function($scope, $localStorage, $sessionStorage) {
  $scope.$storage = $localStorage.$default({
    accounts: [500, 250],
    history: []
  });
  return $scope.formatMoney = function(amount) {
    return accounting.formatMoney(amount);
  };
};

main = angular.module('main', []);

main.controller('MainCtrl', MainCtrl);

main.directive('main', function() {
  return {
    replace: true,
    template: '<div ng-view></div>'
  };
});
;'use strict';
var NavbarCtrl, navbar;

navbar = angular.module('navbar', []);

NavbarCtrl = function($scope) {
  return $scope.btnLabel = 'Entrar';
};

navbar.controller('NavbarCtrl', NavbarCtrl);

navbar.directive('navbar', function() {
  return {
    compile: function(element, attr) {
      var $a, items, li, _i, _len, _results;
      items = $(element).find('#nav-links li');
      _results = [];
      for (_i = 0, _len = items.length; _i < _len; _i++) {
        li = items[_i];
        $a = $('a', li).first();
        if (!($a.text() === attr.current)) {
          continue;
        }
        $(li).addClass('active');
        break;
      }
      return _results;
    },
    replace: true,
    transclude: true,
    templateUrl: 'app/partials/navbar.jade'
  };
});
;
//# sourceMappingURL=app.js.map