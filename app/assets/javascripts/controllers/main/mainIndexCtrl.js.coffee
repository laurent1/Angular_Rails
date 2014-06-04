@IndexCtrl = ($scope, $location, $http, postData) ->

  $scope.data = postData.data

  $scope.getMainPartial = ->
    "/assets/mainPostList.html"

  $scope.getPostPartial = ->
    "/assets/mainPost.html"

  loadPosts = ->
    $http.get('./posts.json')
      .success (data) ->
        $scope.data.posts = data
        console.log('Successfully loaded posts.')
      .error ->
        console.error('Failed to load posts.')

  postData.loadPosts(null)

  $scope.viewPost = (postId) ->
    $scope.postId = postId
    $scope.getMainPartial = $scope.getPostPartial
    $scope.getPostPartial()
    # $location.url('/post/'+postId)

  $scope.navNewPost = ->
    $location.url('/post/new')


@IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData']