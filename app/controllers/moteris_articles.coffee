appPath = "#{process.cwd()}/app"

moterisModel = require "#{appPath}/models/moteris_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  moterisModel.getArticle url, (article) ->
    res.json(article, 200)