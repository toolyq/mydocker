module.exports=function(app){
    app.use("/",function(req,res,next){
        res.header("Access-Control-Allow-Origin", "*");
        res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS');
        res.header("Access-Control-Allow-Headers", "X-Requested-With");
        res.header('Access-Control-Allow-Headers', 'Content-Type');
        log(req.url);
        next();
    });
    var dirName = __dirname;
    var routesPath = path.join(dirName,"/routes");
    var routes = loadroutes(routesPath,"");
    log(routes.map((v,i,arr)=>{return v.url + " # "+ v.type}));
    for(const r of routes){
        app[r.type](r.url, r.run);
    }
}
var fs = require("fs")
var path=require("path");
function loadroutes(routesPath, baseURI){

    var files = fs.readdirSync(routesPath);
    var allRoutes = [];
    for(var i = 0; i < files.length; i ++){
        var filePath = path.join(routesPath,files[i]);
        if(fs.statSync(filePath).isDirectory()){
            let routes2 = loadroutes(filePath, "/" + files[i]);
            allRoutes = allRoutes.concat(routes2);
        }else{
            let routes = require(filePath);
            var extname = path.extname(filePath);
            var basename = path.basename(filePath, extname);
            for(const route of routes){
                route.url = baseURI + "/" + basename + route.url;
                route.type = route.type || "all";
                allRoutes.push(route);
            }
        }
    }
    return allRoutes;
}

function log(){
    console.log(...arguments);
}