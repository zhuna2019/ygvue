<template>
<div>
  <my-header></my-header>
  <div class="container">
        <ul class="bar">
                <li><!-- 左侧导航栏 -->
                 <div id="sideBar">
                  <div class="dropdown">
                   <div class="dropdown-toggle" >全部商品分类</div>
                    <ul class="dropdown-menu" >
                      <li class="">
                          <span class="iconfont icon-yingtao mx-2"></span>
                          进口水果                       
                      </li>
                      <li>
                        <span class="iconfont icon-xigua mx-2"></span>
                          国产水果                     
                      </li>
                      <li>
                            <span class="iconfont icon-roulei mx-2"></span>
                            精选肉类                     
                        </li>
                        <li>
                            <span class="iconfont icon-yu mx-2"></span>
                            海鲜水产                      
                        </li>
                        <li>
                            <span class="iconfont icon-yingtao mx-2"></span>
                            即烹美食                     
                        </li>
                        <li>
                            <span class="iconfont icon-niunairupin mx-2
                            "></span>
                             乳品糕点                     
                        </li>
                        <li>
                                <span class="iconfont icon-qinlei mx-2"></span>
                                 禽类肉类                     
                            </li>
                        <li>
                            <span class="iconfont icon-sushi mx-2"></span>
                            方便速食  
                        </li>
                        <li>
                                <span class="iconfont icon-liangyou mx-2"></span>
                            粮油杂货
                        </li>
                        <li>
                                <span class="iconfont icon-sushi mx-2"></span>
                               新鲜蔬菜
                        </li>
                        <li>
                                <span class="iconfont icon-jiulei mx-2"></span>
                            食品饮料
                         </li>
                    </ul>
                  </div>
                 </div>
                </li>
                <li>新品专区</li>
                <li>优质生活</li>
                <li>银行专区</li>
                <li>菜谱专栏</li>    
        </ul>
        <div class="detail">
           <div class="left">
              <div class="lg">
                <img src="http://127.0.0.1:5050/9288729676162324_500.jpg" alt="">
              </div>
              <div class="sm">
                  <div class="sm_img"><img src="http://127.0.0.1:5050/9288729676129556_500.jpg" alt=""></div>
                  <div class="sm_img"><img src="http://127.0.0.1:5050/9288729676162324_500.jpg" alt=""></div>
                  <div class="sm_img"><img src="http://127.0.0.1:5050/9288729676195092_500.jpg" alt=""></div>
              </div>
           </div>
           <div class="right">
              <div class="title">原膳南海大虾1.8kg(50-60只/kg)</div>
              <div class="sub_title">南海大虾 基围虾</div>
              <div class="price">价格： <span>￥149.00</span></div>
              <div class="size">
                <div>规格:</div>
                <div class="si">
                    <div>￥149.00</div>
                    <div>1.8kg/盒</div>
                </div>
              </div>
              <div><el-input-number size="small" v-model="num" @change="handleChange" :min="1"  label="描述文字"></el-input-number></div>
              <button>加入购物车</button>
           </div>
        </div>
  </div>
  
   <my-footer/> 
</div>
  
</template>
<script>
  export default {
    data() {
      return {
        num: 1
      };
    },
    methods: {
      handleChange(value) {
        console.log(value);
      }
    }
  };
</script>
<style scoped>
.bar{
    width:100%;
    height:2rem;
    display:flex;
    list-style: none;
    color:#000;
    font:18px SimHei;
    line-height: 2rem;
    border-bottom:1px solid #333;
    padding-left:0;
}
 .bar>li{
     margin-right:2.5rem;
 }
.dropdown:hover ul.dropdown-menu{
    display:block !important ;
}
.dropdown-toggle{
    width:10rem;
    height:2rem;
    color:#fff;
    background:rgb(3, 146, 74);
    line-height: 2rem;
    text-align: center;
}
.detail{
  display:flex;
}
.right{
  margin-left:1rem;
}
.sm{
  display:flex;
  margin-top:1rem;
}
.sm_img{
  margin-right:1rem;
  border:1px solid #333;
}
.sm_img img{
  width:67px;
  height:67px;
}
.title{
  font-size:26px;
}
.sub_title{
  color:#999;
  margin-bottom:2rem;
}
.price span{
  color:red;
  font-size:18px;
}
.size{
  display:flex;
  padding-top:2rem;
  padding-bottom:2rem;
}
.si{
  width:5rem;
  height:3rem;
  border:1px solid rgb(4, 175, 95);
  margin-left:1rem;
 
}
button{
  width:36%;
  margin-top:1rem;
 
}
</style>
