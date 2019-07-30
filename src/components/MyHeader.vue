<template>
    <div class="header">
        <!-- 顶部工具栏 -->
        <div class="topTool row">
            <!-- 工具栏左侧 -->
            <div class="col-5 t_left">
                <ul class="nav ">
                    <li class="nav-item float-left mr-2">欢迎光临阳光生鲜！</li>
                    <li class="nav-item float-left mr-1">
                        <div class="float-left">配送至:</div>
                        <div class="docs-methods float-left" >
                                    <form class="form-inline">
                                        <div id="distpicker">
                                            <div class="form-group">
                                                <div style="position: relative;">
                                                    
                                                        <input id="city-picker3" class="form-control " readonly type="text" value="溧阳市" data-toggle="city-picker">
                                                   
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </form>
                        </div>
                    </li>
                    <li class="nav-item float-left">
                        <img src="../../public/imgs/喇叭.png" alt="">
                        <span><a href="javascript:;">网警提醒</a></span>
                    </li>
                </ul>
            </div>
            <!-- 工具栏右侧 -->
            <div class="col-7 t_right ">
                <ul class="nav">
                    <li><a href="">登录</a></li>
                    <li><a href="">注册</a></li>
                    <li><a href="">我的易果</a>
                        <ul class="d-none">
                            <li>我的订单</li>
                        </ul>
                    </li>
                    <li><a href="">手机易果</a>
                        <div>
                            <img src="" alt="">
                        </div>
                        <div>
                                <img src="" alt="">
                            </div>
                    </li>
                    <li><a href="">礼品绑定</a></li>
                    <li><a href="">礼品兑换券入口</a></li>
                    <li><a href="">营业资质</a></li>
                    <li><a href="">人才招聘</a></li>
                </ul>
            </div>
        </div>
        <!-- 头部LOGO 搜索，购物车 -->
        <div class="topHead row">
            <div class="log col-3">
                <img src="../../public/imgs/logo.jpg" alt="">
            </div>
            <div class="search col-6">
                <input type="text" placeholder="输入商品名"><span>搜索</span>
            </div>
            <div class="cart col-3">
                <img src="../../public/imgs/cart.png" alt="">
            </div>
        </div>
    </div>
</template>
<style scoped>
/* 顶部工具栏左侧 */
.header>.topTool>.t_left{
    font-size:14px;
    color:#666;
}
.header>.topTool>.t_left a{
    color:#666;
    text-decoration: none;
}
.header>.topTool>.t_left input{
   width:110px !important;
   color:rgb(10, 156, 161) !important;
 
}
/* 顶部工具栏右侧 */
.header>.topTool>.t_right>ul a{
   color:#666;
   font-size:14px;
   margin-left:10px;
    text-align: right;
}

.header>.topHead{
    width:1280px;
    height:90px;
    margin-bottom:50px;
    
   
}
.header>.topHead>.log{
    width:50px;
    height:50px;
     margin:-40px 0px;
    
}
.header>.topHead>.search>input{
   width:70%;
   border:1px solid rgb(233, 83, 14);
   padding-left:10px;
   font-size:12px;
   
   
}
.header>.topHead>.search>span{
   
    padding:3px 15px;
    background:rgb(233, 83, 14);
    line-height: 10px;
    text-align: center;
    color:#fff;
    font-size:12px;
}
.header>.topHead>.cart{
    width:100px;
    height:50px;
  
   
}
</style>


