angular.module('Blog').factory('postData', ['$http', 'shareNav', ($http, shareNav) ->

  postData =
    data:
      posts: [{title: 'Loading', contents: ''}]
    isLoaded: false

  postData.loadPosts = (deferred) ->
    if !postData.isLoaded
      $http.get('./posts.json')
        .success (data) ->
          postData.data.posts = data
          postData.isLoaded = true
          console.log('Successfully loaded posts.')
          if deferred
            deferred.resolve()
        .error ->
          console.error('Failed to load posts.')
          if deferred
            deferred.reject('Failed to load posts.')
    else
      if deferred
        deferred.resolve()

  postData.createPost = (newPost) ->
    if newPost.newPostTitle == '' or newPost.newPostContents == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    params =
      new_post:
        title: newPost.newPostTitle
        contents: newPost.newPostContents

    $http.post('./posts.json', params)
      .success (data) ->
        shareNav.viewPost(data.id)
        postData.data.posts.push(data)
        console.log('Successfully created post.')
      .error ->
        alert('Failed to create new post.')

    return true


  postData.editPost = (updatePost) ->
    if updatePost.editPostTitle == '' or updatePost.editPostContents == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    params =
      edit_post:
        id: updatePost.editPostId
        title: updatePost.editPostTitle
        contents: updatePost.editPostContents

    $http.put('./posts/'+updatePost.editPostId+'.json', params)
      .success (data) ->
        shareNav.viewPost(data.id)
        postData.data.posts.push(data)
        postData.isLoaded = false
        postData.loadPosts()
        console.log('Successfully updated post.')
      .error ->
        console.error('Failed to update post.')

    return true

  postData.deletePost = (post_id) ->
    params =
      id: post_id

    $http.delete('./posts/'+post_id+'.json', params)
      .success (data) ->
        postData.data.posts = _.reject(postData.data.posts, (el) -> return el.id is post_id)
        postData.isLoaded = false
        postData.loadPosts()
        console.log('Successfully deleted post.')
      .error ->
        console.error('Failed to delete post.')

    return true

  return postData

])

