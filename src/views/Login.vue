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
             
             <!--第一行 -->
             <div class="row2">
                 <div>用户名</div>
                 <div><input v-model="uname" vlaue="uname" type="text" placeholder="请输入用户名"> </div>
             </div>
             <!--第二行 -->
             <div class="row3">
                 <div>密码</div>
                 <div><input v-model="upwd" vlaue="upwd" type="password" placeholder="请输入密码"> </div>
             </div>
             <!--第三行 -->
             <div class="row3">
                 <div>真实姓名</div>
                 <div><input v-model="user_name" vlaue="user_name" type="text" placeholder="请输入真实姓名"> </div>
             </div>
             <!--第四行 -->
             <div class="row3">
                 <div>电话</div>
                 <div><input v-model="phone" vlaue="phone" type="text" placeholder="请输入电话号码"> </div>
             </div>
           
            
             <!--第五行 -->
             <div class="row1">
                 <div>图形验证码</div>
                 <div><input type="text" placeholder="图形验证码"> </div>
                 <div>abcd</div>
                 <div>换一张</div>
             </div>
              <!--第六行 -->
             <div class="row4">
                 <div><input type="checkbox">我已阅读同意</div>
                 <div><a href="">&lt;&lt;易果服务协议&gt;&gt; &nbsp;</a></div>
                 <div><a href="">&lt;&lt;隐私政策&gt;&gt;</a></div>
             </div>
             <!-- 注册按钮 -->
             <div><button @click="load">立即注册</button></div>
         </div>
          
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
            console.log(result)
        })
      }
    },
    created(){
        
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
.row1,.row2,.row3,.row4{
    display:flex;
    margin-top:2rem;
}
</style>


