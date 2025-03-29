import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="apply-filter"
export default class extends Controller {
  static targets = ['image']

  connect() {
    console.log('PixelJS: ', pixelsJS)

    this.imageTargets.forEach((imageTarget) => {
      imageTarget.onload = () => {
        pixelsJS.filterImg(imageTarget, imageTarget.dataset.filter);
      }
    });
  }
}
