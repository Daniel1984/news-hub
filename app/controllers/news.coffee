appPath = "#{process.cwd()}/app"
async = require 'async'

delfiToJson = require "#{appPath}/helpers/delfi"
min15ToJson = require "#{appPath}/helpers/min15"
alfaToJson = require "#{appPath}/helpers/alfa"
lRytasToJson = require "#{appPath}/helpers/lRytas"

module.exports.index = (req, res, next) ->
  async.parallel([
    (callback) ->
      delfiToJson.parseBody (delArticles) ->
        callback(null, delArticles)
    ,
    (callback) ->
      min15ToJson.parseBody (min15Articles) ->
        callback(null, min15Articles)
    ,
    (callback) ->
      alfaToJson.parseBody (alfaArticles) ->
        callback(null, alfaArticles)
    ,
    (callback) ->
      lRytasToJson.parseBody (lRytasArticles) ->
        callback(null, lRytasArticles)
  ], (err, result) ->      
    res.json(result, 200)
  )