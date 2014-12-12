gulp       = require("gulp")
gutil      = require("gulp-util")
concat     = require("gulp-concat")
sass       = require("gulp-ruby-sass")
minifyCss  = require("gulp-minify-css")
rename     = require("gulp-rename")
coffee     = require("gulp-coffee")
sourcemaps = require("gulp-sourcemaps")
jade       = require("gulp-jade")
notify     = require("gulp-notify")
addsrc     = require('gulp-add-src')
sh         = require("shelljs")
bower      = require("bower")

paths =
  sass:
    source: ["sass/**/*.sass"]
    dest: './www/css'

gulp.task "default", ["sass"]

gulp.task "sass", (done) ->
  gulp.src(paths.sass.source)
      .pipe(sass())
      .on("error", notify.onError("Error: <%= error.message %>"))
      .pipe(gulp.dest(paths.sass.dest))
      .pipe(minifyCss(keepSpecialComments: 0))
      .pipe(rename(extname: ".min.css"))
      .pipe(gulp.dest(paths.sass.dest))
      .pipe(notify(message: ".css files updated"))

gulp.task "watch", ->
  gulp.watch(paths.sass, ["sass"])

gulp.task "install", ["git-check"], ->
  bower.commands.install()
    .on "log", (data) ->
      gutil.log("bower", gutil.colors.cyan(data.id), data.message)

gulp.task "git-check", (done) ->
  unless sh.which("git")
    console.log("  " + gutil.colors.red("Git is not installed."), "\n  Git, the version control system, is required to download Ionic.", "\n  Download git here:", gutil.colors.cyan("http://git-scm.com/downloads") + ".", "\n  Once git is installed, run '" + gutil.colors.cyan("gulp install") + "' again.")
    process.exit(1)

  done()
