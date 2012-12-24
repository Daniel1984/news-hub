request = require 'request'
cheerio = require 'cheerio'
S = require 'string'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.alfa.lt/',
    (err, response, body) ->
      alfaNews = []
      $ = cheerio.load body
      scrapedAlfa = $('.block_left').first()
      $ = cheerio.load(scrapedAlfa)
      $('.annotation').each (i, item) ->
        img = $(this).find('img').attr('src')
        if img != undefined
          alfaImg = img
        else
          alfaImg = $('.blockImage').find('img').attr('src')
        alfaTitle = $(this).find('h2').find('a').text()
        alfaTitle = S(alfaTitle).collapseWhitespace().s
        alfaUrl = "http://www.alfa.lt#{$(this).find('h2').find('a').attr('href')}"
        alfaNews.push img: alfaImg, title: alfaTitle, url: alfaUrl
      cb(alfaNews)