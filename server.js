var PORT = 80;

var fs = require("fs");
var express = require("express");

var app = express();

//app.get("/", express.static("public"));
app.use(express.static("public"));

app.get("/result/:id", function(req, res) {
	var id = req.params.id;

	fs.stat("data/output/" + id + ".jpg", function(err, stats) {
		if (err) {
			console.log("Error: stat");
			process.exit();
		}


		res.sendFile("data/output/" + id + ".jpg", {
			root: __dirname
		},  function(err) {
			if (err) {
				console.log("Error: stat");
				process.exit();
			}
		});
	})
});

app.post("/upload", function(req, res) {
	
});

app.listen(PORT, function() {
	console.log("Listening on port " + PORT);
});