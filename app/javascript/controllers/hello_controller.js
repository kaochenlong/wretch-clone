import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  go(e) {
    const { cc } = e.detail;
    this.element.textContent = cc;
  }
}
