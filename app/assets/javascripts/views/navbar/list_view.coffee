define [
  'views/navbar/item_view'
  'backbone'
  ], (ItemView, Backbone) ->
    
    class ItemView extends Backbone.View
      className:  'nav'
      tagName:    'ul'
      
      initialize: (options) ->
        @collection.on 'reset', @render
        
      render: =>
        @$el.html()
        @addAll()
        @

      addAll: =>
        @collection.each(@addOne)

      addOne: (model) =>
        @view = new NavItemView model: model
        @$el.append(@view.render().el)