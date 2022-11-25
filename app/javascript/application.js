// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require dropzone
//= require turbolinks 
//= require raty-js
//= require jquery-raty-js


import "@hotwired/turbo-rails"
import "controllers"
   
import "trix"
import "@rails/actiontext"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("raty-js").start()
require("raty")
window.Noty = require("noty")

window.$ = window.jQuery = require('jquery');
window.Dropzone = require("dropzone")
window.BulmaCarousel = require("bulma-extensions/bulma-carousel/dist/js/bulma-carousel")

 

 




import "./channels"
