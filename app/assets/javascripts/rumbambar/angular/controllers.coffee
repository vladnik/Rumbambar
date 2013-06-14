'use strict'
@Rumba ||= {}

# Define Controllers module
controllers = angular.module('rumba.controllers', [])
  .controller('DashboardCtrl')
  .controller('NavCtrl',[ '$scope', '$location', ($scope, $location)->
    $scope.collection = for model in Rumba.models
      {name: model.toTitle(), url: Rumba.path(model)}
    $scope.root = Rumba.path('')
    $scope.status = (url) ->
      'active' if url == $location.path()
  ])

# Add controller
@Rumba.add_controller = (name, object)->
  controllers.controller(name, object)

# Add index comntroller
@Rumba.add_index_controller = (model)->
  model_path = @path(model.name)
  @add_controller(model.name + 'Ctrl',['$scope', model.name, ($scope, class_object)->
    $scope.collection = class_object.query (result)->
      $scope.attrs = (key for key of result[0])[0...-5]
    $scope.url = model_path
    $scope.remove = (index)->
      if window.confirm('Are you sure?')
        $scope.collection[index].$delete()
        $scope.collection.splice(index, 1)
  ])

# Add details controller
@Rumba.add_details_controller = (model) ->
  model_path = @path(model.name)
  @add_controller(model.name + 'DetailCtrl', ['$scope','$location','$routeParams',model.name, ($scope, $location, $routeParams, class_object)->
    $scope.model = if $routeParams.id? then class_object.get(id: $routeParams.id) else new class_object()
    $scope.attrs = model.attrs
    $scope.edit_attrs = model.attrs[1..]
    $scope.url = model_path
    $scope.save = ->
      $scope.model.$save (result)->
        $location.path($scope.url +'/'+ result.id)
  ])

# Add resource controller
@Rumba.add_resource_controllers = (model)->
  @add_index_controller(model)
  @add_details_controller(model)
