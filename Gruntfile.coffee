module.exports = (grunt) ->
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      reset:
        src: ['bin']
      temp:
        src: ['temp']

    coffeeLint: 
      scripts:
        files: [
          {
            expand: true
            src: ['client/**/*.coffee', '!client/js/components/**']
          }
        ]
        options:
          indentation:
            value: 2
            level: 'error'
          no_plusplus: 
            level: 'error'
      tests:
        files: [
          {
            expand: true
            src: ['test/**/*.coffee']
          }
        ]
        options:
          indentation:
            value: 2
            level: 'error'
          no_plusplus: 
            level: 'error'
    coffee:
      scripts:
        expand: true
        cwd: 'client'
        src: ['**/*.coffee']
        dest: 'temp/client/'
        ext: '.js'
        options:
          bare: true
    less:
      styles:
        dest: 'temp/client/css/styles.css'
        src: 'client/css/styles.less'
    
    template:
      dev:
        dest: 'bin/client/index.html'
        src: 'client/index.template'
        environment: 'dev'
      prod:
        dest: '<%= template.dev.dest %>'
        src: '<%= template.dev.src %>'
        environment: 'prod'

    ngTemplateCache:
      views:
        files:
          './temp/client/js/views.js': './client/js/views/*.html'
        options:
          trim: './client/js'
    copy:
      dev:
        expand: true
        cwd: 'temp/client'
        src: ['**']
        dest: 'bin/client' 
      prod:
        expand: true
        cwd: 'temp/client'
        src: ['*.json', 'img/**']
        dest: 'bin/client'
      static:
        expand: true
        cwd: 'client/'
        src: ['img/*', 'js/libs/*.js', '*.json']
        dest: 'temp/client' 

    requirejs:
      scripts:
        options:
          baseUrl: 'temp/client/js/'
          findNestedDependencies: true
          logLevel: 0
          mainConfigFile: 'temp/client/js/main.js'
          name: 'main'
          onBuildWrite: (moduleName, path, contents) ->
            modulesToExclude = ['main']
            shouldExcludeModule = modulesToExclude.indexOf(moduleName) >= 0

            if (shouldExcludeModule)
              return ''

            return contents
          optimize: 'uglify'
          out: 'bin/client/js/scripts.min.js'
          preserveLicenseComments: false
          skipModuleInsertion: true
          uglify:
            no_mangle: false
      styles:
        options:
          baseUrl: './temp/client/css/'
          cssIn: './temp/client/css/styles.css'
          logLevel: 0
          optimizeCss: 'standard'
          out: 'bin/client/css/styles.min.css'
    connect:
      server:
        options:
          port: 9001
          base: 'bin/client'
          middleware: (connect, options) ->
            [
              (req, res, next) ->
                fs = require 'fs'
                url = require 'url'
                send = require 'send'
                path = options.base + url.parse(req.originalUrl).pathname
                fs.exists path, (exists) ->
                  if exists
                    next()
                  else
                    send(req,options.base + '/index.html')
                    .pipe(res)
              , connect.static(options.base)
            ]

    reload:
        port: 35729
        liveReload: {}

    watch:
      dev:
        files: ['client/**']
        tasks: ['build', 'reload', 'karma:ci:run']
      html:
        files: ['client/views/*.html']
        tasks: ['ngTemplateCache', 'copy:views', 'karma:ci:run']
      unitTests:
        files: ['test/client/**/*.coffee']
        tasks: ['coffeeLint:tests', 'karma:ci:run']

    karma:
      unit:
        configFile: 'test/karma.conf.js'
        reporters: ['dots', 'growl']
        singleRun: true
      ci:
        configFile: 'test/karma.conf.js'
        reporters: ['dots', 'growl']
      travis:
        configFile: 'test/karma.conf.js'
        singleRun: true
        browsers: [ 'PhantomJS' ]
      coverage:
        configFile: 'test/karmaCoverage.conf.js'
        singleRun: true
        browsers: [ 'Chrome' ]
        reporters: ['dots', 'coverage']

  grunt.loadNpmTasks 'grunt-gint'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-gint'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-reload'

  grunt.registerTask 'build'
  , ['clean', 'coffeeLint', 'coffee', 'less', 'template:dev', 'ngTemplateCache', 'copy:static', 'copy:dev', 'clean:temp']

  grunt.registerTask 'prod'
  , ['clean', 'coffeeLint', 'coffee', 'less', 'template:prod', 'ngTemplateCache', 'copy:static', 'copy:prod', 'requirejs', 'clean:temp']

  grunt.registerTask 'default'
  , ['build', 'karma:unit']

  grunt.registerTask 'travis'
  , ['build', 'karma:travis']

  grunt.registerTask 'coverage'
  , ['build', 'karma:coverage']

  grunt.registerTask 'run'
  , [ 'default', 'connect', 'reload', 'watch']

  grunt.registerTask 'runprod'
  , [ 'prod', 'connect', 'watch']