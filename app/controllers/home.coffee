appPath = "#{process.cwd()}/app"
async = require 'async'
_ = require 'underscore'

delfiToJson = require "#{appPath}/helpers/delfi_to_json"
min15ToJson = require "#{appPath}/helpers/min15_to_json"

module.exports.index = (req, res, next) ->
  async.waterfall([
    (callback) ->
      delfiToJson.parseBody (articles) ->
        callback(null, articles)
    ,
    (delArticles, callback) ->
      min15ToJson.parseBody (articles) ->
        callback(null, articles)
  ], (err, result) ->
    # res.writeHeader(200, {"Content-Type": "text/html"})
    # res.write(result.toString())
    # res.end()
    
    # reqt = http.request({method: "POST", host: "http://json.fastfrag.org"})
    # reqt.end(querystring.encode(asas: result)
    # reqt.on "response", (res) ->
    #   console.log res
    
    # res.render 'index',
    #   title: 'News Hub'
    #   delBody: JSON.stringify(result)
      
    res.json(result, 200)
  )