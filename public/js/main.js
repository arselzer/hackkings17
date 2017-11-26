
var userId = sessionStorage.getItem("user-id");
if (!userId) {
  userId = Math.floor(Math.random() * 100000000);
  sessionStorage.setItem("user-id", userId);
}

var file_count = 0;

console.log("User id: " + userId);

var resetButton = document.querySelector("#reset-btn");

resetButton.addEventListener("click", function() {
  userId = Math.floor(Math.random() * 100000000);
  sessionStorage.setItem("user-id", userId);
});

Dropzone.options.imageUpload = {

  // Prevents Dropzone from uploading dropped files immediately
  autoProcessQueue: false,
  paramName: userId,

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

      window.location.replace("/result/" + userId);
    });
  }
};
