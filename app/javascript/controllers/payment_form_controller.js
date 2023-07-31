import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="payment-form"
export default class extends Controller {
  connect() {}

  submit(e) {
    e.preventDefault();
    console.log(123);
  }
}
