# not is use right now
angular.module('Blog').service 'shared', () ->
  shared = {}
  postId = -1

  shared.getPostId = ->
    postId

  shared.setPostId = (value) ->
    postId = value
    return

  return shared
