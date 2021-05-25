// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Packages
import "bootstrap"
import "@fortawesome/fontawesome-free/css/all"
import "datatables.net"
import 'datatables.net-bs4'


// Stylesheets
import "../stylesheets/application"
import "../stylesheets/general"
import "../stylesheets/toolbar"
import "../stylesheets/mobile"
import "../stylesheets/calendar"


// Custom and vendor JS files
require("../src/tableSearch")


// Static Assets
require("../images/logo-small")


Rails.start()
Turbolinks.start()
ActiveStorage.start()


