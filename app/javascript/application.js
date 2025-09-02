// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Rails from "@rails/ujs"
Rails.start()

import "@hotwired/turbo-rails"
import "controllers"

// Import jQuery and expose globally
import jquery from "jquery"
window.$ = jquery
window.jQuery = jquery
import "jquery-ui"


// Import HTML sortable
import html5sortable from "../assets/javascripts/html5sortable.js";
import "../assets/javascripts/portfolio.js";
import "cocoon"
import "./cocoon_fix"



