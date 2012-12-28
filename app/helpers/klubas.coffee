cheerio = require 'cheerio'
request = require 'request'

module.exports.parseBody = (cb) ->
  request uri: 'http://klubas.delfi.lt/',
    (err, req, body) ->
      klubasNews = []
      klubasNews.push site: "klubas", address: 'http://klubas.delfi.lt/'
      $ = cheerio.load(body)
      scrapedMain = $('.klubas-featured-main-container')
      scrapedRest = $('.klubas-featured-container')
      
      klubasMainImg = scrapedMain.find('.klubas-image').find('img').attr('src')
      klubasMainTitle = scrapedMain.find('.klubas-content').find('.klubas-title').text()
      klubasMainUrl = scrapedMain.find('.klubas-content').find('a').attr('href')
      klubasNews.push img: klubasMainImg, title: klubasMainTitle, url: klubasMainUrl
      
      scrapedRest.find('.klubas-item').each (i, item) ->
        klubasRestImg = $(this).find('img').attr('src').replace('228x138', '730x360')
        klubasRestTitle = $(this).find('.klubas-title').text()
        klubasRestUrl = $(this).find('a').attr('href')
        klubasNews.push img: klubasRestImg, title: klubasRestTitle, url: klubasRestUrl
        
      cb(klubasNews)