request = require 'request'
cheerio = require 'cheerio'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.delfi.lt',
    (error, response, body) ->
      delNews = []
      $ = cheerio.load(body)
      delNews.push site: "Delfi", address: 'http://www.delfi.lt'
      mostRecentFirst = $('.fp_big').first()
      mostRecentFirst.find('.fp_big_block').removeClass().addClass('fp_small_block')
      mostRecentSecond = $(".fp_smalls").first()
      articles = mostRecentFirst + mostRecentSecond
      $ = cheerio.load(articles)
      
      $('.fp_small_block').each (i, item) ->
        delTitle = $(this).find('.CBarticleTitle').text()
        delUrl = $(this).find('.CBarticleTitle').attr('href')
        delImg = $(this).find('.CBarticleImage').find('img').attr('src').replace('205x130', '330x200')
        delNews.push title: delTitle, url: delUrl, img: delImg
      cb(delNews)