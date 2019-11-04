var express = require("express");

var app = express();

app.disable("x-powered-by");
app.set('etag', false); 


app.use("/", express.static(__dirname + "/html"));

require("./autoroute")(app);
app.all("/*", function(req, res) {
    res.status(404).end(req.url);
});

var port = 88;

app.listen(port,()=>{
    console.log("https://localhost:" + port);
}).on("error", function(err) {
    console.log(err);
});
