define [
  'models/fashion'
  'backbone'
  ], (Fashion, Backbone) ->
    
    class Fashions extends Backbone.Collection
      model: Fashion
      url: '/fashion'