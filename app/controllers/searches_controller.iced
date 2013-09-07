BaseController = require("./base_controller.iced")

class SearchesController extends BaseController
  before: ->
    @searches = [
      { id: 1, name: "test1", },
      { id: 2, name: "test2", }
      { id: 3, name: "test3", }
    ]

  index: ->
    @response.send(@searches)

  show: ->
    id = @request.params.id
    @response.send("Showing id: #{id}!")

  update: ->
    id = @request.params.id
    @response.send("Updating id: #{id}")

  create: ->
    @response.send("Creating instance")

  delete: ->
    id = @request.params.id

    for search in @searches
      if search.id == id
        @message = "Deleted #{id}"

    @message = "ID #{id} not found" if @message == undefined
    @response.send({ message: @message })

exports.SearchesController = SearchesController