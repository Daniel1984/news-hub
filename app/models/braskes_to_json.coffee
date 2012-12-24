request = require 'request'
cheerio = require 'cheerio'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.5braskes.lt/',
    (err, res, body) ->
      braskesNews = []
      $ = cheerio.load(body)
      scrapedBraskes = $('.viewport')
      $ = cheerio.load(scrapedBraskes)
      $('li').each (i, item) ->
        braskesTitle = $(this).find('.braskes-title').text()
        braskesImg = $(this).find('img').attr('src')
        braskesUrl = $(this).find('a').attr('href')
        braskesNews.push title: braskesTitle, img: braskesImg, url: braskesUrl
      cb(braskesNews)