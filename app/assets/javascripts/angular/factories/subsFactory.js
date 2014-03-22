/*App.factory('subsFactory', ['$http', function ($http) {
	var factory = {};

	factory.getSubs = function() {
		return $http.get('/feeds').then(function (response) {
        	return response.data;
      }, 
      function (response) {
      	alert(response.data)
      });
	};	

	factory.getSubitems = function(feed_id) {
		url = '/feeds/' + feed_id;
		return $http.get(url).then(function (response) {
        	return response.data;
	    });
	};	

	return factory;

}]);*/

