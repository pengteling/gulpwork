
$(function() {
function resize() {
    var w = $(window).width() < 750 ? $(window).width() : 750;
    var pr = w / 750;
    $("html").css("font-size", 625 * pr + "%");
}
resize();
$(window).load(function() {
    resize();
})
$(window).resize(function() {
    resize();
});

});

$(function() {
var swiper = new Swiper('#swiper0', {
    pagination: '#swiper-pagination_0',
    paginationClickable: true,
    spaceBetween: 30,
    autoplay: 2500,
    autoplayDisableOnInteraction: false
});
var swiper1 = new Swiper('#swiper1', {
    pagination: '#swiper-pagination_1',
    paginationClickable: true,
    spaceBetween: 30,
});
var swiper2 = new Swiper('#swiper2', {
    pagination: '#swiper-pagination_2',
    paginationClickable: true,
    spaceBetween: 30,
    autoHeight: true //enable auto height
});
var swiper3 = new Swiper('#swiper3', {
    pagination: '#swiper-pagination_3',
    paginationClickable: true,
    spaceBetween: 30,
});
var swiper4 = new Swiper('#swiper4', {
    pagination: '#swiper-pagination_4',
    paginationClickable: true,
    spaceBetween: 30,
    autoHeight: true //enable auto height
});
})