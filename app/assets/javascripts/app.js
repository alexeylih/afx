window.App = angular.module('App', ['ngResource'])
.directive('testw', function () {
    return {
      restrict: 'A',
      template: '<p>Hello</p>',      
      link: function (scope, elem, attrs) {
      }
  }
});
