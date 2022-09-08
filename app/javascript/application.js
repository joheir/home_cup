// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "./lib/item_input"
//= require turbolinks
import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-delete', {
  title: "Are you sure?",
  text: "This action cannot be reversed",
  icon: "warning"
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});
