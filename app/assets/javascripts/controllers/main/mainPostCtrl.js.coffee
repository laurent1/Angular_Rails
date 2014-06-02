@PostCtrl = ($scope, $routeParams, postData) ->

  $scope.data =
    post: postData.data.posts[$routeParams.postId]

  $scope.data.postId = $routeParams.postId
  console.log($routeParams)
