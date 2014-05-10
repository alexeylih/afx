window.App = angular.module('App', ['ngResource'])
.directive('messagemenu', function () {
    return {
      restrict: 'E',
      templateUrl: '/controls/messageMenu.html',    
      link: function (scope, elem, attrs) {}
  }
});

