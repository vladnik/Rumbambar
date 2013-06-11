'use strict'

@Rumba ||= {}
navigation_buttons = []

# Define Controllers module
controllers = angular.module('rumba.controllers', [])
  .controller('DashboardCtrl')
  .controller('NavCtrl', [ '$scope', '$location', ($scope, $location) ->
    $scope.collection = navigation_buttons
    $scope.status = (url) ->
      'active' if url == $location.path()
  ])

# Add navigation
@Rumba.add_navigation = (resource) ->
  navigation_buttons.push(resource)

# Add controller
@Rumba.add_controller = (name, object)->
  controllers.controller(name, object)

model_path = ''
# Abstract Index controller
IndexCtrl = ($scope, class_object)->
  $scope.collection = class_object.query (result)->
    keys = (key for key of result[0])
    $scope.attrs = keys[0...-5]
  $scope.url = model_path
  $scope.remove = (index)->
    if window.confirm('Are you sure?')
      $scope.collection[index].$delete()
      $scope.collection.splice(index, 1)


model_atts = []
# Abstract Details controller
DetailCtrl = ($scope, $location, $routeParams, class_object)->
  $scope.model = if $routeParams.id? then class_object.get(id: $routeParams.id) else new class_object()
  $scope.url = model_path
  $scope.attrs = model_atts
  $scope.edit_attrs = model_atts[1..]
  $scope.save = ->
    $scope.model.$save (result)->
      $location.path($scope.url +'/'+ result.id)

# Add resource controller
@Rumba.add_resource_controllers = (model)->
  model_path = @path(model.name)
  model_atts = model.attrs
  @add_controller(model.name + 'Ctrl', [ '$scope', model.name, IndexCtrl])
  @add_controller(model.name + 'DetailCtrl', [ '$scope', '$location', '$routeParams', model.name, DetailCtrl])
  @add_navigation({name: model.name, url: model_path})
