module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON("package.json")


    # Check Coffee
    coffeelint:
      app: ['src/**/*.coffee']
      options:
        'no_trailing_whitespace':
          level: 'warn'
        'max_line_length':
          level: 'warn'


    # Coffee -> JS
    coffee:
      dist:
        files:
          'js/script.js': ['src/js/*.coffee'] # compile all coffee files and concatenate into a single one
        options:
          sourceMap: false
          join: true
          bare: true


    # SASS -> CSS
    compass:
      options:
        sassDir: "src/css"
        cssDir: "css/"
        raw: 'preferred_syntax = :sass\n'
      debugsass: true

    watch:
      main:
        files: ['src/**']
        tasks: ['default']

  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "build", ["coffeelint", "coffee", "compass"]

  grunt.registerTask "dev", ["build"]

  grunt.registerTask "default", ["dev"]

