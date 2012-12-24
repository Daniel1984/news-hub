appPath = "#{process.cwd()}/app"
async = require 'async'

delfiToJson = require "#{appPath}/models/delfi_to_json"
min15ToJson = require "#{appPath}/models/min15_to_json"
alfaToJson = require "#{appPath}/models/alfa_to_json"
lRytasToJson = require "#{appPath}/models/lRytas_to_json"

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