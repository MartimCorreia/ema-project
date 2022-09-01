import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="body"
export default class extends Controller {

  connect() {
    console.log("hello from body")

      const pieces = document.getElementsByTagName('svg');
      const body = document.querySelector('.body-link')
      for (var i = 0; pieces.length; i++) {
          let _piece = pieces[i];
          _piece.onclick = function(t) {
              console.log("cliked")
              let link = body.href;
              body.href = "";
              body.href = link + t.target.parentElement.getAttribute('data-position');
              body.click();
            }
      }

  }
}
