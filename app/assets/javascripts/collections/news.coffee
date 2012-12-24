define [
  'models/news'
  'backbone'
  ], (NewsModel, Backbone) ->
    
    class NewsCollection extends Backbone.Collection
      model: NewsModel
      url: '/news'
    