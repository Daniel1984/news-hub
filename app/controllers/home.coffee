appPath = "#{process.cwd()}/app"
async = require 'async'

module.exports.index = (req, res, next) ->
  res.render 'index',
    title: "Top Naujienos"