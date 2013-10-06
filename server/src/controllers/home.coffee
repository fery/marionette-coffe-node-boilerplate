path      = require('path')
assert    = require('assert')
uaParser  = require('ua-parser')
sprintf   = require('sprintf').sprintf
funcPath  = require('node-module-util').funcPath

# GET home page
index = (req, res) ->
  appConfig = app.get('config') || {}
  app.renderAppShell(res, appConfig)

# Initializes module
init = (options) ->
  options = (options || {})

  assertErrFormat = funcPath(__dirname, __filename, init) + ' :: Fatal error! Missing parameter: %s'
  assert(options.app, sprintf(assertErrFormat, 'options.app'))

  app = options.app

  {index   : index}



module.exports = { init: init }