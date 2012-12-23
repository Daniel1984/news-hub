require.config(
  paths: 
    text: 'lib/require/text'
    underscore: 'lib/underscore'
    backbone: 'lib/backbone'
    jquery: 'lib/jquery'
    bootstrap: 'lib/bootstrap'
  shim:
    bootstrap:
      deps: ['jquery']
    underscore:
      exports: "_"
    backbone:
      deps: ['underscore','jquery']
      exports: "Backbone"
)
require([
  'app'
], (App) ->
  App.init()
)


