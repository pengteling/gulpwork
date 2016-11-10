var gulp = require('gulp');


/*自动地从package.json中加载任意Gulp插件*/
// var gulpLoadPlugins = require('gulp-load-plugins'),
//     plugins = gulpLoadPlugins();


var compass = require('gulp-for-compass');

gulp.task('compass', function() {
    gulp.src('sass/*.scss')
        .pipe(compass({
            config: 'config.rb'
        }));
});


var watch = require('gulp-watch');
gulp.task('watch', function() {
    gulp.watch('./sass/*.scss', ['compass']);
})


var uglify = require('gulp-uglify');

gulp.task('compress', function() {
    return gulp.src('js/custom/comm.js')
        .pipe(uglify())
        .pipe(gulp.dest('js/'));
});