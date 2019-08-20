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
     </div>
</template>
<style  scoped>
/* 顶部工具栏左侧 */
.header>.topTool{
    width:100%;
    height:2rem;
    display:flex;
    justify-content: space-between;
    align-items: center;
    
   
}
.header>.topTool>.t_left{
    font-size:12px;
    color:#666;
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
          this.$router.push("/cart")
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
