import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {chatroomId: Number}
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => { this.#insertMessage(data) } }
    )
  }

  // When you leave the page, disconnect method will trigger
  disconnect() {
    console.log("Disconnecting from the chatroom (unsubscribing)...")
    this.channel.unsubscribe()
  }


  resetForm(event) {
    const form = event.target
    form.reset()
  }

  // The # makes the method private it's a relatively new Ruby feature
  // private
  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)

    // Scroll to the bottom of the messages list. The first argument (0 in this case)
    // represents horizontal scroll. It stays where it is, hence zero.
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
