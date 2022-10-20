// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
window.Noty = require("noty")


// $(document).ready(() => {
//     $('.toogle').on('click', (e) =>{
//         e.stopPropagation();
//         e.preventDefault();
//         $('#'+ e.target.getAttribute('aria-controls')).toggleClass('is-hidden');
//     })
//  })
import "trix"
import "@rails/actiontext"
