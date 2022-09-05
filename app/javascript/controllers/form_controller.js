import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello!")
  }

}




// const displayNew = () => {
//   const field = document.querySelector(`.active`);
//   if (field.nextElementSibling) {
//     field.nextElementSibling.classList.remove('.d-none');
//     field.nextElementSibling.classList.add('.active');
//     field.classList.remove('active');
//   }
// };

// const displayField = (event) => {
//   if (event) {
//     displayNew;
//   }
// };

// document.addEventListener("keyup", displayField);
