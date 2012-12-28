request = require 'request'
cheerio = require 'cheerio'
S = require 'string'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.alfa.lt/',
    (err, response, body) ->
      alfaNews = []
      alfaNews.push site: 'alfa', address: 'http://www.alfa.lt'
      $ = cheerio.load body
      scrapedAlfa = $('.block_left').first()
      $ = cheerio.load(scrapedAlfa)
      $('.icon_comment').remove()
      $('.annotation').each (i, item) ->
        img = $(this).find('img').attr('src')
        if img != undefined
          alfaImg = img
        else
          alfaImg = $('.blockImage').find('img').attr('src')
        alfaTitle = S($(this).find('h2').find('a').text()).collapseWhitespace().s
        alfaUrl = "http://www.alfa.lt#{$(this).find('h2').find('a').attr('href')}"
        alfaNews.push img: alfaImg, title: alfaTitle, url: alfaUrl
      cb(alfaNews)