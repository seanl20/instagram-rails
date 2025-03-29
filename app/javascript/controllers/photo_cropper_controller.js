import { Controller } from "@hotwired/stimulus"
import Cropper from 'cropperjs';

// Connects to data-controller="photo-cropper"
export default class extends Controller {
  static targets = [ 'image', 'form', 'xOffset', 'yOffset', 'width', 'height' ]

  connect() {
    const controller = this;
    const cropper = new Cropper(this.imageTarget);

    cropper.container.querySelectorAll('cropper-selection')[0].addEventListener('change', function (event) {
      controller.xOffsetTarget.value = event.detail.x;
      controller.yOffsetTarget.value = event.detail.y;
      controller.widthTarget.value = event.detail.width;
      controller.heightTarget.value = event.detail.height;
    });
  }
}
