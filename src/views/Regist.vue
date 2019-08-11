<template>
    <div class="container">
         <!-- 头部 -->
         <div class="header">
             <div class="logo">
                 <img src="../../public/imgs/logo.jpg" alt="">
            </div>
            <div>
               <h3 class="regtext">注册</h3>
            </div>
         </div>
         <!-- 注册区域 -->
         <div class="reg">
             
            <div class="content"> 
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
             <!--第三行 -->
             <div class="row3">
                 <div>真实姓名</div>
                 <div><input v-model="user_name" vlaue="user_name" type="text" placeholder="请输入真实姓名"> </div>
             </div>
             <!--第四行 -->
             <div class="row4">
                 <div>电话</div>
                 <div><input v-model="phone" vlaue="phone" type="text" placeholder="请输入电话号码"> </div>
             </div>
           
            
             <!--第五行 -->
             <div class="row5">
                 <div>图形验证码</div>
                 <div><input type="text" placeholder="图形验证码"> </div>
                 <div>abcd</div>
                 <div>换一张</div>
             </div>
              <!--第六行 -->
             <div class="row6">
                 <div><input type="checkbox">我已阅读同意</div>
                 <div><a href="">&lt;&lt;易果服务协议&gt;&gt; &nbsp;</a></div>
                 <div><a href="">&lt;&lt;隐私政策&gt;&gt;</a></div>
             </div>
             <!-- 注册按钮 -->
             <div><button @click="load">立即注册</button></div></div>
            <div class="right">
                <div class="">我已注册,现在就<router-link to='Login'>立即登录</router-link> </div>
                <div><img src="../../public/imgs/register.png" alt=""></div>
            </div>
         </div>
          s
    </div>
</template>
<script>
export default {
    data(){
        return{
            uname:"",
            upwd:"",
            user_name:"",
            phone:""
        }
    },
    methods:{
        load(){
            
          // 获取请求url
        var url="api/regist"
        // 获取请求参数
        var uname=this.uname;
        var upwd=this.upwd;
        var user_name=this.user_name;
        var phone=this.phone
        var obj={uname,upwd,user_name,phone}
        
        // 发送请求
        this.axios.get(url,{params:obj}).then(result=>{
           if(result.data.affectedRows>0){
               this.$router.push("/login")
           }
        })
      }
    },
}
</script>
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
.regtext{
    color:rgb(39, 121, 46);
    margin-left:10rem;
    margin-top:1rem;
}
a{
    color:rgb(10, 167, 101);
    margin-left:0.5rem;
    text-decoration: none;
}
.reg{
    display:flex;
    
    border:1px solid rgb(6, 179, 135);
    border-top:none;
}

.content{
    display:flex;
    flex-direction: column;
    width:70%;
    align-items: center;
    border-right:1px solid #aaa;
    margin-bottom:4rem;
}
.row1,.row2,.row3,.row4,.row5,.row6{
   
    display:flex;
    margin-top:2rem;
    align-items: flex-start;
}
.row6{
    font-size:14px;
    margin-left:5rem;
}
.row1 input,.row2 input,.row3 input,.row4 input,button{
    width:15rem;
    height:2.5rem;
   padding-left:1rem;
   margin-left:1rem;
   outline: 0;
   
}
.row5{
    text-align: left;
}
.row5 input{
    width:8rem;
    height:2.5rem;
    padding-left:1rem;
    margin-left:1rem;
    
   outline: 0;
}
.row1 input{
    margin-right:1rem;
}
.row3 input{
    margin-right:2rem;
}
button{
    background:rgb(4, 158, 81);
    outline: 0;border:0;
    margin-top:1rem;
}
</style>


