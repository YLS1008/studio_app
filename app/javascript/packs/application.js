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

import 'owl.carousel2/dist/assets/owl.carousel.css';
import 'owl.carousel2'

import "@fortawesome/fontawesome-free/css/all"

import 'select2'
import 'select2/dist/css/select2.css'

require("packs/app")
require("packs/responsive_nav")
require('datatables.net-bs4')
require("packs/table_switch")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.$ = window.JQuery = JQuery
global.$ = jQuery;



$(document).on('turbolinks:load', function () {

    $(".js-activities").select2()
    $('#searchableB').DataTable()

    $(".owl-carousel").owlCarousel({
        navigation: true,
        paginationSpeed: 1000,
        goToFirstSpeed: 2000,
        autoheight: true,
        transitionStyle: "fade",
    })
});
