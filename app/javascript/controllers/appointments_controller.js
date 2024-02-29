import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="appointments"
export default class extends Controller {
  static values = {
    appointmentid: Number,
    helperid: Number,
    pet: String
  }

  static targets = [
    "header"
  ]

  connect() {
    console.log("Hello from appointments controller!");

    // Retrieves the requires CRSF token from the HTML header
    this.csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
  }

  addPendingHelper(e) {
    const data = { appointment: { pending_helper: this.helperidValue } };
    const button = e.currentTarget;
    console.log(button);

    fetch(`/appointments/${this.appointmentidValue}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": this.csrfToken // Include CSRF token
      },
      body: JSON.stringify(data)
    }).then(response => {
      if (response.ok) {
        return response.json();
      } else {
        console.error("Update failed");
        throw new Error('Network response was not ok.');
      }
    })
    .then(data => {
      console.log("Update successful with data:", data);
      this.headerTarget.classList.remove('available');
      this.headerTarget.classList.add('pending');
      this.headerTarget.innerHTML = `<h3>${this.petValue} - Pending</h3>`;

      button.classList.add('d-none');
      // button.disabled = true;
      // button.textContent = 'Pending...';
    })
    .catch(error => {
      console.error("Error:", error);
    });
  }
}
