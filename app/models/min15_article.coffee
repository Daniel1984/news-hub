cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      min15Article = []
      $ = cheerio.load(body)
      scraped = $('.article-cntnr')
      scraped.find('.article-nfo').remove()
      scraped.find('.article-img-nfo').remove()
      scraped.find('#article-zoom-btn').remove()
      scraped.find('script').remove()
      scraped.find('.open-news-tags').remove()
      scraped.find('.related-gall-item').remove()
      scraped.find('img').addClass('centered-image')
      article = scraped.html().replace('width:680px', 'width:100%').replace('h1', 'h3')
      min15Article.push article: article
      cb(min15Article)