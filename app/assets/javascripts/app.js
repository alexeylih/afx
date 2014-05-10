window.App = angular.module('App', ['ngResource'])
.directive('testw', function () {
    return {
      restrict: 'E',
      template: '<p>Hello asdasd asdasd  sdasdasd</p>',      
      link: function (scope, elem, attrs) {
      }
  }
});
