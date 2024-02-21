var express = require('express'),
	path = require('path'),
	app = express()

// Express middleware for serving static files
//

app.use(express.static(path.join(__dirname, '/public')));
app.get('/', function(req, res) {
	res.redirect('jor1k-ground-zero-riscv/demos/wasm.html')
});
app.listen(8080)
