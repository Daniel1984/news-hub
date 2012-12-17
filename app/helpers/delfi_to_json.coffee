request = require 'request'
cheerio = require 'cheerio'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.delfi.lt',
    (error, response, body) ->
      delNews = {
        del_articles: []
      }
      $ = cheerio.load(body)
      mostRecentFirst = $('.delfi-category-headlines-big').first()
      mostRecentSecond = $(".delfi-category-headlines").first()
      articles = mostRecentFirst + mostRecentSecond
      $ = cheerio.load(articles)
      
      $('.delfi-item').each (i, item) ->
        title = $(this).find('a').text()
        titleLink = $(this).find('a').attr('href')
        imageLink = $(this).find('img').attr('src')
        delNews.del_articles[i] = title: title, link: titleLink, image: imageLink
      cb(delNews)