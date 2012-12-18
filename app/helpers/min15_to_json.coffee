request = require 'request'
cheerio = require 'cheerio'

module.exports.parseBody = (cb) ->
  request uri: 'http://www.15min.lt/',
    (err, res, body) ->
      min15News = []
      $ = cheerio.load(body)
      $('.article-extract').each (i, item) ->
        scraped15Min = $(this).find('.df-img-container-inner')
        if min15News.length <= 4 and scraped15Min.find('a').length > 0 and $(this).find('.rel-gal-item').length <= 0
          min15ImgTitle = scraped15Min.find('img').attr('title')
          min15ImgAlt = scraped15Min.find('img').attr('alt')
          if min15ImgTitle != '' then min15Title = min15ImgTitle else min15Title = min15ImgAlt
          min15Img = scraped15Min.find('img').attr('src')
          min15Url = scraped15Min.find('a').attr('href')
          min15News.push title: min15Title, img: min15Img, url: min15Url
      cb(min15News)
  
  # async.waterfall([
  #     (callback) ->
  #       request uri: 'http://www.15min.lt/',
  #         (err, res, body) ->
  #           links = []
  #           $ = cheerio.load(body)
  #           $('.article-extract').each (i, item) ->
  #             if links.length <= 4 and $(this).find('.df-img-container-inner').find('a').length > 0 and $(this).find('.rel-gal-item').length <= 0
  #               links.push $(this).find('.df-img-container-inner').find('a').attr('href')
  #           callback(null, links)
  #     ,
  #     (links, callback) ->
  #       min15News = {
  #         min15_articles: []
  #       }
  #       for link in links
  #         request uri: "#{link}",
  #           (err, res, body) ->
  #             $ = cheerio.load(body)
  #             min15Title = $('.article-cntnr').find('.article-title').text()
  #             min15Img = $('.article-cntnr').find('.article-img').find('img').attr('src')
  #             min15Intro = $('.article-cntnt').find('#article-intro').find('p').first().text()
  #             min15Body = $('.article-cntnt').each (i, item) ->
  #               $(this).find('strong').remove()
  #               $(this).find('blockquote').remove()
  #               $(this).find('table').remove()
  #               min15Body = $(this).find('p').text()
  #               min15News.min15_articles.push title: min15Title, image: min15Img, intro: min15Intro, body: min15Body
  #             if min15News.min15_articles.length == 5
  #               callback(null, min15News)
  # ], (err, result) ->
  #   cb(result)
  # )