express = require 'express'
fs = require 'fs'
coffee = require 'coffee-script'

appPath = "#{process.cwd()}/app"

app = express()

app.configure ->
  app.set 'views', "#{__dirname}/app/views"
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.static("#{__dirname}/public", {maxAge: 5000})
  
  #app.use express.static("#{__dirname}/www-built") #TODO just for dev at the moment needs to be removed
  app.use(require('connect-less')(
    src: "#{__dirname}/app/assets"
    dst: "#{__dirname}/tmp/cache/less"
    force: true
    compress: true
  ))
  app.use(express.static("#{__dirname}/tmp/cache/less"))
  app.use app.router
  
app.configure 'development', -> 
  app.get(/.js$/, (req, res, next) ->
    script = req.originalUrl.substring(1, req.originalUrl.length - 3)
   
    try
      file = "app/assets/javascripts/#{script}.coffee"
      cs = fs.readFileSync "#{__dirname}/#{file}", "ascii"
      try 
        js = coffee.compile cs 
        res.header 'Content-Type', 'application/x-javascript'
        res.send(js, 200)
      catch e
        logger.error "Coffee compile error in #{file} on url #{req.originalUrl}\n", e.stack
        res.send("Coffee compile error in #{file}\n" + e.stack, { 'Content-Type': 'text/plain' }, 500)
    catch e
      next()
  )
  app.use(express.static("#{__dirname}/app/assets/javascripts"))
  # app.use(express.static("#{__dirname}/public/javascripts/app"))
  
require("#{appPath}/router/routes")(app)

port = process.env.PORT || 3300
app.listen port, ->
  console.log "Listening on #{port}"

module.exports.app = app
