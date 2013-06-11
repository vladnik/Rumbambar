'use strict'

@Rumba ||= {}

# Filters 
angular.module('rumba.filters', [])
  .filter 'titleize', ->
    titleizeFilter = (input)->
      input.toTitle()
  .filter 'snakecase', ->
    snakeFilter = (input)->
      input.toSnake()