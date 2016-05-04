'use strict'

module.exports = (grunt) ->
  localConfig = undefined
  try
    localConfig = require('./local.env.js')
  catch e
    localConfig = {}
  
  grunt.loadNpmTasks 'grunt-env'
  grunt.loadNpmTasks 'grunt-shell'
  
  grunt.initConfig
    env:
      all:
        localConfig
    shell:
      default:
        command: './bin/hubot'
  
  grunt.registerTask 'default', [
    'env:all'
    'shell:default'
  ]