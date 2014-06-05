# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers/main
#= require_tree ./services/main

# Creates new Angular module called 'Blog'
Blog = angular.module('Blog', ['ngRoute', 'route-segment', 'view-segment'])
  .config(['$routeSegmentProvider', ($routeSegmentProvider) ->
    $routeSegmentProvider
      .when('/',                  'index')
      .when('/',                  'index.postList')
      .when('/post/new',          'index.createPost')
      .when('/post/:postId',      'index.post')
      .when('/post/edit/:postId', 'index.editPost')

    $routeSegmentProvider.segment "index",
      templateUrl: "../assets/mainIndex.html"
      controller: IndexCtrl

    $routeSegmentProvider.within("index").segment "postList",
      templateUrl: "../assets/mainPostList.html"

    $routeSegmentProvider.within("index").segment "post",
      templateUrl: "../assets/mainPost.html"
      controller: PostCtrl

    $routeSegmentProvider.within("index").segment "createPost",
      templateUrl: "../assets/mainCreatePost.html"
      controller: CreatePostCtrl

    $routeSegmentProvider.within("index").segment "editPost",
      templateUrl: "../assets/mainEditPost.html"
      controller: EditPostCtrl
  ])
  .config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])
