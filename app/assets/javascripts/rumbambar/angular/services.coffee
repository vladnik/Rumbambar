'use strict'
@Rumba ||= {}

# Services
services = angular.module('rumba.services', ['ngResource'])

# Store all models
@Rumba.models = []

# Add model
@Rumba.add_model = (name, object)->
  services.factory(name, object)
  @models.push(name)

# Add Resource model
@Rumba.add_resource_model = (name)->
  model_path = @path("api/#{name.toSnake()}/:id")
  @add_model(name, ['$resource', ($resource)->
    $resource(model_path, {id: '@id'})
  ])