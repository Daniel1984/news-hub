appPath = "#{process.cwd()}/app"
async = require 'async'
_ = require 'underscore'

delfiToJson = require "#{appPath}/helpers/delfi_to_json"
min15ToJson = require "#{appPath}/helpers/min15_to_json"

module.exports.index = (req, res, next) ->
  async.waterfall([
    (callback) ->
      delfiToJson.parseBody (delArticles) ->
        callback(null, delArticles)
    ,
    (delArticles, callback) ->
      articles = {
        del: delArticles
      }
      min15ToJson.parseBody (min15Articles) ->
        articles.min15 = min15Articles
        callback(null, articles)
  ], (err, result) ->      
    res.json(result, 200)
  )