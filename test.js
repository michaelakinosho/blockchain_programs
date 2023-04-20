const http = require('http');
const fs = require('fs');


const server = http.createServer(function(request, response) {
    let filename = "test.html";
    let contentType = "text/html";

    if(request.url === "/test_style.css") {
        filename = "test_style.css";
        contentType = "text/css";
    }
    fs.readFile(filename, function(err, content) {
        if(err) {
            response.statusCode = 500;
            response.end(`Could not serve ${filename}`);
        }
        else {
            response.statusCode = 200;
            response.setHeader('Content-Type', 'text/html');
            response.end(content);
        }
    });
});

server.listen({port: 3000, host: 'localhost' }, function() {
    console.log('Server is running');
});