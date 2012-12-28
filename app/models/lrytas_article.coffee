cheerio = require 'cheerio'
request = require 'request'

module.exports.getArticle = (url, cb) ->
  request uri: "#{url}",
    (err, req, body) ->
      lrytasArticle = []
      $ = cheerio.load(body)
      scraped = $('.realted-new-box')
      scraped.find('script').remove()
      scraped.find('.related-add-info-box').remove()
      scraped.find('.t_1').remove()
      scraped.find('#lrtop3').remove()
      scraped.find('.menu-box').remove()
      scraped.find('.realted-head').remove()
      scraped.find('.rtl-head').find('span').remove()
      scraped.find('.recept-img').remove()
      scraped.find('.rtl-gallery').remove()
      scraped.find('.str_logo_text').remove()
      scraped.find('.str-pages-div').remove()
      scraped.find('.zymes').remove()
      scraped.find('.box16').remove()
      scraped.find('.adv675').remove()
      scraped.find('.post-comment-box').remove()
      scraped.find('.srautas').remove()
      scraped.find('.block6').remove()
      scraped.find('.comm-adv').remove()
      scraped.find('noscript').remove()
      scraped.find('img').remove()
      article = scraped.html().replace('h1', 'h3')
      lrytasArticle.push article: article
      cb(lrytasArticle)