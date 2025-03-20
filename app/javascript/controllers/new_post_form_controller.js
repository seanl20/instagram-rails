import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-post-form"
export default class extends Controller {
  static targets = ['photoFile'];

  connect() {
    this.photoFileTarget.addEventListener('input', () => {
      document.getElementById('post-form').submit();
    });
  }

  selectFile(e){
    e.preventDefault;
    this.photoFileTarget.click();
    console.log('Test00');
  }
}
