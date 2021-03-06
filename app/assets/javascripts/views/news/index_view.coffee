define [
  'views/news/list_view'
  'collections/news'
  'backbone'
  'views/helper/spinner_view'
  ], (NewsListView, News, Backbone, Spinner) ->
    
    class NewsView extends Backbone.View
      className: "row"
      
      initialize: (options) ->
        @news = new News()
        @news.on 'reset', @renderNews
        @news.fetch()
        
      render: ->
        @$el.html()
        @spinner()
        @
        
      spinner: =>
        @spinner = new Spinner shadow: true, width: 4
        @$el.append @spinner.el
        
      renderNews: =>
        @spinner.remove()
        @listView = new NewsListView collection: @news
        @$el.append(@listView.render().el)
        