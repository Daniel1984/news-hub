cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      alfaArticle = []
      $ = cheerio.load(body)
      scraped = $('.article')
      scraped.find('.article-info').remove()
      scraped.find('script').remove()
      scraped.find('.text_styles').remove()
      scraped.find('.column-right').remove()
      scraped.find('.blockText').remove()
      scraped.find('.media-player-thumbnails-container').remove()
      scraped.find('.block_left').remove()
      scraped.find('.silver-box').remove()
      scraped.find('.article-copyright').remove()
      scraped.find('.keywords-menu').remove()
      scraped.find('.share_block').remove()
      scraped.find('.icon_comment').remove()
      scraped.find('.icon_photo').remove()
      scraped.find('.voting').remove()
      scraped.find('.video').remove()
      scraped.find('img').addClass('centered-image')
      article = scraped.html().replace('h1', 'h3')
      alfaArticle.push article: article
      cb(alfaArticle)