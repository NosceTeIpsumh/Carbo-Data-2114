import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "button"]
  static values = { limit: Number }

  connect() {
    this.showLimit()
  }

  showLimit() {
    this.itemTargets.forEach((item, index) => {
      item.classList.toggle("d-none", index >= this.limitValue)
    })
  }

  toggle() {
    const hidden = this.itemTargets.some(item => item.classList.contains("d-none"))
    if (hidden) {
      this.itemTargets.forEach(item => item.classList.remove("d-none"))
      this.buttonTarget.textContent = "Show less"
    } else {
      this.showLimit()
      this.buttonTarget.textContent = `Show ${this.itemTargets.length - this.limitValue} more comments`
    }
  }
}
