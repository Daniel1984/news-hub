define [
  'jquery'
  'backbone'
  'views/site/page_view'
  'bootstrap'
  ], ($, Backbone, Page) ->
    init: ->
      $( ->
          page = new Page
          $('body').append(page.render().el)
        )

