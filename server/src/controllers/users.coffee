assert = require('assert')
sprintf = require('sprintf').sprintf
funcPath = require('node-module-util').funcPath


# GET users list
index = (req, res) ->
  res.send("respond with a resource")


# POST create new user
create = (req, res) ->
  res.send("respond with a resource")


# GET user by id
show = (req, res) ->
  userId = req.params.uuid.toString()
  res.send("respond with a resource")


# PUT update user by id
update = (req, res) ->
  userId = req.params.uuid.toString()
  res.send("respond with a resource")


# Initializes module
init = (options) ->
  options = (options || {})

  assertErrFormat = funcPath(__dirname, __filename, init) + ' :: Fatal error! Missing parameter: %s'
  assert(options.app, sprintf(assertErrFormat, 'options.app'))

  return {
    index : index
    create: create
    show  : show
    update: update
  }


# Publicly exposed functions from the module
module.exports = { init: init}