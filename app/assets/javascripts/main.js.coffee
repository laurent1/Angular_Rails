# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers/main
#= require_tree ./services/main
#= require_tree ./services/global

# Creates new Angular module called 'Blog'
Blog = angular.module('Blog', ['ngRoute'])
  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/post/new', { templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl'})
      # .when('/post/:postId', { reloadOnSearch: false, controller: 'PostCtrl'})
      .when('/post/edit/:postId', { templateUrl: '../assets/mainEditPost.html', controller: 'EditPostCtrl' } )
      .otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl'})
  ])
  .config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])
