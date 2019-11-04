module.exports=[{
    url: "/info",
    type:"get",
    run(req,res,next){
        var rs = { uid: "@guid", name: "@name" }
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