import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-help"
export default class extends Controller {
  connect() {
    console.log("Controller connected");
  }

  offerHelp() {
    console.log("Button clicked!");
  }

}
