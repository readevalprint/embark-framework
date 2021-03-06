module.exports = (grunt) ->

  grunt.initConfig
    "embark-framework": {}
    pkg: grunt.file.readJSON('package.json')
    clean:
      build: ["build/"]
    coffee:
      compile:
        expand: true
        src: 'src/**/*.coffee'
        dest: 'build/'
        ext: '.js'
    uglify:
      options: banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
      build:
        files:
          'build/<%= pkg.name %>.min.js': [
            "build/<%= pkg.name %>.js"
          ]
    mochaTest:
      test:
        src: ['test/**/*.js']

  grunt.loadTasks "tasks"
  require('matchdep').filterAll('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.registerTask 'default', ['clean']
  grunt.registerTask 'build', ['clean', 'coffee']

