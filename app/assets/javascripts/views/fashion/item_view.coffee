define [
  'views/helper/modal_view'
  'backbone'
  'text!templates/news/item_view.html'
  ], (Modal, Backbone, Template) ->
    
    class FashionItemView extends Backbone.View
      className: 'span3'
      events:
        'click .article-address': "getArticleBody"
        
      initialize: (options) ->
        @template = _.template(Template)
        
      render: =>
        data = @model.toJSON()
        @details = site: data['0']['site'], address: data['0']['address']
        delete data['0']
        @$el.html(@template(posts: data, details: @details))
        @
        
      getArticleBody: (e) =>
        e.preventDefault()
        @modal = new Modal title: @details.site, url: $(e.currentTarget).attr('href')
        @$el.append(@modal.el)