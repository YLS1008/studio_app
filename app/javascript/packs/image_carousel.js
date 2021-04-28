$(document).on("turbolinks:before-cache", function () {
    $('.owl-carousel').owlCarousel({
        margin: 200,
        nav: false,
        pullDrag: true,
        center: false,
        loop: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 3
            }
        }
    })
});
