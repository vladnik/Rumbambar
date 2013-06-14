'use strict'
@Rumba ||= {}

# Directives
angular.module('rumba.directives', []).directive 'appVersion', ['version', (version) ->
  (scope, elm, attrs) ->
    elm.text version
]