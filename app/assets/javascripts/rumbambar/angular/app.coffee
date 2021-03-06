'use strict'
@Rumba ||= {}

# Declare app level module which depends on filters, and services
application = angular.module('rumba', ['rumba.filters', 'rumba.services', 'rumba.directives', 'rumba.controllers'])
  .config(['$routeProvider', ($routeProvider) ->
#    $routeProvider.when '/rumba',
#      templateUrl: 'assets/rumbambar/dashboard.html'
#      controller: 'DashboardCtrl'
    $routeProvider.otherwise redirectTo: '/rumba'
  ])
  .config(['$locationProvider',($locationProvider) ->
    $locationProvider.html5Mode(true)
  ])

@Rumba.add_route = (route) ->
  application.config(['$routeProvider', ($routeProvider) ->
    $routeProvider.when route.path,
      templateUrl: route.template
      controller: route.controller
  ])

@Rumba.add_resource_routes = (name)->
  detailCtrl = name + 'DetailCtrl'
  # Index action
  @add_route
    path: @path(name)
    template: @asset_path('rumbambar/index.html')
    controller: name + 'Ctrl'
  # Show action
  @add_route
    path: @path(name + '/:id')
    template: @asset_path('rumbambar/show.html')
    controller: detailCtrl
  # New action
  @add_route
    path: @path(name + '/new')
    template: @asset_path('rumbambar/edit.html')
    controller: detailCtrl
  # Edit action
  @add_route
    path: @path(name + '/:id/edit')
    template: @asset_path('rumbambar/edit.html')
    controller: detailCtrl
