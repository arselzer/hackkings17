var PORT = 80;

var fs = require("fs");
var crypto = require("crypto");
var express = require("express");

var app = express();

var multer  = require('multer');
var storage = multer.memoryStorage();
var upload = multer({ storage: storage });

var exec = require('child_process').exec;
var execFile = require('child_process').execFile;

//app.get("/", express.static("public"));
app.use(express.static("public"));

/*
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
	});
});
*/

app.post("/upload", upload.any(), function(req, res) {
	var hash = crypto.createHash('sha256');
	//console.log(req);
	var userId = parseInt(req.files[0].fieldname);

	fs.mkdir( __dirname + "/data/input/" + userId, function(err) {
  	var newPath = __dirname + "/data/input/" + userId + "/" + req.files[0].originalname;
  	fs.writeFile(newPath, req.files[0].buffer, function (err) {
    	console.log("Finished writing file..." + err);
    	res.send("ok");
  	});
	});
});

app.get("/result/:id", function(req, res) {
	fs.readdir("data/input/" + req.params.id, function(err, files) {
		if (err) {
			res.send("error");
		}

		console.log("processing files for user " + req.params.id + ": " + files);

		var files2 = files.map(function(file) {
			return "string('" + __dirname + "/data/input/" + req.params.id + "/" + file + "')";
		}).join("; ");
		var output = __dirname + "/data/output/" + req.params.id + ".jpg";
		var matlab_in = "\"withoutmovement([" + files2 + "], '" + output + "', " + files.length + ")\"";

		//exec('/home/as/Matlab/bin/matlab /r "' + matlab_in + '"', {
		//execFile("/home/as/Matlab/bin/matlab",  ["/r", matlab_in],
		execFile("/home/as/Matlab/bin/matlab",  ["-nosplash", "-nodesktop", "-r", matlab_in],
		function callback(error, stdout, stderr) {
			console.log(stdout);
			console.log(stderr);

			if (error) {
				console.log("Error exec: " + error);
				//process.exit(1);
			}

			res.sendFile(output, {
				root: __dirname + '/public/'
			}, function(err) {
					if (err) {
						console.log("Error send: " + err);
						//process.exit(1);
					}
			})
		});

		res.send("ok");
	})
});

app.listen(PORT, function() {
	console.log("Listening on port " + PORT);
});
