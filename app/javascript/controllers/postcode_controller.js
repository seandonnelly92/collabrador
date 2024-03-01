import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  static targets = ["map"];

  connect() {
    console.log("Hello from our the Postcode Stimulus controller");
  }
  submitForm(event) {
    console.log("I have clicked the button")
    event.preventDefault();
    const postcode = this.inputTarget.value;
    this.dispatch("postcodeSubmitted", { postcode });
    console.log("postcode")
}

}


  // You can perform further actions with the post code here, such as updating the map
