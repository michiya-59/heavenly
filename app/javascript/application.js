// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
import jQuery from "jquery"
window.$ = window.jQuery = jQuery
import Rails from '@rails/ujs';
Rails.start();
import "@fortawesome/fontawesome-free"