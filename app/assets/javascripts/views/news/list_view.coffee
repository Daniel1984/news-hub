define [
  'views/news/item_view'
  'backbone'
  ], (ItemView, Backbone) ->
    
    class NewsListView extends Backbone.View
      className: 'span4'
        
      initialize: (options) ->
        @collection.on 'reset', @render
        
      render: =>
        @$el.html()
        @allAll()
        @
        
      addAll: =>
        @collection.each @addOne
      
      addOne: (model) =>
        @itemView = new ItemView model: model
        @$el.append @itemView.render().el