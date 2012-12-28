define [
  'spinner'
  'backbone'
  ], (Spinner, Backbone) ->
    
    class SpinnerView extends Backbone.View
      className: 'spinner'
        
      initialize: (options) ->
        @opts = options
        @render()
      
      render: =>
        @$el.html()
        @spinner = new Spinner(@opts).spin()
        @$el.append(@spinner.el)
        @
      