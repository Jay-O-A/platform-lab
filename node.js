const http = require('http');

http.createServer((req, res) => {
  res.end("Hello from Platform Lab!");
}).listen(3004);
