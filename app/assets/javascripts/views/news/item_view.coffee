define [
  'backbone'
  'text!templates/news/item_view.html'
  ], (Backbone, Template) ->
    
    class NevsItemView extends Backbone.View
      className: 'news-item'
        
      initialize: (options) ->
        @template = _.template(Template)
        
      render: =>
        @$el.html(@template(@model.toJSON()))
        @