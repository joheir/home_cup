import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
  this.element.textContent = "Hello World!"
  }
}

const meals = document.querySelectorAll('.clickable');

const toggleActiveClass = (event) => {
  event.currentTarget.classList.toggle('active');
};

const toggleActiveOnClick = (meal) => {
  meal.addEventListener('click', toggleActiveClass);
};

meals.forEach(toggleActiveOnClick);
