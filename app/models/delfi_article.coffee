cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      delfiArticle = []
      $ = cheerio.load(body)
      if $('.delfi-article-wrapper').length > 0
        scraped = $('.delfi-article-wrapper')
      else
        scraped = $('#grynas-content-block')
      scraped.find('script').remove()
      scraped.find('.delfi-article-banner').remove()
      scraped.find('.delfi-article-title').find('a').remove()
      scraped.find('.img-article-source').remove()
      scraped.find('.delfi-article-info').remove()
      scraped.find('img').addClass('centered-image')
      scraped.find('.grynas-breadcrumb').remove()
      scraped.find('.grynas-article-controls').remove()
      scraped.find('.grynas-resize').remove()
      scraped.find('.float-right').remove()
      scraped.find('#shareit-container').remove()
      scraped.find('.block-delfi-susije').remove()
      scraped.find('#fbc').remove()
      scraped.find('#comment-dark-skin-wrapper').remove()
      scraped.find('#headlines').remove()
      delfiArticle.push article: scraped.html()
      cb(delfiArticle)