var Mock = require("mockjs");

module.exports=[{
    url: "/info",
    type:"get",
    run(req,res,next){
        var rs = Mock.mock({ uid: "@guid", name: "@name" });
        res.json(rs);
    }
},{
    url:"/login",
    type:"post",
    run:(req,res,next)=>{
        res.json( {sta:"ok"});
    }
},{
    url:"/logout",
    run(req,res,next){
        res.json( {sta:"ok"})
    }
}]