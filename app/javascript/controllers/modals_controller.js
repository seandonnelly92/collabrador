import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  static targets = [
    "signup"
  ]

  connect() {
    console.log("Hello from the modals controller");
  }

  openSignup(e) {
    this.signupTarget.classList.add('show')
  }
}