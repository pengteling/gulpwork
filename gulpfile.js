//imagemin-pngquant 最新版本会报错 安装时后加@4   npm i imagemin-pngquant@4
//

//CSS   npm i gulp-sass gulp-autoprefixer gulp-clean-css 
//js  gulp-uglify
// postcss postcss-cssnext cssgrace   autoprefixer
//gulp-babel gulp-plumber babel-preset-es2015

var gulp = require('gulp');
// npm i browser-sync
/*实时监测 浏览器实时变化*/
var browserSync = require('browser-sync');
gulp.task('browser-sync', function() {
    var files = [
        'dist/*.html',
        'dist/css/**/*.css',
        'dist/js/**/*.js'
    ];
    browserSync.init(files, {
        server: {
            baseDir: './dist'
        }
    });
});




//var autoprefixer = require('gulp-autoprefixer');
var sass = require('gulp-sass');
var cleanCSS = require('gulp-clean-css');

//var autoprefixer = require('autoprefixer');
var cssgrace  = require('cssgrace');
var cssnext  = require('cssnext');
var postcss = require("gulp-postcss");
var autoprefixer = require('autoprefixer');
gulp.task('css', function() {

    var processors = [
        autoprefixer({
            browsers: ['last 3 version'],
            cascade: false,
            remove: false,
            flexbox:false
        }),
        cssnext()
        // ,
        // cssgrace
    ];

    gulp.src('./src/sass/*.scss') //sass文件直接处理
        .pipe(sass())
        // .pipe(autoprefixer({
        //     browsers: ['> 1%', 'last 3 versions'],
        //     flexbox: 'false',
        //     cascade: false
        // }))
        .pipe(postcss(processors))
        .pipe(cleanCSS())
        .pipe(gulp.dest('./dist/css'))
        //.pipe(browserSync.stream());
        .pipe(browserSync.reload({
            stream: true
        }));

    gulp.src('./src/css/*.css')  //复制CSS文件直接到dist
    .pipe(postcss(processors))
        //.pipe(gulp.dest('./dist/css'))
        .pipe(browserSync.reload({
            stream: true
        }));
});

gulp.watch("src/sass/**/*.scss", ['css']);
gulp.watch("src/**/*.html", ['html']);
gulp.watch("src/js/*.js", ['js']);
gulp.watch("src/images/*.{png,jpg,gif,ico}", ['image']);
gulp.task('default', ['css', 'html', 'js', 'image', 'browser-sync']);
//gulp.task('default',['js','image','html','watchhtml','copyjs','watchcss','watchjs','browser-sync']);



gulp.task('html', function() {
    return gulp.src('src/*.html')
        .pipe(gulp.dest('dist'))
        .pipe(browserSync.reload({
            stream: true
        }));
});


var uglify = require('gulp-uglify');
const babel = require('gulp-babel');
const plumber = require('gulp-plumber'); //防止gulp退出进程

gulp.task('js', function() {
    return gulp.src('src/js/comm.js')
        //.pipe(uglify())
        .pipe(plumber())
        .pipe(babel({
            presets: ['es2015']
        }))
        .pipe(gulp.dest('dist/js'))
        .pipe(browserSync.reload({
            stream: true
        }));
});

// var imagemin = require('gulp-imagemin'),
//     //确保本地已安装imagemin-pngquant [npm install gulp-imagemin imagemin-pngquant --save-dev]
//     pngquant = require('imagemin-pngquant');

// gulp.task('image', function() {
//     gulp.src('src/images/**/*.{png,jpg,gif,ico,svg}')
//         .pipe(imagemin({
//             progressive: true,
//             svgoPlugins: [{
//                 removeViewBox: false
//             }], //不要移除svg的viewbox属性
//             use: [pngquant()] //使用pngquant深度压缩png图片的imagemin插件
//         }))
//         .pipe(gulp.dest('dist/images'));
// });

var imagemin = require('gulp-imagemin');
gulp.task('image', () => gulp.src('./src/images/**/*')
    //.pipe(imagemin())  //报错 暂时屏蔽
    .pipe(gulp.dest('dist/images'))
);







// gulp.task('es6to5', () => {
//     return gulp.src('src/**/*.js')
//         .pipe(plumber())
//         .pipe(babel({
//             presets: ['es2015']
//         }))
//         .pipe(gulp.dest('dist'));
// });
