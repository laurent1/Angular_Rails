angular.module('Blog').factory('postData', ['$http', ($http) ->

  postData =
    data:
      posts: [{title: 'Loading', contents: ''}]
    isLoaded: false

  postData.loadPosts = ->
    if !postData.isLoaded
      $http.get('./posts.json')
        .success (data) ->
          postData.data.posts = data
          postData.isLoaded = true
          console.log('Successfully loaded posts.')
        .error ->
          console.error('Failed to load posts.')

  postData.createPost = (newPost) ->
    if newPost.newPostTitle == '' or newPost.newPostContents == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    data =
      new_post:
        title: newPost.newPostTitle
        contents: newPost.newPostContents

    $http.post('./posts.json', data)
      .success (data) ->
        # Add new post to array of posts
        postData.data.posts.push(data)
        console.log('Successfully created post.')
      .error ->
        console.error('Failed to create new post.')

    return true

  return postData

])

