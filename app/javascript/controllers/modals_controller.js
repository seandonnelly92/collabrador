import { Controller } from "@hotwired/stimulus"
// import { useClickOutside } from "stimulus-use"

// Connects to data-controller="modals"
export default class extends Controller {
  static targets = [
    "signup",
    "signin",
    "newPet",
    "appointment",
    "closeBtn"
  ]

  connect() {
    console.log("Hello from the modals controller");
    // useClickOutside(this, { element: this.signupTarget });
  }

  // Methods for signup
  openSignup() {
    this.signupTarget.classList.add('show');
  }

  closeSignup(e) {
    this.signupTarget.classList.remove('show');
  }

  rootRedirectSignup(e) {
    this.signupTarget.classList.remove('show');
    alert('Access denied. Login or sign-up to view this page.');

    window.location.href = "/"; // Will redirect to the root given that access is denied.
  }

  // Methods for login
  openSignin(e) {
    this.signinTarget.classList.add('show');
  }

  closeSignin(e) {
    this.signinTarget.classList.remove('show');
  }

  rootRedirectSignin(e) {
    this.signinTarget.classList.remove('show');
    alert('Access denied. Login or sign-up to view this page.');

    window.location.href = "/"; // Will redirect to the root given that access is denied.
  }

  // Methods for new pet modal
  openNewPet(e) {
    this.newPetTarget.classList.add('show');
  }

  closeNewPet(e) {
    this.newPetTarget.classList.remove('show');
  }

  // Methods for appointments modal
  openAppointment() {
    this.appointmentTarget.classList.add('show');
  }

  closeAppointment() {
    this.appointmentTarget.classList.remove('show');
  }
}
