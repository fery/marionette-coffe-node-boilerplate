'use strict'

module.exports = (grunt)->
  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")

    concat:
      options:
        separator: ';'
      libs:
        src: ["client/vendor/js/*.js"]
        dest: "server/public/js/libs.js"

      css:
        src: ["client/vendor/css/*.css", "client/src/**/*.css"]
        dest: "server/public/css/style.css"


    copy :
      images :
        files :
          expand: true
          src: ['client/vendor/img/*']
          dest: 'server/public/img'

    jst:
      compile:
        files:
          "server/public/js/templates.js": ["client/src/templates/**/*.html"]

    coffee:
      compileDefault:
        files:
          "server/public/client.js": [ "client/js/namespace.coffee","client/js/**/*.coffee" , "client/js/index.coffee"]
          "server/lib/server.js": "server/src/**/*.coffee"


    watch:
      files: ["client/**/*", "app/**/*", "test/unit/**/*.coffee"]
      tasks: "coffee concat jst"


    clean: ["server/public/"]
  )

  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-jst"


  grunt.registerTask("default", ["clean", "coffee", "concat", "jst" ])
