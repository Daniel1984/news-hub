request = require 'request'
cheerio = require 'cheerio'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.15min.lt/',
    (err, res, body) ->
      min15News = []
      min15News.push site: '15min', address: 'http://www.15min.lt/'
      $ = cheerio.load(body)
      $('.article-extract').each (i, item) ->
        scraped15Min = $(this).find('.df-img-container-inner')
        if min15News.length <= 4 and scraped15Min.find('a').length > 0 and $(this).find('.rel-gal-item').length <= 0
          min15Title = $(this).find('.article-content').find('h3').text()
          min15Img = scraped15Min.find('img').attr('src')
          min15Url = scraped15Min.find('a').attr('href')
          min15News.push title: min15Title, img: min15Img, url: min15Url
      cb(min15News)