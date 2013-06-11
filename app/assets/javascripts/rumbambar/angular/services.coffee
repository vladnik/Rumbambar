'use strict'

@Rumba ||= {}

# Services 

# Demonstrate how to register services
# In this case it is a simple value service.
services = angular.module('rumba.services', ['ngResource'])

# Add model
@Rumba.add_model = (name, object)->
  services.factory(name, object)

# Add Resource model
@Rumba.add_resource_model = (name)->
  model_path = @path("api/#{name.toSnake()}/:id")
  @add_model(name, ['$resource', ($resource)->
    $resource(model_path, {id: '@id'})
  ])