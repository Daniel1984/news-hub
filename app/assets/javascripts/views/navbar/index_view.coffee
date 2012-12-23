define [
  'views/navbar/list_view'
  'backbone'
  'text!templates/navbar/index_view.html'
  ], (ListView, Backbone, Template) ->
    
    class NavbarView extends Backbone.View
      className: 'navbar-inner'
        
      initialize: (options) ->
        @template = _.template(Template)
        @items = options.navbarItems
        
      render: =>
        @$el.html(@template)
        @renderItems()
        @
        
      renderItems: =>
        @listView = new ListView collection: @items
        @$('.nav-collapse').append(@listView.render().el)