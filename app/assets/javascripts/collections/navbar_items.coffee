define [
  'models/navbar_item'
  'backbone'
  ], (NavbarItem, Backbone) ->
    
    class NavbarItems extends Backbone.Collection
      model: NavbarItem
      
      viewChanged: (changedItem) =>
        @each (item) -> 
          if item != changedItem and item.get('viewActive') 
            item.set(viewActive: false)

      loadItems: =>
        console.log 'loading items'
        # @reset([
        #   {view: PostView, viewActive: true, title: 'Posts'}
        #   {view: VideoView, viewActive: false, title: 'Videos'}
        #   {view: PicturesView, viewActive: false, title: 'Pictures'}
        # ])