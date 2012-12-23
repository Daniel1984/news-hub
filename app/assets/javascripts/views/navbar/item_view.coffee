define [
  'backbone'
  'text!templates/navbar/item_view.html'
  ], (Template, Backbone) ->
    
    class ItemView extends Backbone.View
      tagName: 'li'
      events:
        'click': 'displayActiveView'
      
    initialize: (options) ->
      @template = _.template(Template)
      @model.on 'change:viewActive', @updateActiveView
      
    render: =>
      @$el.html(@template(@model.toJSON()))
      @updateActiveView()
      @

    updateActiveView: =>
      if @model.get 'viewActive'
        @$el.removeClass 'inactive'
        @$el.addClass 'active'
      else
        @$el.removeClass 'active'
        @$el.addClass 'inactive'

    displayActiveView: (e) =>
      e.preventDefault()
      @model.activateView()
      @model.collection.viewChanged(@model)

    leave: =>
      @model.off 'change:viewActive'
      @remove()