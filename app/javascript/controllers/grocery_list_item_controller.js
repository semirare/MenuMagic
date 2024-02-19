import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container"];

connect() {
  this.element.addEventListener("click", () => this.toggleItem());
}


  toggleItem() {
    this.containerTarget.classList.toggle("bg-green-200");
    this.containerTarget.querySelectorAll("p").forEach((paragraph) => {
      paragraph.classList.toggle("line-through");
    });
  }
}