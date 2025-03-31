import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="apply-filter"
export default class extends Controller {
  static targets = ['image', 'hiddenImage', 'form', 'filterButton']

  connect() {
    console.log('PixelJS: ', pixelsJS)
  }

  applyFilter(e) {
    console.log(e.target.dataset.filterName);
    pixelsJS.filterImg(this.imageTarget, e.target.dataset.filterName);
  }
}
