require.config(
  paths: 
    text: 'lib/require/text'
    underscore: 'lib/underscore'
    backbone: 'lib/backbone'
    jquery: 'lib/jquery'
    bootstrap: 'lib/bootstrap'
    spinner: 'lib/spin'
  shim:
    bootstrap:
      deps: ['jquery']
    underscore:
      exports: "_"
    backbone:
      deps: ['underscore','jquery']
      exports: "Backbone"
    spin:
      exports: "Spinner"
)
require([
  'app'
], (App) ->
  App.init()
)


