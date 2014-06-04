@PostCtrl = ($scope, $routeParams, $location, $q, postData) ->

  $scope.data =
    postData: postData.data
    currentPost:
      id: 0
      title: 'Loading...'
      contents: ''

  # $scope.getMainBody = ->
  #   "/assets/mainPost.html"
  $scope.init = (id) ->
    $scope.data.postId = id

  $scope.navNewPost = ->
    $location.url('/post/new')

  $scope.navHome = ->
    $location.url('/')

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepPostData = ->
    post = _.findWhere(postData.data.posts, { id: parseInt($scope.data.postId) })
    $scope.data.currentPost.id = $scope.data.postId
    $scope.data.currentPost.title = post.title
    $scope.data.currentPost.contents = post.contents

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepPostData)

  # Provide deferred promise chain to the loadPosts function
  postData.loadPosts(@deferred)

  $scope.editPost = ->
    post = _.findWhere(postData.data.posts, { id: parseInt($scope.data.postId) })
    $location.url('/post/edit/'+post.id)

  $scope.removePost = ->
    post = _.findWhere(postData.data.posts, { id: parseInt($scope.data.postId) })
    $scope.data.currentPost.title = "Deleted"
    $scope.data.currentPost.contents = "This post has been deleted"
    prev_size = postData.data.posts.length
    postData.deletePost($scope.data.currentPost.id)
    post_size = postData.data.posts.length
    if prev_size isnt post_size
      $scope.navHome()
    else
      alert("Failed to delete post.")


@PostCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'postData']