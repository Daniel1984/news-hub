appPath = "#{process.cwd()}/app"

alfaModel = require "#{appPath}/models/alfa_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  alfaModel.getArticle url, (article) ->
    res.json(article, 200)