angular.module('Blog').factory('shareNav', ['$location', ($location) ->

  shareNav =
    isLoaded: false

  shareNav.navHome = ->
    $location.url('/')

  shareNav.navNewPost = ->
    $location.url('/post/new')

  return shareNav

])