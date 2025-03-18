import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-post-form"
export default class extends Controller {
  static targets = ['photoFile', 'selectFileButton'];


  connect() {
    this.photoFileTarget.addEventListener('change', () => {
      document.querySelector('form').submit();
    });
  }

  selectFile(e){
    e.preventDefault;
    this.photoFileTarget.click();
  }
}
