# Sample comment
restify = require('restify')
restify_resource = require('./lib/restify_resource')

server = restify.createServer()
server.resource = restify_resource

server.resource('searches')
server.resource('projects')
server.resource('adapters')

server.listen process.env.PORT, ->
  console.log("Started on #{process.env.IP}:#{process.env.PORT}")
