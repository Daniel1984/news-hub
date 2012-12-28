request = require 'request'
cheerio = require 'cheerio'
S = require 'string'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.lrytas.lt/',
    (err, res, body) ->
      $ = cheerio.load body
      $('.nw').remove()
      lRytasNews = []
      lRytasNews.push site: 'lrytas', address: 'http://www.lrytas.lt/'
      lRytasImg = $('.top-naujiena-left').find('img').attr('src')
      lRytasTitle = S($('.top-naujiena-right').find('h1').text()).collapseWhitespace().s
      lRytasUrl = "http://www.lrytas.lt/#{$('.top-naujiena-left').find('a').attr('href')}"
      lRytasNews.push img: lRytasImg, title: lRytasTitle, url: lRytasUrl
      $('.block1a').find('.top-naujienos-1').each (i, item) ->
        lRytasTitle = S($(this).find('h2').text()).collapseWhitespace().s
        lRytasUrl = "http://www.lrytas.lt#{$(this).find('h2').find('a').attr('href')}"
        lRytasImg = $(this).find('a').find('img').attr('src')
        lRytasNews.push img: lRytasImg, title: lRytasTitle, url: lRytasUrl
      cb lRytasNews