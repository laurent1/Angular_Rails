angular.module('Blog').factory('shareNav', ['$location', ($location) ->

  shareNav =
    isLoaded: false

  shareNav.navHome = ->
    $location.url('/')

  shareNav.navNewPost = ->
    $location.url('/post/new')

  shareNav.viewPost = (postId) ->
    $location.url('/post/'+postId)

  return shareNav
])
