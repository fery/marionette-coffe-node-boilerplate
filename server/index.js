var appOptions = {
        appName   : 'WriteJam'
      , appPort   : parseInt(process.env['APP_PORT'], 10) || 8080
      , Router    : require('./lib/router')
      , appTitle  : 'Write Jam!'
    };

require('./lib/server').init(appOptions);
