define [
  'views/news/index_view'
  'models/navbar_item'
  'backbone'
  ], (NewsView, NavbarItem, Backbone) ->
    
    class NavbarItems extends Backbone.Collection
      model: NavbarItem
      
      viewChanged: (changedItem) =>
        @each (item) -> 
          if item != changedItem and item.get('viewActive') 
            item.set(viewActive: false)

      loadItems: =>
        @reset([
          {view: NewsView, viewActive: true, title: 'Naujienos'}
        ])