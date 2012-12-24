request = require 'request'
cheerio = require 'cheerio'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.delfi.lt',
    (error, response, body) ->
      delNews = []
      $ = cheerio.load(body)
      mostRecentFirst = $('.delfi-category-headlines-big').first()
      mostRecentSecond = $(".delfi-category-headlines").first()
      articles = mostRecentFirst + mostRecentSecond
      $ = cheerio.load(articles)
      
      $('.delfi-item').each (i, item) ->
        delTitle = $(this).find('a').text()
        delUrl = $(this).find('a').attr('href')
        delImg = $(this).find('img').attr('src')
        delNews.push title: delTitle, url: delUrl, img: delImg
      cb(delNews)