appPath = "#{process.cwd()}/app"

klubasModel = require "#{appPath}/models/klubas_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  klubasModel.getArticle url, (article) ->
    res.json(article, 200)