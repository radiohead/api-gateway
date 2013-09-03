# Sample comment
restify = require('restify')
inflection = require('inflection')
dispatcher = require('./dispatcher')

String::pluralize = ->
  inflection.pluralize(@)

String::capitalize = ->
  inflection.capitalize(@)

String::underscorize = ->
  inflection.underscore(@)

server = restify.createServer()
server.resource = (name) ->
  # Setup RESTful routes
  server.get "/#{name}", dispatcher(name, 'index')
  #server.get("/#{name}/:id", instance['show'])
  #server.post("/#{name}", instance['create'])
  #server.patch("/#{name}/:id", instance['update'])
  #server.del("/#{name}/:id", instance['delete'])

server.resource('search')

server.listen process.env.PORT, ->
  console.log("Started on #{process.env.IP}:#{process.env.PORT}")
