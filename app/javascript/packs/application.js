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


// Stylesheets
import "../stylesheets/application"
import "../stylesheets/general"
import "../stylesheets/toolbar"


// Custom and vendor JS files



// Static Assets
require("../images/logo-small")


Rails.start()
Turbolinks.start()
ActiveStorage.start()


