cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      braskesArticle = []
      $ = cheerio.load(body)
      scraped = $('.braskes-article')
      scraped.find('script').remove()
      scraped.find('.block-delfi-susije').remove()
      scraped.find('.delfi-article-banner').remove()
      scraped.find('iframe').remove()
      scraped.find('img').addClass('centered-image')
      article = scraped.html().replace('h1', 'h3')
      braskesArticle.push article: article
      cb(braskesArticle)