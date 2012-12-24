express = require 'express'
appPath = "#{process.cwd()}/app"

homeCtrl = require "#{appPath}/controllers/home"
newsCtrl = require "#{appPath}/controllers/news"

module.exports = (app) ->
	app.get "/", homeCtrl.index
	
	app.get "/news", newsCtrl.index