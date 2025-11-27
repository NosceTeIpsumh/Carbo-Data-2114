import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Auto-dismiss after 4 seconds
    this.timeout = setTimeout(() => {
      this.dismiss()
    }, 4000)
  }

  disconnect() {
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
  }

  close() {
    this.dismiss()
  }

  dismiss() {
    this.element.classList.add('flash-hiding')
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }
}
