import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-help"
export default class extends Controller {
  connect() {
    console.log("Controller connected");
  }

  offerHelp() {
    console.log("Button clicked!");
    const listingContainer = this.element.closest('.appointment-border');

    // Change the background color of the listing container
    listingContainer.style.backgroundColor = 'green';
    const listingButton = this.element.closest('.offer-help-button')
    listingButton.innerText = 'Offered!';
  }

}
