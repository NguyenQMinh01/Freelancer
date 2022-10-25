// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
   
import "trix"
import "@rails/actiontext"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
window.Noty = require("noty")

window.Dropzone = require("dropzone")
window.BulmaCarousel = require("bulma-extensions/bulma-carousel/dist/js/bulma-carousel")

 
$(document).on('turbolinks:load',() => {
    $('.toogle').on('click', (e) =>{
        e.stopPropagation();
        e.preventDefault();
        $('#'+ e.target.getAttribute('aria-controls')).toggleClass('is-hidden');
    }) 
 })


 $('#editlanguage').on('click',function() {
    console.log(123)
    var div = document.getElementsById("languages")
    div.removeClass("is-hidden").addClass("is-visible")

 })

 




