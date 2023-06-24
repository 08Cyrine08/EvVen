import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form"
export default class extends Controller {
  static targets = ["openform", "closeform", "form", "closereview", "openreview", "review", "carousel"];

  connect() {
    console.log("connected")
  }


  openForm(){
    this.formTarget.classList.remove("d-none");
    this.carouselTarget.classList.add("d-none");
  }

  closeForm(){
    this.formTarget.classList.add("d-none");
    this.carouselTarget.classList.remove("d-none");
  }

  openReview(){
    this.reviewTarget.classList.remove("d-none");
    this.carouselTarget.classList.add("d-none");

  }

  closeReview(){
    this.reviewTarget.classList.add("d-none");
    this.carouselTarget.classList.remove("d-none");
  }

}
