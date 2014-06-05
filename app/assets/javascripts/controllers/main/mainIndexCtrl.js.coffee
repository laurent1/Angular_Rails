@IndexCtrl = ($scope, $location, $http, postData, shareNav) ->

  $scope.data = postData.data

  loadPosts = ->
    $http.get('./posts.json')
      .success (data) ->
        $scope.data.posts = data
        console.log('Successfully loaded posts.')
      .error ->
        console.error('Failed to load posts.')

  postData.loadPosts(null)

  $scope.navHome = ->
    shareNav.navHome()

  $scope.viewPost = (postId) ->
    shareNav.viewPost(postId)

  $scope.navNewPost = ->
    shareNav.navNewPost()


@IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData', 'shareNav']