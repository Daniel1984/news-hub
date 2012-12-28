appPath = "#{process.cwd()}/app"

delfiModel = require "#{appPath}/models/delfi_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  delfiModel.getArticle url, (article) ->
    res.json(article, 200)
  