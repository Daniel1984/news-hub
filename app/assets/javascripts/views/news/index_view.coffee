define [
  'views/news/list_view'
  'collections/news'
  'backbone'
  'text!templates/news/index_view.html'
  ], (NewsListView, News, Backbone, Template) ->
    
    class NewsView extends Backbone.View
      className: "row"
      
      initialize: (options) ->
        @template = _.template(Template)
        @news = new News()
        @news.on 'reset', @test
        @news.fetch()
        
      render: ->
        console.log @news
        @$el.html(@template)
        @
        
      test: =>
        console.log @news