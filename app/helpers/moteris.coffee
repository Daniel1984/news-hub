request = require 'request'
cheerio = require 'cheerio'
S = require 'string'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.moteris.lt/',
    (err, req, body) ->
      moterisNews = []
      moterisNews.push site: 'moteris', address: 'http://www.moteris.lt/'
      $ = cheerio.load(body)
      scrapedMoteris = $('#moteris-top5')
      $ = cheerio.load(scrapedMoteris)
      $('.top5-headline').each (i, item) ->
        moterisImg = $(this).find('img').attr('src')
        moterisTitle = S($(this).find('h3').text()).collapseWhitespace().s
        moterisUrl = $(this).find('a').attr('href')
        moterisNews.push img: moterisImg, title: moterisTitle, url: moterisUrl
      cb(moterisNews)