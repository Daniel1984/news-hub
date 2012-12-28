cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      cosmoArticle = []
      $ = cheerio.load(body)
      scraped = $('.klubas-article-container')
      scraped.find('script').remove()
      scraped.find('meta').remove()
      scraped.find('.klubas-caption').remove()
      scraped.find('.klubas-actions').remove()
      scraped.find('.delfi-article-banner').remove()
      scraped.find('#shareit-container').remove()
      scraped.find('img').addClass('centered-image')
      article = scraped.html().replace('h1', 'h3')
      cosmoArticle.push article: article
      cb(cosmoArticle)