inflection = require('inflection')

String::pluralize = ->
  inflection.pluralize(@)

String::capitalize = ->
  inflection.capitalize(@)

String::underscorize = ->
  inflection.underscore(@)

dispatcher = (controller, action) ->
  _dispatcher = (request, response, next) ->
    class_name = "#{controller.pluralize().capitalize()}Controller"
    source_path = "../app/controllers/#{class_name.underscorize()}"
  
    try
      module = require(source_path)
    catch e
      throw("Could not find appropriate source for route #{controller}##{action}, tried #{source_path}")
  
    # Initialize controller class instance
    instance = new module[class_name](request, response, next)

    instance.before()
    instance[action]()
    instance.after()

    next()

  _dispatcher

resource = (name) ->
  @get "/#{name}", dispatcher(name, 'index')
  @get "/#{name}/:id", dispatcher(name, 'show')
  @post "/#{name}", dispatcher(name, 'create')
  @patch "/#{name}/:id", dispatcher(name, 'update')
  @del "/#{name}/:id", dispatcher(name, 'delete')

module.exports = resource