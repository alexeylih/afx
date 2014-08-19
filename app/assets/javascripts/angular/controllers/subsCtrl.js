function SubsCtrl($scope, $http) {

    $scope.isLoading = false;
    $scope.subs = getSubs();

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
        $scope.isLoading = true;
        return $http.get(url).then(function (response) {
            $scope.isLoading = false;
            return response.data;
        }, 
        function (response) {
            alert("Failed to retrieve sub-feeds")
        });
    };  

    
	$scope.loadData = function(feed_id) {
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
        .then(function(){}, function(response){
            alert("fail " + response.data.errors);
        })
    };
}

function MessagesCtrl($scope, $timeout, $http){

      $scope.getMessages = function(){
            $http.get('/messages/recieved/read');
            $http.get('/messages/recieved').then(function (response) {
            $scope.previewMessages = response.data;
      }, 
      function (response) {
        alert("Failed to load recieved messages")
      });
    };   

    $scope.destroyMessage = function(messageId){
        $http.delete('/messages/'+ messageId).success(function(){
                getMessages();
            });
    };

    $scope.getMessageClass = function(article) {
        return { messageUnread: article.read === null || article.read === false };
    };
}

function NotificationsCtrl($scope, $timeout, $http){

      $scope.getNotification = function(){
            $http.get('/notifications').then(function (response) {
            $scope.previewContainer = response.data;
      }, 
      function (response) {
      });
    };   
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

    $scope.addFriend = function(){
        $http({
                method: 'POST',
                url: "relationships/",
                data: $.param({subj_id: $scope.selectedUser.id}),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            });
    }

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



