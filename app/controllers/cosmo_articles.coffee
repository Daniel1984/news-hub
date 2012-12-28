appPath = "#{process.cwd()}/app"

cosmoModel = require "#{appPath}/models/cosmo_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  cosmoModel.getArticle url, (article) ->
    res.json(article, 200)