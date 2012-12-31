define [
  'jquery'
  'underscore'
  'backbone'
  'views/site/page_view'
  'bootstrap'
  ], ($, _, Backbone, Page) ->
    init: ->
      page = new Page
      $('body').append(page.render().el)

