express = require 'express'
appPath = "#{process.cwd()}/app"

homeCtrl = require "#{appPath}/controllers/home"
newsCtrl = require "#{appPath}/controllers/news"
fashionCtrl = require "#{appPath}/controllers/fashion"

delfiCtrl = require "#{appPath}/controllers/delfi_articles"
min15Ctrl = require "#{appPath}/controllers/min15_articles"
alfaCtrl = require "#{appPath}/controllers/alfa_articles"
lrytasCtrl = require "#{appPath}/controllers/lrytas_articles"

cosmoCtrl = require "#{appPath}/controllers/cosmo_articles"
braskesCtrl = require "#{appPath}/controllers/braskes_articles"
moterisCtrl = require "#{appPath}/controllers/moteris_articles"
klubasCtrl = require "#{appPath}/controllers/klubas_articles"

module.exports = (app) ->
  app.get "/", homeCtrl.index
  app.get "/news", newsCtrl.index	
  app.get "/fashion", fashionCtrl.index
  
  app.get "/delfi-article", delfiCtrl.index
  app.get "/15min-article", min15Ctrl.index
  app.get "/alfa-article", alfaCtrl.index
  app.get "/lrytas-article", lrytasCtrl.index
  
  app.get "/cosmopolitan-article", cosmoCtrl.index
  app.get "/5braskes-article", braskesCtrl.index
  app.get "/moteris-article", moterisCtrl.index
  app.get "/klubas-article", klubasCtrl.index