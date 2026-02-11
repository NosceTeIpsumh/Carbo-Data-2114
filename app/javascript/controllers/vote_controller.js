import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count"]
  static values = {
    url: String
  }

  async vote(event) {
    const value = parseInt(event.currentTarget.dataset.value)

    const response = await fetch(this.urlValue, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ value: value })
    })

    const data = await response.json()
    this.countTarget.textContent = data.score
  }
}
