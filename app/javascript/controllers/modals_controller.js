import { Controller } from "@hotwired/stimulus"
// import { useClickOutside } from "stimulus-use"

// Connects to data-controller="modals"
export default class extends Controller {
  static targets = [
    "signup",
    "signin",
    "newPet",
    "closeBtn"
  ]

  connect() {
    console.log("Hello from the modals controller");
    // useClickOutside(this, { element: this.signupTarget });
  }

  openSignup() {
    this.signupTarget.classList.add('show');
  }

  closeSignup(e) {
    this.signupTarget.classList.remove('show');
  }

  // Methods for login
  openSignin(e) {
    this.signinTarget.classList.add('show');
  }

  closeSignin(e) {
    this.signinTarget.classList.remove('show');
  }

  // Methods for new pet modal
  openNewPet(e) {
    console.log(e.currentTarget);
    this.newPetTarget.classList.add('show');
  }

  closeNewPet(e) {
    this.newPetTarget.classList.remove('show');
  }

  // clickOutside(e) {
  //   e.preventDefault();
  //   // this.signupTarget.classList.remove('show');
  //   // this.signupTarget.close()
  // }
}
