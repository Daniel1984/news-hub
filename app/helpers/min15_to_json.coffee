request = require 'request'
cheerio = require 'cheerio'

async = require 'async'

module.exports.parseBody = (cb) ->
  async.waterfall([
      (callback) ->
        request uri: 'http://www.15min.lt/',
          (err, res, body) ->
            titles = []
            links = []
            $ = cheerio.load(body)
            $('.article-extract').each (i, item) ->
              if links.length <= 4 and $(this).find('.df-img-container-inner').find('a').length > 0 and $(this).find('.rel-gal-item').length <= 0
                links.push $(this).find('.df-img-container-inner').find('a').attr('href')
                console.log links
              # if titles.length <= 4 and $(this).find('h3').length > 0
              #   titles.push $(this).find('h3').text()
            callback(null, links)
      ,
      (links, callback) ->
        min15News = {
          min15_articles: []
        }
        for link in links
          request uri: "#{link}",
            (err, res, body) ->
              $ = cheerio.load(body)
              min15Title = $('.article-cntnr').find('.article-title').text()
              min15Img = $('.article-cntnr').find('.article-img').find('img').attr('src')
              min15Intro = $('.article-cntnr').find('#article-intro').find('strong').text()
              min15News.min15_articles.push title: min15Title, image: min15Img, intro: min15Intro
              console.log min15Title
              if min15News.min15_articles.length == 5
                callback(null, min15News)
  ], (err, result) ->
    cb(result)
  )