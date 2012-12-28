define [
  'views/helper/spinner_view'
  'text!templates/helper/modal_view.html'
], (Spinner, Template) ->

  class ModalView extends Backbone.View
    className: 'modal hide fade'
    events:
      "hidden": "leave"
       
    initialize: (options) ->
      @template = _.template(Template)
      @title = options.title
      @url = options.url
      @article = new Backbone.Model
      @article.on 'change', @renderArticle
      @article.urlRoot = "#{@title.toLowerCase()}-article"
      @render()

    render: =>
      @$el.html(@template(title: @title))
      $(@el).modal('show')
      @spinner()
      @getArticle()
      @
      
    getArticle: =>
      @article.fetch data: url: @url
          
    renderArticle: (model, res) =>
      @spinner.remove()
      @$('.modal-body').html("#{model.get('0').article}")
      
    spinner: =>
      @spinner = new Spinner shadow: true, width: 4
      @$('.modal-body').append @spinner.el
    
    leave: =>
      @spinner?.remove()
      @article.off()
      @remove()
