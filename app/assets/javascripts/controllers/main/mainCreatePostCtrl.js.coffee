@CreatePostCtrl = ($scope, $location, postData) ->

  $scope.data = postData.data
  postData.loadPosts()

  $scope.formData =
    newPostTitle: ''
    newPostContents: ''

  $scope.createPost = ->
    postData.createPost($scope.formData)

  $scope.clearPost = ->
    $scope.formData.newPostTitle = ''
    $scope.formData.newPostContents = ''

@CreatePostCtrl.$inject = ['$scope', '$location', 'postData']
