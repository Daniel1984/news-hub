define [
  'backbone'
  ], (Backbone) ->
    
    class NavbarItem extends Backbone.Model
      
      activateView: ->
        if !@get 'viewActive'
          @set viewActive: true
          @trigger 'active:view:changed', @
        