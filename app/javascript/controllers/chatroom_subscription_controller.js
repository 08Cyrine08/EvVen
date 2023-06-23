import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]


  connect() {
    console.log("connected")
    createConsumer().subscriptions.create("Chatroom Channel")

  }
}
