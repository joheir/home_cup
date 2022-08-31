// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   connect() {
//     this.element.textContent = "Hello World!"
//   }
// }

// let progressBar = document.querySelector(".circular-progress");
// let valueContainer = document.querySelector(".value-container");

// let progressValue = 0;
// let progressEndValue = 33;
// let speed = 50;

// let progress = setInterval(() => {
//   progressValue++;
//   valueContainer.textContent = `${progressValue}%`;
//   progressBar.style.background = `conic-gradient(
//       #4d5bf9 ${progressValue * 3.6}deg,
//       #cadcff ${progressValue * 3.6}deg
//   )`;
//   if (progressValue == progressEndValue) {
//     clearInterval(progress);
//   }
// }, speed);
