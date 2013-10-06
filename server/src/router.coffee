# https://groups.google.com/forum/#!msg/express-js/u5SO-nu9ptU/8CN5P7lv36AJ

require('express-namespace')

_           = require('lodash')
fs          = require('fs')
path        = require('path')
assert      = require('assert')
params      = require('express-params')
sprintf     = require('sprintf').sprintf
funcPath    = require('node-module-util').funcPath


loadControllers  = require('node-routes-autoload').loadControllers


init = (options) ->
  options = (options || {})

  assertErrFormat = funcPath(__dirname, __filename, init) + ' :: Fatal error! Missing parameter: %s'
  uuidFormat  = /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{12}$/

  assert(options.app, sprintf(assertErrFormat, 'options.app'))

  app = options.app

  # routes initialization
  params.extend(app)
  app.param('uuid', uuidFormat)
  controllers = loadControllers({
      app: app
      controllerDir: __dirname + '/controllers'
      skipControllers: ['']
  })

  # app shell, common & services routes
  app.get('/', controllers.home.index)

  # Backbone bookmarkable URLs / API routes (filtered by request type format)
  app.namespace('/users', () ->
    app.get('/'        , controllers.users.index)
    app.post('/'        , controllers.users.create)
    app.get('/:uuid'   , controllers.users.show)
    app.put('/:uuid'   , controllers.users.update)
  )

# Publicly exposed functions from the module
module.exports = { init: init }