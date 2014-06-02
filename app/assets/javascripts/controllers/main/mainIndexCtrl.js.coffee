@IndexCtrl = ($scope, $location, $http, postData) ->

  $scope.data = postData.data

  loadPosts = ->
    $http.get('./posts.json').success( (data) ->
      $scope.data.posts = data
      console.log('Successfully loaded posts.')
    ).error( ->
      console.error('Failed to load posts.')
    )

  postData.loadPosts()

  $scope.viewPost = (postId) ->
    $location.url('/post/'+postId)

@IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData']