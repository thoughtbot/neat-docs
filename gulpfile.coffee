gulp = require "gulp"
browserSync = require "browser-sync"
sass = require "gulp-ruby-sass"
coffee = require "gulp-coffee"
prefix = require "gulp-autoprefixer"
shell = require "gulp-shell"
gutil = require "gulp-util"

neatDocs = require "./package.json"
version = neatDocs.version.replace(/\./g, "-")

gulp.task "default", ["browser-sync", "watch"]

gulp.task "watch", ->
  gulp.watch "theme/source/sass/*.scss", ["sass"]
  gulp.watch "neat/**/*.scss", ["sassdoc"]
  gulp.watch "theme/source/coffeescript/*.coffee", ["coffee"]
  gulp.watch "theme/views/**/*.swig", ["sassdoc"]
  gulp.watch "docs/**/*.html", -> browserSync.reload()

gulp.task "sass", ->
  gulp.src("theme/source/sass/*.scss")
    .pipe sass(bundleExec: true)
    .on 'error', (error) -> gutil.log(error.message)
    .pipe prefix(["last 15 versions", "> 1%", "ie 9"], cascade: true)
    .pipe gulp.dest("theme/assets/css")
    .pipe gulp.dest("docs/#{version}/assets/css")
    .pipe browserSync.reload(stream: true)

gulp.task "coffee", ->
  gulp.src("theme/source/coffeescript/*.coffee")
    .pipe coffee bare: true
    .on 'error', (error) -> gutil.log(error.message)
    .pipe gulp.dest("theme/assets/js")
    .pipe gulp.dest("docs/#{version}/assets/js")
    .pipe browserSync.reload(stream: true)

gulp.task "sassdoc", shell.task("sassdoc ./neat ./docs/#{version}/ -t 'theme'")

gulp.task "browser-sync", ["sass", "coffee"], ->
  browserSync.init null,
    server:
      baseDir: "docs"
    host: "localhost"
    open: false

gulp.task "generate", ["sass", "coffee", "sassdoc"], ->
  gulp.src "./docs/#{version}/*"
    .pipe gulp.dest "./docs/latest/"

