define [
  'views/news/item_view'
  'backbone'
  ], (ItemView, Backbone) ->
    
    class NewsListView extends Backbone.View
        
      initialize: (options) ->
        
      render: =>
        @$el.html()
        @addAll()
        @
        
      addAll: =>
        @collection.each @addOne
      
      addOne: (model) =>
        @itemView = new ItemView model: model
        @$el.append @itemView.render().el