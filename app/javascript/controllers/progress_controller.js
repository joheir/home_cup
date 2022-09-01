import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["value"]
  connect() {
    console.log("Hello!")
  }

}

let progressBars = document.querySelectorAll(".circular-progress");
let valueContainers = document.querySelectorAll(".value-container");
// let temp = document.querySelectorAll(".value");

let temps = document.querySelectorAll(".value");
let i = 0;
temps.forEach((temp) => {
  console.log(i)
  let progressValue = 0;
  let progressEndValue = temp.innerText;
  let speed = 100;

  let progress = setInterval(() => {
    progressValue++;
    valueContainers[i].textContent = `${progressValue}%`;
    progressBars[i].style.background = `conic-gradient(
      #27357E ${progressValue * 3.6}deg,
        #cadcff ${progressValue * 3.6}deg
    )`;

    if (progressValue == progressEndValue) {
      clearInterval(progress);
      i++;
      console.log(i)
    }
  }, speed);
})
