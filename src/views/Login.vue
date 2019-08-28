<template>
<div class="container">
    <!-- 头部 -->
    <div class="header">
        <div class="logo">
           <router-link to='/' ><img src="../../public/imgs/logo.jpg" alt=""></router-link>
        </div>
        <div>
           <h3 class="loginText">登录</h3>
        </div>
    </div>
    <div class="login">
    <div class="top">
        <h5>欢迎登录</h5>
        <div class="right">还没有账号？<router-link to='Regist' class="rig">欢迎注册</router-link></div>
    </div>
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
        <div class="auto"><input id="chb" type="checkbox">自动登录</div>
        <div><a href="javascript:;">忘记登录密码？</a></div>
    </div>
    <!-- 第四行 -->
    <div class="row4">
        <button @click="login">登录</button>
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
.rig{
     color:rgb(39, 121, 46);
}
.login{
    width:20rem;
   display:flex;
   flex-direction: column;
   align-items: center;
   border:1px solid #aaa;
}
.top{
    width: 100%;
    display:flex;
    margin-top:2rem;
    justify-content: space-around;
}
h5{
    margin-right:4rem;
}
.top>.right{
    font-size:14px;
  
}
.row1,.row2,.row3,.row4{
   
    display:flex;
    margin-bottom:3rem;
    margin-top:1rem;
   
}

a{
    font-size:14px;
    color:#666;
}
.row1 input,.row2 input{
    width:15rem;
    height:2.5rem;
   padding-left:1rem;
   margin-left:1rem;
   outline: 0;
   
}
.row2 input{
  margin-left:1.5rem;
}
.auto{
  margin-right:6rem;
  font-size:14px;
}

button{
  width:18rem;
  height:2.5rem;
  background:rgb(14, 184, 141);
  border:0;outline: 0;
}
</style>
<script>
export default {
    data(){
        return{
            uname:"",
            upwd:""
        }
    },
    methods:{
       login(){
        // 1 获取url
         var url="api/login"
        // 2 获取参数
        var  uname=this.uname;
        var  upwd=this.upwd;
        // 用户名非空验证
        if(!uname){
            this.$message({
             showClose: true,
             message: '用户名不能为空',
             type: 'error'
            });
            return;
         }
         // 密码非空验证
         if(!upwd){
            this.$message({
             showClose: true,
             message: '密码不能为空',
             type: 'error'
            });
            return;
         }
         var obj={uname,upwd}
        
        this.axios.get(url,{params:obj}).then(result=>{
                if(result.data.code==-1){
                    this.$message.error('用户名或密码错误');
                }else if(result.data.code==1){
                    this.$router.push("/")
                }
        })
       }
    },
    
}
</script>><>