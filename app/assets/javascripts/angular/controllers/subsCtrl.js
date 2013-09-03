
// }).controller('SubsCtrl', ['$scope',
// function($scope, subsFactory) {
// 	console.log('hello')
// 	$scope.subs = subsFactory.getSubs();

// }]);

function SubsCtrl($scope, $http, subsFactory) {

	$scope.subs = subsFactory.getSubs();
	$scope.loadingItemsCount = 0;


	$scope.loadData = function(feed_id) {
		$scope.showMe = true;
		$scope.loadingItemsCount++;
		$scope.subitems = subsFactory.getSubitems(feed_id);	
  	};

  	$scope.getClass = function(article) {
    	return { blue: article.read == false};
    };

    $scope.setArticleRead = function(article)
    {
    	article.read = true;
    	url = "reading_articles/" + article.id + "/read"
    	$http.get(url);
    };

    $scope.submit = function() {
        console.log(this.urlToAdd);
        $http({
        method: 'POST',
        url: "feeds/",
        data: $.param({title: "jecky", url: this.urlToAdd}),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}})
    };




}



