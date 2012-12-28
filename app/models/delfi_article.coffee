cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      delfiArticle = []
      $ = cheerio.load(body)
      scraped = $('.delfi-article-wrapper')
      scraped.find('script').remove()
      scraped.find('.delfi-article-banner').remove()
      scraped.find('.delfi-article-title').find('a').remove()
      scraped.find('.img-article-source').remove()
      scraped.find('img').addClass('centered-image')
      if scraped.length > 0
        title = scraped.find('.delfi-article-title').html()
        body = scraped.find('.delfi-article-body').html()
        article = title + body
      else
        console.log "NOOOOO"
      delfiArticle.push article: article
      cb(delfiArticle)