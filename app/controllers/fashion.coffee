appPath = "#{process.cwd()}/app"
async = require 'async'

cosmo = require "#{appPath}/helpers/cosmo"
braskes = require "#{appPath}/helpers/braskes"
moteris = require "#{appPath}/helpers/moteris"
klubas = require "#{appPath}/helpers/klubas"

module.exports.index = (req, res, next) ->
  async.parallel([
    (callback) ->
      cosmo.parseBody (cosmoNews) ->
        callback(null, cosmoNews)
    ,
    (callback) ->
      braskes.parseBody (braskesNews) ->
        callback(null, braskesNews)
    ,
    (callback) ->
      moteris.parseBody (moterisNews) ->
        callback(null, moterisNews)
    ,
    (callback) ->
      klubas.parseBody (klubasNews) ->
        callback(null, klubasNews)
  ], (err, result) ->      
    res.json(result, 200)
  )