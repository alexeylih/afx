function SubsCtrl($scope, $http) {

    function getSubs() {
        return $http.get('/feeds').then(function (response) {
            return response.data;
      }, 
      function (response) {
        alert("Failed to retrieve feeds")
      });
    };  

    function getSubitems(feed_id) {
        url = '/feeds/' + feed_id;
        return $http.get(url).then(function (response) {
            return response.data;
        }, 
        function (response) {
            alert("Failed to retrieve sub-feeds")
        });
    };  

	$scope.subs = getSubs();
	$scope.loadingItemsCount = 0;
    
	$scope.loadData = function(feed_id) {
		$scope.showMe = true;
		$scope.loadingItemsCount++;
		$scope.subitems = getSubitems(feed_id);	
  	};

  	$scope.getClass = function(article) {
    	return { headerUnread: article.read == false };
    };

    $scope.setArticleRead = function(article)
    {
        article.hidden = !article.hidden;
    	article.read = true;
    	url = "reading_articles/" + article.id + "/read"
    	$http.get(url);
    };

    $scope.submit = function() {
        $http({
        method: 'POST',
        url: "feeds/",
        data: $.param({title: "jecky", url: this.urlToAdd}),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}})
        .then(function(){}, function(){
            alert("fail");
        })
    };
}

function GeneralCtrl($scope, $http) {
    function getNotifications(){
        var notifications = ['a','b', 'c'];
        return notifications;
    };

    $scope.notifications = getNotifications();
}



