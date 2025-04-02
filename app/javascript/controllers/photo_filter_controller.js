import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-filter"
export default class extends Controller {
  connect() {
    console.log(this.element.dataset);
    this.element.onload = () => {
      pixelsJS.filterImg(this.element, this.element.dataset.filter);
    }
  }
}
