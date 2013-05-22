'use strict'

# Filters 
angular.module('rumba.filters', []).filter 'interpolate', ['version', (version) ->
  (text) ->
    String(text).replace /\%VERSION\%/g, version
]