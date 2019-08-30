<template>
    <div class="header">
        <!-- 顶部工具栏 -->
        <div class="topTool ">
            <!-- 工具栏左侧 -->
            <div class=" t_left">
                <ul class="nav ">
                    <li class="nav-item  mr-2">欢迎光临阳光生鲜！</li>
                    <li class="send_to nav-item  mr-1">
                        <div class="">配送至:</div>
                        <div class="docs-methods " >
                                    <form class="form-inline">
                                        <div id="distpicker">
                                            <div class="form-group">
                                                <div style="position: relative;">
                                                    
                                                        <input id="city-picker3" class="form-control " readonly type="text"  data-toggle="city-picker">
                                                   
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
            <div class=" t_right ">
                <ul class="nav">
                    <li class="nav-item" :class="show" ><router-link to='Login' >登录</router-link>
                    </li>
                    <li :class="unshow"><span class="uname">欢迎{{uname}}</span></li>
                    <li class="nav-item" :class="show"><router-link to='Regist'>注册</router-link></li>
                    <li class="nav-item"><a href="">我的易果</a>
                        <ul class="d-none">
                            <li>我的订单</li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="">手机易果</a>
                       
                    </li>
                    <li class="nav-item"><a href="">礼品绑定</a></li>
                    <li class="nav-item"><a href="">礼品兑换券入口</a></li>
                    <li class="nav-item"><a href="">营业资质</a></li>
                    <li class="nav-item"><a href="">人才招聘</a></li>
                </ul>
            </div>
        </div>
        <!-- 头部LOGO 搜索，购物车 -->
        <div class="topHead">
            <div class="log col-3">
               <img src="../../public/imgs/logo.jpg" alt="">
            </div>
            <div class="search ">
                <input v-model="kw" type="text" placeholder="输入商品名" @keyup.13="search"><span @click="search">搜索</span>
            </div>
            <div class="cart ">查看购物车
                <img @click="jump" src="../../public/imgs/cart.png" alt="">
                <span style="color:red">
                   {{$store.getters.getCartCount}}
               </span>
            </div>
        </div>
    </div>
</template>
<style scoped>
.showLogin{
    display:block;
}
.unshow{
    display:none;
}
.uname{
    color:rgb(236, 77, 49);
    font-size:18px;
}

/* 顶部工具栏左侧 */
.header>.topTool{
    width:100%;
    height:2rem;
    display:flex;
    justify-content: center;
    align-items: center;
    
   
}
.header>.topTool>.t_left{
    font-size:12px;
    color:#666;
    margin-right:20%;
}
.nav{
    align-items: center;
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
   font-size:12px;
   margin-left:10px;
    text-align: right;
  
}

.send_to {
    display:flex;
    align-items: center;
}

.header>.topHead{
    display:flex;
    width: 100%;
    align-items: center;
    height:90px;
    background:#eee;
   justify-content:center ;
   
 
}
.header>.topHead>.log{
    width:50px;
    height:50px;
    margin-left:2%;
    
}
.header>.topHead>.search{
    display:flex;
    align-items: center;
    width:650px;
    height:30px;
    text-align: center;
}
.header>.topHead>.search>input{
    width:70%;
   border:1px solid rgb(233, 83, 14);
   padding-left:10px;
   font-size:12px;
   
   
}
.header>.topHead>.search>span{
   
    padding:6px 15px;
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
<script>
export default {
    data(){
      return{
          kw:"",
          uname:"",
          show:{
              showLogin:true, //默认启用
              unshow:false,  //验证通过启用
             
          },
          unshow:{
              showLogin:false,
              unshow:true
          }
      }
    },
    mounted(){
        this.kw=this.$route.params.kw;
    },
    created(){
        this.isLogin();
    },
    watch:{
        //监控地址栏中的信息
       "$route"(){
           this.kw=this.$route.params.kw;
       }
    },
    methods:{
        jump(){
             var url="api/cart";
            this.axios.get(url).then(result=>{
            if(result.data.code==-1){
                this.$router.push("/Login");
                return;
            }else if(result.data.code==1){
              this.$router.push("/cart")
           }
            }) 
        },
        search(){
            this.$router.push(`/products/${this.kw}`)
        },
        isLogin(){
         // 1 获取url
         var url="api/isLogin"
           this.axios.get(url).then(result=>{
               console.log(result)
               if(result.data.code==-1){
                  this.show.showLogin=true;
                   this.show.unshow=false;
                   this.unshow.showLogin=false;
                   this.unshow.unshow=true;
               }else if(result.data.code==1){
                   this.show.showLogin=false;
                   this.show.unshow=true;
                   this.unshow.showLogin=true;
                   this.unshow.unshow=false;
                   this.uname=result.data.data;
                   
               }
           })
        }
    },
}
</script>


