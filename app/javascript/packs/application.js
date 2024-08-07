// app/javascript/packs/application.js
//= require rails-ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'core-js/stable'
import 'regenerator-runtime/runtime'
import 'stylesheets/application'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

console.log('Hello from Webpacker');
