cheerio = require 'cheerio'
request = require 'request'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.cosmopolitan.lt/',
    (err, res, body) ->
      cosmoNews = []
      $ = cheerio.load(body)
      scrapedCosmo = $('.fb-top-items')
      $ = cheerio.load(scrapedCosmo)
      for i in [1..5]
        cosmoImg = $(".item-#{i}").find('img').attr('src')
        cosmoUrl = $(".item-#{i}").find('a').attr('href')
        cosmoTitle = $(".item-#{i}").find('h4').text()
        cosmoNews.push title: cosmoTitle, img: cosmoImg, url: cosmoUrl
      cb(cosmoNews)