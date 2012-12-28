define [
  'views/navbar/index_view'
  'collections/navbar_items'
  'backbone'
  'text!templates/site/page_view.html'
  ], (Navbar, NavbarItems, Backbone, Template) ->
    
    class PageView extends Backbone.View
      className: 'page'
        
      initialize: (options) ->
        @template = _.template(Template)
        @navItems = new NavbarItems([], {})
        @navItems.on 'active:view:changed', @displayActiveView
        @navItems.loadItems()

      render: =>
        @$el.html(@template)
        @navbar()
        @checkForActiveView()
        @

      navbar: =>
        @navbarView = new Navbar collection: @navItems, user: @user
        @$('.navbar').append(@navbarView.render().el)

      checkForActiveView: =>
        @navItems.each(@displayActiveView)

      displayActiveView: (model) =>
        if model.get 'viewActive'
          @activeView?.remove()
          View = model.get 'view'
          @activeView = new View model: model
          @$('.content').append(@activeView.render().el)