browserSync = require "browser-sync"
deploy = require "gulp-gh-pages"
gulp = require "gulp"
gutil = require "gulp-util"
runSequence = require "run-sequence"
sassdoc = require "sassdoc"
shell = require "gulp-shell"
theme = require "sassdoc-theme-neat"
read = require "file-reader"
bump = require "gulp-bump"

version = read.file("./neat/_neat.scss").match(/[0-9]*\.[0-9]*\.[0-9]*/g).toString()
dasherizedVersion = version.replace(/\./g, "-")

gulp.task "default", ["browser-sync", "watch"]

gulp.task "build", ->
  runSequence "copy", "bump"

gulp.task "watch", ->
  gulp.watch "neat/**/*.scss", ["sassdoc"]
  gulp.watch "docs/**/*.html", -> browserSync.reload()

gulp.task "update", ->
  runSequence "update-neat", "sassdoc"

gulp.task "update-neat", shell.task("bundle update neat && bundle exec neat update")

gulp.task "bump", ->
  gulp.src "./package.json"
    .pipe bump version: version
    .pipe gulp.dest("./")

gulp.task "sassdoc", ->
  gulp.src "./neat/**/*.scss"
    .pipe sassdoc()

gulp.task "browser-sync", ->
  browserSync
    server:
      baseDir: "docs"
    host: "localhost"
    open: false

gulp.task "copy", ->
  gulp.src "./docs/latest/**/*"
    .pipe gulp.dest "./docs/#{dasherizedVersion}/"

gulp.task "deploy", ["build"], ->
  gulp.src "./docs/**/*"
    .pipe deploy()
