define [
  'views/navbar/index_view'
  'backbone'
  'text!templates/site/page_view.html'
  ], (Navbar, Backbone, Template) ->
    
    class PageView extends Backbone.View
      className: 'page'
        
      initialize: (options) ->
        @template = _.template(Template)
        
      render: ->
        @$el.html @template
        @navbar()
        @
        
      navbar: =>
        navbar = new Navbar
        @$('.navbar').append navbar.render().el