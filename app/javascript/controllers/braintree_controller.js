import { Controller } from "@hotwired/stimulus";
import dropin from "braintree";

// Connects to data-controller="braintree"
export default class extends Controller {
  setNonce(nonce) {
    const el = document.createElement("input");
    el.setAttribute("type", "hidden");
    el.setAttribute("name", "nonce");
    el.setAttribute("value", nonce);
    this.element.appendChild(el);
  }

  connect() {
    const { token } = this.element.dataset;

    dropin
      .create({
        container: this.element,
        authorization: token,
      })
      .then((instance) => {
        const form = this.element.closest("form");

        form.addEventListener("submit", (e) => {
          e.preventDefault();

          instance.requestPaymentMethod().then(({ nonce }) => {
            if (nonce) {
              this.setNonce(nonce);

              form.submit();
            }
          });
        });
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
