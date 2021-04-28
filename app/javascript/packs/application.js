// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require recurring_select
//= require jquery-mobile-rs
//= require bootstrap-modal

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "channels"
import "jquery"
import "bootstrap"
import JQuery from 'jquery'

import "@fortawesome/fontawesome-free/css/all"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.$ = window.JQuery = JQuery
global.$ = jQuery;

require("owl.carousel2")
require("owl.carousel2/dist/assets/owl.carousel.css")
require("datatables.net")
require('datatables.net-bs4')
require("datatables.net-bs4/css/dataTables.bootstrap4.min.css")
require("packs/datatable_init")
require("packs/responsive_nav")
require("packs/table_switch")
require("packs/image_carousel")

const dataTables = [];

document.addEventListener("turbolinks:load", () => {
    if (dataTables.length === 0 && $('#searchableB').length !== 0) {
        $('#searchableB').each((_, element) => {
            dataTables.push($(element).DataTable({
                pageLength: 10
            }));
        });
    }
});
$(document).ready(function () {
    $(".owl-carousel").owlCarousel({
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
    });
});


document.addEventListener("turbolinks:before-cache", () => {
    while (dataTables.length !== 0) {
        dataTables.pop().destroy();
    }
});

document.addEventListener("turbolinks:load", () => {
    (function ($) {

        $(function () {
            var tableA = $('#tableA'),
                tableB = $('#tableB'),
                buttonA = $('#switchA'),
                buttonB = $('#switchB');

            buttonA.click(function () {
                tableA.show();
                tableB.hide();
            });

            buttonB.click(function () {
                tableA.hide();
                tableB.show();
            });
        });

    })(jQuery);
});



