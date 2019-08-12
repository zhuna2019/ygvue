//使用express构建web服务器 
const express = require('express');
const bodyParser = require('body-parser');
const apiRouter=require('./routes/api.js');
//session
const session = require("express-session");


const cors=require("cors");
/*引入路由模块*/


var app = express();
var server = app.listen(5050);//部署新浪云，硬性要求必须监听5050端口
//3:配置跨域模块 50
app.use(cors({
  //允许跨域访问程序地址列表
  origin:["http://127.0.0.1:8080",
  "http://localhost:8080"],
  credentials:true //请求验证
}))//从此所有响应，自动带Access-Control-Allow-Origin:http://127.0.0.1:5500
//万一客户端浏览器地址发生变化，只改这里origin一处即可！
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//?4:配置session模块
app.use(session({
  secret:"128位字符串",//安全字符串
  resave:true,//请求更新数据
  saveUninitialized:true //保存初始数据
}));
//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use( '/api',apiRouter );




