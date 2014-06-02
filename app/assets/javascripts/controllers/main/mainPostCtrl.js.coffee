@PostCtrl = ($scope, $routeParams, postData) ->

  $scope.data =
    post: postData.data.posts[$routeParams.postId]

  postData.loadPosts()

  $scope.data.postId = $routeParams.postId
  console.log($routeParams)
