function renderItemInput() {
  var previousItem = document.querySelectorAll(".item-input")[0];

  document.querySelectorAll(".item-input").forEach((item) =>{
    item.classList.remove("d-none")
    if (previousItem !== item) {
      if (previousItem.querySelector("input").value == ""){
        item.classList.add("d-none")
      }
    }
    previousItem = item;
  })
}

renderItemInput()
document.querySelectorAll(".item-input").forEach((item) => {
  item.querySelector("input").addEventListener("keyup", renderItemInput)
})
