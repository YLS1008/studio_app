// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Packages
import "bootstrap"
import "@fortawesome/fontawesome-free/css/all"
import "datatables.net"
import 'datatables.net-bs4'
import 'select2'
import 'select2-bootstrap-theme/dist/select2-bootstrap'


// Stylesheets
import "../stylesheets/application"
import "../stylesheets/general"
import "../stylesheets/toolbar"
import "../stylesheets/mobile"
import "../stylesheets/calendar"
import "../stylesheets/custom_accordion.scss"


// Custom and vendor JS files
import "../src/tableSearch"
import "../src/enroll"


// Static Assets
require("../images/logo-small")
require("../images/default_profile")


// Rails default imports
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


