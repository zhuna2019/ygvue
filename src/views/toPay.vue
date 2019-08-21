
 <template>
 <div class="container">
     <top-header></top-header>
     <!-- 顶部 -->
     <div class="top">
         <div class="logo">
           <img src="../../public/imgs/logo.jpg" alt="">
        </div>
        <div>
           <h3 class="loginText">结算</h3>
        </div>
     </div>
     <!-- 付款主体 -->
     <div class="pay_body">
         <div class="check_item">
             <h4>填写核对订单信息</h4>
         </div>
         <hr>
     </div>
 </div>
 </template>
 <style scoped>
 .check_item{
   width:25%;
   height:5%;
   background:rgb(8, 153, 69); 
   color:#fff;
   padding:0.5rem;
   border-radius:8%; 
}
 .top{
    width:100%;
    height:5rem;
    background:#eee;
    display:flex;
    margin-bottom:3rem;
    align-items: center;
    padding-left:1rem;
}
.logo{
    margin-top:1rem;
}
.loginText{
    color:rgb(39, 121, 46);
    margin-left:10rem;
    margin-top:1rem;
}

 </style>