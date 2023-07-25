import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["likebtn"];

  connect() {
    const { id } = this.element.dataset;
    this.id = id;
  }

  toggle(e) {
    e.preventDefault();

    // API
    const url = `/api/v1/articles/${this.id}/like`;
    const token = document.querySelector("meta[name=csrf-token]").content;
    fetch(url, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((resp) => {
        return resp.json();
      })
      .then(({ liked }) => {
        if (liked) {
          this.likebtnTarget.textContent = "已讚";
        } else {
          this.likebtnTarget.textContent = "未讚";
        }
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
