define [
  'views/fashion/list_view'
  'collections/fashions'
  'backbone'
  'views/helper/spinner_view'
  ], (FashionListView, Fashions, Backbone, Spinner) ->
    
    class NewsView extends Backbone.View
      className: "row"
      
      initialize: (options) ->
        @fashions = new Fashions()
        @fashions.on 'reset', @renderNews
        @fashions.fetch()
        
      render: ->
        @$el.html()
        @spinner()
        @
        
      spinner: =>
        @spinner = new Spinner shadow: true, width: 4
        @$el.append @spinner.el
        
      renderNews: =>
        @spinner.remove()
        @listView = new FashionListView collection: @fashions
        @$el.append(@listView.render().el)
