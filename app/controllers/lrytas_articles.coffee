appPath = "#{process.cwd()}/app"

lrytasModel = require "#{appPath}/models/lrytas_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  lrytasModel.getArticle url, (article) ->
    res.json(article, 200)