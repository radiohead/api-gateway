class BaseController
  constructor: (request, response, next) ->
    @request = request
    @response = response
    @next = next

  before: ->
    # Do nothing in vanilla

  after: ->
    # Do nothing in vanilla

module.exports = BaseController
