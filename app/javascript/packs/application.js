// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require recurring_select
//= require jquery-mobile-rs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "channels"
import "jquery"
import "bootstrap"
import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;

import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel';
import 'blueimp-gallery';


require("packs/responsive_nav")




Rails.start()
Turbolinks.start()
ActiveStorage.start()