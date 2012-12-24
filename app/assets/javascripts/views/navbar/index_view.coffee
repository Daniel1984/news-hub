define [
  'backbone'
  'views/navbar/list_view'
  'text!templates/navbar/index_view.html'
], (Backbone, NavListView, Template) ->

  class NavbarShowView extends Backbone.View
    className: 'navbar-inner'

    initialize: (options) ->
      @template = _.template(Template)
      @items = options.collection

    render: =>
      @$el.html(@template)
      @renderItems()
      @

    renderItems: =>
      @navItemsList = new NavListView collection: @items
      @$('.nav-collapse').append(@navItemsList.render().el)

    leave: =>
      @remove()
