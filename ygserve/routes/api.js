const express=require("express");
const router=express.Router();
const pool=require("../pool");
var query=require("./query");

router.get("/index",(req,res)=>{
  var sql="SELECT pid,title,price,img_url FROM yg_index_product";
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      //setTimeout(function(){
        res.send(result);
      //},2000)
      
      /*res.writeHead(200,{
        "Access-Control-Allow-Origin":
          "*"
      });
      res.write(JSON.stringify(result));
      res.end();*/
    }
  })
})
// 登录路由

router.get("/login",(req,res)=>{

  var obj=req.query;
    
  var sql="SELECT uid FROM yg_user where uname=? AND upwd=?";
  pool.query(sql,[obj.uname,obj.upwd],(err,result)=>{
    // console.log(result)
     //执行sql语句回调函数
     if(err)throw err;
     //判断
     if(result.length==0){
       res.send({code:-1,msg:"用户名或密码有误"});
     }else{
      //  登录成功
      // 1将登录成功的凭据保存到session 中  
      req.session.uid=result[0].uid;
      // 将登录成功凭据保存到session中
      res.send({code:1,msg:"登录成功"})    
     }
  })
});
// 注册z

router.get('/regist',(req,res)=>{
 
  // 获取客户端传入的参数
  var obj=req.query;
  console.log(obj)
  //验证每一项的数据是否为空
  if(!obj.uname){
    res.send({code:401,msg:'uname require'});
	//return 阻止往后执行
	return;
  }
  if(!obj.upwd){
    res.send({code:402,msg:'upwd required'});
	return;
  }
  if(!obj.user_name){
    res.send({code:403,msg:'email required'});
	return;
  }
  if(!obj.phone){
    res.send({code:404,msg:'phone required'});
	return;
  }
  var sql="insert into yg_user set ?";
  pool.query(sql,[obj],(err,result)=>{
    if(err){
      res.send(err);
      
    }else{
        res.send(result);
     
    }
  })
})
//添加购物车 107~150
//no
//登录成功
//http://127.0.0.1:5050/login?uname=tom&upwd=123
// // 功能三
// 次功能条件是先登录
// 1 get addcart
router.get("/addcart",(req,res)=>{
  // 参数
  var obj=req.session;
  var uid=obj.uid;
  // 如果当前用户没有登录
  if(!uid){
    // 返回错误信息
    res.send({code:-1, msg:"请先登录"});
    return;
  }
  // 2.4获取商品编号,商品价格,商品名称
  var lid=req.query.pid;
  
  var price=req.query.price;
  var title=req.query.title;
  var img_url=req.query.img_url;
  // 3查询指定用户是否购买过此商品
  var sql="select id from yg_cart where uid=? and lid=?";
  pool.query(sql,[uid,lid],(err,result)=>{
     if (err) throw err;
     var sql="";
     if(result.length==0){
      //  4没有购买过则添加信息
          sql=`insert into yg_cart values(null,${lid},${uid},1,'${title}',${price},'${img_url}')`;
     }else{
      //  5购买过则更新信息
         sql=`update yg_cart set count=count+1 where uid=${uid} and lid=${lid}`;
     }
     pool.query(sql,(err,result)=>{
        if(err) throw err;
        console.log(result);
        res.send({code:1,msg:"添加成功"});
     })
  })

})

// 功能四:查询当前登录用户购物车信息
// 此功能先行条件:登录
// 1:请求方式:get 请求地址:/yg_cart
router.get("/cart",(req,res)=>{
  //2:获取uid 并且判断如果没有请求登录
  var uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  //3:创建sql查询用户购物车内容
  var sql ="select id,lid,title,price,count,img_url from yg_cart where uid=?"
 
  //4:获取返回结果并且发送客户端
  pool.query(sql,[uid],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"查询成功",data:result});  
  })  
})

// 功能五 完成删除功能
router.get("/delete",(req,res)=>{
  //2:获取uid 并且判断如果没有请求登录
  var id = req.query.id;
  console.log(id)
  if(!id){
    res.send({code:-1,msg:"删除失败"});
    return;
  }
  //3:创建sql查询用户购物车内容
  var sql ="delete from yg_cart where id=?"
 
  //4:获取返回结果并且发送客户端
  pool.query(sql,[id],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"删除成功"});  
  })  
})

// 功能六 更新购物车
// 增加功能
router.get('/update',function(req,res){
  var uid = req.session.uid;
   var lid=req.query.lid;
   var num=req.query.num;
var sql=`update yg_cart set count=count+${num} where uid=${uid} and lid=${lid}`;
pool.query(sql,[uid,lid],function(err,result){
if (err)
{
  throw err
}
res.send({code:1,msg:'update success'})
})
})

//功能6 产品列表分页功能
router.get("/products",(req,res)=>{
  var output={
    count:0,
    pageSize:12,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  var kw=req.query.kw;
  if(kw){
    //"mac i5 128g"
    var kws=kw.split(" ");
    //[mac,i5,128g]
    kws.forEach((elem,i,arr)=>{
      arr[i]=`title like '%${elem}%'`;
    })
    /*[
      title like '%mac%',
      title like '%i5%',
      title like '%128g%'
    ]*/
    //join(" and ");
    var where=kws.join(" and ");
    //"title like '%mac%' and title like '%i5%' and title like '%128g%'"
    var sql=`select *,(select md from yg_fresh_pic where fresh_id=lid limit 1) as md from yg_fresh where ${where}`;
    query(sql,[])
    .then(result=>{
      output.count=result.length;
      output.pageCount=
        Math.ceil(output.count/output.pageSize);
      sql+=` limit ?,?`;
      return query(sql,[output.pageSize*output.pno,output.pageSize]);
    })
    .then(result=>{
      output.data=result;
      res.send(output);
    })
  }else{
    res.send(output);
  }
})
router.get("/shelp",(req,res)=>{
  var kw=req.query.kw;
  var kws=kw.split(" ");
  kws.forEach((elem,i,arr)=>{
    arr[i]=`title like '%${elem}%'`;
  })
  var where=kws.join(" and ");
  var sql=`select lid,title from yg_fresh where ${where} limit 10`;
  query(sql,[]).then(result=>{
    res.send(result);
  })
})

module.exports=router;

function newFunction() {
  return "/regist";
}
