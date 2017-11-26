
var userId = sessionStorage.getItem("user-id");
if (!userid) {
  userId = Math.floor(Math.random() * 100000000);
  sessionStorage.setItem("user-id", userId);
}

var file_count = 0;

Dropzone.options.imageUpload = {

  // Prevents Dropzone from uploading dropped files immediately
  autoProcessQueue: false,

  init: function() {
    var submitButton = document.querySelector("#submit-all")
        myDropzone = this; // closure

    submitButton.addEventListener("click", function() {
      myDropzone.processQueue(); // Tell Dropzone to process all queued files.
    });

    // You might want to show the submit button only when
    // files are dropped here:
    this.on("addedfile", function() {
      // Show submit button here and/or inform user to click it.
    });

    this.on("success", function(file, responseText) {
      console.log("success");
      // Handle the responseText here. For example, add the text to the preview element:
      //file.previewTemplate.appendChild(document.createTextNode(responseText));
    });

  }
};
