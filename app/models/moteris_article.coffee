cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      moterisArticle = []
      $ = cheerio.load(body)
      scraped = $('#article')
      scraped.find('script').remove()
      scraped.find('.moteris-article-banner').remove()
      scraped.find('img').addClass('centered-image')
      article = scraped.html().replace('h1', 'h3')
      moterisArticle.push article: article
      cb(moterisArticle)