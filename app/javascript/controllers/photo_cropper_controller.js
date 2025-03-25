import { Controller } from "@hotwired/stimulus"
import Cropper from 'cropperjs';

// Connects to data-controller="photo-cropper"
export default class extends Controller {
  connect() {
    console.log('Test from photo-cropper');
    console.log('Cropper: ', Cropper);

    const image = this.element;

    const cropper = new Cropper(image);
    console.log('Cropper: ', cropper);
  }
}
