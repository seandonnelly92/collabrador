import { Controller } from "@hotwired/stimulus"
import * as boostrap from 'bootstrap';

// Connects to data-controller="tooltip"
export default class extends Controller {
  connect() {
    console.log("Hello from the tooltip controller!");
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]'); // Selects all tooltips on a page by default
    const tooltipList = [...tooltipTriggerList].map(
      tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl)
    );
  }

}
