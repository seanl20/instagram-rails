import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="apply-filter"
export default class extends Controller {
  static targets = ['image', 'hiddenImage', 'form', 'filterButton', 'filterName']

  connect() {
  }

  applyFilter(e) {
    const clonedPhoto = this.hiddenImageTarget.cloneNode(true);
    clonedPhoto.classList.remove('d-none');
    clonedPhoto.dataset.applyFilterTarget = 'image';
    if (document.querySelector('canvas') !== null) {
      document.querySelector('canvas').replaceWith(clonedPhoto);
    }
    pixelsJS.filterImg(this.imageTarget, e.target.dataset.filterName);
    this.filterNameTarget.value = e.target.dataset.filterName
    console.log(e.target.dataset.filterName);
  }
}
