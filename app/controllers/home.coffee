appPath = "#{process.cwd()}/app"
async = require 'async'
_ = require 'underscore'

# delfiToJson = require "#{appPath}/helpers/delfi_to_json"
# min15ToJson = require "#{appPath}/helpers/min15_to_json"
# alfaToJson = require "#{appPath}/helpers/alfa_to_json"
# lRytasToJson = require "#{appPath}/helpers/lRytas_to_json"
# cosmoToJson = require "#{appPath}/helpers/cosmo_to_json"
# braskesToJson = require "#{appPath}/helpers/braskes_to_json"

module.exports.index = (req, res, next) ->
  res.render 'index',
    title: "News Hub"
  # articles = {}
  # async.waterfall([
    # (callback) ->
    #   delfiToJson.parseBody (delArticles) ->
    #     articles.del = delArticles
    #     callback(null)
    # ,
    # (callback) ->
    #   min15ToJson.parseBody (min15Articles) ->
    #     articles.min15 = min15Articles
    #     callback(null)
    # ,
    # (callback) ->
    #   alfaToJson.parseBody (alfaArticles) ->
    #     articles.alfa = alfaArticles
    #     callback(null)
    # ,
    # (callback) ->
    #   lRytasToJson.parseBody (lRytasArticles) ->
    #     articles.lRytas = lRytasArticles
    #     callback(null)
    # ,
    # (callback) ->
    #   cosmoToJson.parseBody (cosmoArticles) ->
    #     articles.cosmo = cosmoArticles
    #     callback(null)
    # ,
  #   (callback) ->
  #     braskesToJson.parseBody (braskesArticles) ->
  #       articles.braskes = braskesArticles
  #       callback(null, articles)
  # ], (err, result) ->      
    # res.json(result, 200)

  # )