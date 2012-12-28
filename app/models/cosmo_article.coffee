cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      cosmoArticle = []
      $ = cheerio.load(body)
      scraped = $('#article')
      scraped.find('.article-date').remove()
      scraped.find('.img-article-source').remove()
      scraped.find('.cosmo-article-banner').remove()
      scraped.find('script').remove()
      scraped.find('.shareit-container').remove()
      scraped.find('img').addClass('centered-image')
      article = scraped.html().replace('h1', 'h3')
      cosmoArticle.push article: article
      cb(cosmoArticle)