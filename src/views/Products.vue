<template>
    <div>
        <my-header></my-header>
        <div id="main" class="container">
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
        </div>
    </div>
</template>
<script>

export default {
    data(){
        return{}
    }
}
</script>>
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
</style>>