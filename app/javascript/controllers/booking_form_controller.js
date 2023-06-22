import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form"
export default class extends Controller {
  static targets = ["openform", "closeform", "form"];

  connect() {
    console.log("connected")
  }


  openForm(){
    this.formTarget.classList.remove("d-none");
  }

  closeForm(){
    this.formTarget.classList.add("d-none");
  }

}
