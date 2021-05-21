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
import select2 from 'select2';
import 'select2/dist/css/select2.css';

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
                tableC = $('#tableC'),
                buttonA = $('#switchA'),
                buttonB = $('#switchB'),
                buttonC = $('#switchC');

            buttonA.click(function () {
                tableA.show();
                tableB.hide();
                tableC.hide();
            });

            buttonB.click(function () {
                tableA.hide();
                tableB.show();
                tableC.hide();
            });

            buttonC.click(function () {
                tableA.hide();
                tableB.hide();
                tableC.show();
            });
        });

    })(jQuery);
});

$('.collapse').on('show.bs.collapse', function () {
    $('.collapse.in').collapse('hide');
});

$(document).ready(function () {
    $('select2-style').select2({

        allowClear: true,
        multiple: true
    });
});






