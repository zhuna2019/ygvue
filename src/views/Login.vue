<template>
<div class="container">
    <!-- 头部 -->
    <div class="header">
        <div class="logo">
           <img src="../../public/imgs/logo.jpg" alt="">
        </div>
        <div>
           <h3 class="loginText">登录</h3>
        </div>
    </div>
    <div class="login">
       <!--第一行 -->
    <div class="row1">
        <div>用户名</div>
        <div><input v-model="uname" vlaue="uname" type="text" placeholder="请输入用户名"> </div>
    </div>
             <!--第二行 -->
    <div class="row2">
        <div>密码</div>
        <div><input v-model="upwd" vlaue="upwd" type="password" placeholder="请输入密码"> </div>
    </div>
    <!-- 第三行 -->
    <div class="row3">
        <div><input type="checkbox">自动登录</div>
        <div><a href="javascript:;">忘记登录密码？</a></div>
    </div>
    <!-- 第四行 -->
    <div class="row4">
        <button>登录</button>
    </div>
    </div>
</div>
</template>

<style scoped>
.header{
    width:100%;
    height:4rem;
    background:#eee;
    display:flex;
    margin-bottom:3rem;
}
.logo{
    margin-top:1rem;
}
.loginText{
    color:rgb(39, 121, 46);
    margin-left:10rem;
    margin-top:1rem;
}
.login{
    width:20rem;
   display:flex;
   flex-direction: column;
   align-items: center;
   border:1px solid #aaa;
}
.row1,.row2,.row3,.row4{
   
    display:flex;
    margin-bottom:3rem;
    margin-top:1rem;
    justify-content: space-around;
}
.row1 input,.row2 input{
    width:15rem;
    height:2.5rem;
   padding-left:1rem;
  
   outline: 0;
   
}
button{
  width:18rem;
  height:2.5rem;
  background:rgb(14, 184, 141);
  border:0;outline: 0;
}
</style>