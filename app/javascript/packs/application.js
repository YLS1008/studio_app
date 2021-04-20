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
window.$ = window.JQuery = JQuery

import 'owl.carousel/dist/assets/owl.carousel.css'
import 'owl.carousel'
import "@fortawesome/fontawesome-free/css/all"

import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css'


$(document).on('turbolinks:load', function () {
    $(".js-activities").select2()
});
require("packs/responsive_nav")




Rails.start()
Turbolinks.start()
ActiveStorage.start()