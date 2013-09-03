dispatcher = (controller, action) ->
  _dispatcher = (request, response, next) ->
    class_name = "#{controller.pluralize().capitalize()}Controller"
    source_path = "./app/controllers/#{class_name.underscorize()}"
  
    try
      module = require(source_path)
    catch e
      throw("Could not find appropriate source for route #{controller}##{action}, tried #{source_path}")
  
    # Initialize controller class instance
    instance = new module[class_name](request, response, next)

    instance.before()
    instance[action]()
    instance.after()
  
  _dispatcher

module.exports = dispatcher