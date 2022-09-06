import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["value"]
  connect() {
    console.log("Hello!")
  }

}



function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

document.addEventListener("turbo:load", function() {
  let progressBars = document.querySelectorAll(".circular-progress");
  let valueContainers = document.querySelectorAll(".value-container");

  let temps = document.querySelectorAll(".value");

  sleep(100).then(() => {


    temps.forEach((temp, i) => {


      let progressValue = 0;
      let progressEndValue = parseInt(temp.innerText, 10);
      let speed = 5;

      //let i = temps.values().indexOf(temp);

      let progress = setInterval(() => {
        // console.log("the values are:", {i: i, progressValue: progressValue, progressEndValue: progressEndValue})

        valueContainers[i].textContent = `${progressValue}%`;
        progressBars[i].style.background = `conic-gradient(
          #FFA963 ${progressValue * 3.6}deg,
            #cadcff ${progressValue * 3.6}deg
        )`;

        if (progressValue == progressEndValue) {
          clearInterval(progress);
          // i++;
          // console.log("HELLO!", i)
        }
        progressValue++;
      }, speed);
    })
  })
});
