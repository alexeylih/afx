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

function MessagesCtrl($scope, $timeout, $http){


  
      function getMessages(){
        console.log(1);
        return $http.get('/messages/recieved').then(function (response) {
            $scope.messages = response.data;
      }, 
      function (response) {
        alert("Failed to load recieved messages")
      });
    };   

    $timeout(getMessages, 10);
}


function UsersCtrl($scope, $http) {

    $scope.messageText = "";
    $scope.users = getUsers();

    function getUsers(){
        return $http.get('/users').then(function (response) {
            return response.data;
      }, 
      function (response) {
        alert("Failed to retrieve users")
      });
    };

    $scope.setSelectedUser = function(user){
        $scope.selectedUser = user;
    };

    $scope.openModel = function(user){
        $('#messages_modal').foundation('reveal', 'open');
    };

    $scope.closeForm = function(){
       $http({
                method: 'POST',
                url: "messages/",
                data: $.param({reciever_id: $scope.selectedUser.id , message_text: $scope.messageText}),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            })
            .then(function(){
                $('#messages_modal').foundation('reveal', 'close');
                $scope.messageText = "";
            }, function (response) {
                alert("Failed to send message");
            });
    };

    
}



