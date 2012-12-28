request = require 'request'
cheerio = require 'cheerio'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.delfi.lt',
    (error, response, body) ->
      delNews = []
      $ = cheerio.load(body)
      delNews.push site: "Delfi", address: 'http://www.delfi.lt'
      mostRecentFirst = $('.delfi-category-headlines-big').first()
      mostRecentSecond = $(".delfi-category-headlines").first()
      articles = mostRecentFirst + mostRecentSecond
      $ = cheerio.load(articles)
      $('.commentCount').remove()
      
      $('.delfi-item').each (i, item) ->
        delTitle = $(this).find('a').text()
        delUrl = $(this).find('a').attr('href')
        delImg = $(this).find('.delfi-image').find('img').attr('src').replace('205x130', '330x200')
        delNews.push title: delTitle, url: delUrl, img: delImg
      cb(delNews)