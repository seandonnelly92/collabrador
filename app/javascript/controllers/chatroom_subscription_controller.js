import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  connect() {
    console.log("hello from the chatroom subscription controller")
    createConsumer().subscriptions.create("ChatroomChannel")
  }
}
