define [
  'backbone'
  ], (Backbone) ->
    
    class NewsModel extends Backbone.Model
      urlRoot: '/news'