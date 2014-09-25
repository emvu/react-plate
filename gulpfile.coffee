gulp            = require 'gulp'
gutil           = require 'gulp-util'
livereload      = require 'gulp-livereload'
nodemon         = require 'gulp-nodemon'
plumber         = require 'gulp-plumber'
# gwebpack      = require 'gulp-webpack'
browserify      = require 'browserify'
watchify        = require 'watchify'
less            = require 'gulp-less'
autoprefixer    = require 'gulp-autoprefixer'
rimraf          = require 'rimraf'
source          = require 'vinyl-source-stream'
cjsxify         = require 'cjsxify'
root            = __dirname
src_path        = "#{root}/src"
# components_path = "#{root}/bower_components"
modules_path    = "#{root}/node_modules"
# semantic_path   = "#{components_path}/semantic/build/packaged"
dist_path       = "dist"
server_main     = "#{src_path}/app-server.coffee"

err = (x...) -> gutil.log(x...); gutil.beep(x...)

buildJS = (isWatching) -> 

  bundler = browserify
    cache: {}
    packageCache: {}
    fullPaths: true
    
    entries: ['./src/app-client.cjsx']
    extensions: ['.cjsx']
    debug: true
    
  bundler.transform 'cjsxify'

  rebundle = ->
    return bundler
      .bundle()
      .on('error', err)
      .pipe(source('app.js'))
      .pipe(gulp.dest('./dist/'))
  

  if isWatching
    bundler = watchify(bundler)
    bundler.on('update', rebundle)
  
  return rebundle()


gulp.task 'js', -> 
  buildJS(false)


gulp.task 'js-dev', -> 
  buildJS(true)


gulp.task 'clean', ->
  rimraf.sync(dist_path)


gulp.task 'copy', ->
  gulp.src("#{src_path}/*.html").pipe(gulp.dest(dist_path))
  gulp.src("#{src_path}/favicon.ico").pipe(gulp.dest(dist_path))
  gulp.src("#{modules_path}/bootstrap/fonts/*").pipe(gulp.dest("#{dist_path}/fonts"))
  # gulp.src("#{semantic_path}/images/**/*").pipe(gulp.dest("#{dist_path}/images"))


gulp.task 'css', ->
  gulp.src("#{src_path}/app-styles.less")
  .pipe(plumber())
  .pipe(less(
    paths: [modules_path]
  ))
  .on('error', err)
  .pipe(autoprefixer("last 2 versions", "ie 8", "ie 9"))
  .pipe(gulp.dest(dist_path))


gulp.task 'server', ->
  nodemon
    script: server_main
    watch: [server_main]
    env:
      PORT: process.env.PORT or 3000


gulp.task 'watch', ['copy'], ->
  livereload.listen()
  gulp.watch(["#{dist_path}/**/*"]).on('change', livereload.changed)
  gulp.watch ["#{src_path}/**/*.less"], ['css']
  gulp.watch ["#{src_path}/**/*.html"], ['copy']


gulp.task 'build', ['clean', 'copy', 'css', 'js']
gulp.task 'default', ['clean', 'copy', 'css', 'server', 'js-dev', 'watch']
