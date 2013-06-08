###
This is a manifest file that'll be compiled into application.js, which will include all the files
listed below.

Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.

It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
the compiled file.

WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
GO AFTER THE REQUIRES BELOW.

= require jquery
= require jquery_ujs
= require angular
= require angular-resource
= require bootstrap
= require_tree ./angular
###

# Application Helpers

@asset_path = (name)->
  rumba_init.asset_path + name

@rumba_path = (name)->
  rumba_init.namespace + name.toSnake()

String.prototype.toSnake = ->
    # Lowercase first character
    string = this.charAt(0).toLowerCase() + this.slice(1)
    string.replace(/([A-Z])/g, '_$1').toLowerCase()

String.prototype.toTitle = ->
  input = this.toSnake()
  (word.charAt(0).toUpperCase() + word.slice(1) for word in input.split('_')).join(' ')