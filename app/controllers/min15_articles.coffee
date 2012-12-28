appPath = "#{process.cwd()}/app"

min15Model = require "#{appPath}/models/min15_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  min15Model.getArticle url, (article) ->
    res.json(article, 200)