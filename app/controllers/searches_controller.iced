BaseController = require("./base_controller.iced")

class SearchesController extends BaseController
  index: ->
    @response.send("Hello from index")

exports.SearchesController = SearchesController