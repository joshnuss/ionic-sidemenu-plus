# Ionic Starter App

# angular.module is a global place for creating, registering and retrieving Angular modules
# 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
# the 2nd parameter is an array of 'requires'
# 'starter.controllers' is found in controllers.js

# Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
# for form inputs)

# org.apache.cordova.statusbar required
angular.module("starter", ["ionic", "starter.controllers"])

  .run ($ionicPlatform) ->

    $ionicPlatform.ready ->
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar true  if window.cordova and window.cordova.plugins.Keyboard
      StatusBar.styleDefault()  if window.StatusBar

  .config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
      .state "app",
        url: ""
        abstract: true
        templateUrl: "menu.html"
        controller: "AppCtrl"

      .state "app.search",
        url: "/search"
        views:
          menuContent:
            templateUrl: "search.html"

      .state "app.browse",
        url: "/browse"
        views:
          menuContent:
            templateUrl: "browse.html"

      .state "app.playlists",
        url: "/playlists"
        views:
          menuContent:
            templateUrl: "playlists.html"
            controller: "PlaylistsCtrl"

     .state "app.single",
        url: "/playlists/:playlistId"
        views:
          menuContent:
            templateUrl: "playlist.html"
            controller: "PlaylistCtrl"

    # if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise "/playlists"
