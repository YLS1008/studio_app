$(document).ready(function () {
    $('.owl-carousel').owlCarousel({
        stagePadding: 50,
        loop: true,
        margin: 10,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            }
        }
    })
});