appPath = "#{process.cwd()}/app"

braskesModel = require "#{appPath}/models/braskes_article"

module.exports.index = (req, res, next) ->
  url = req.query.url
  braskesModel.getArticle url, (article) ->
    res.json(article, 200)