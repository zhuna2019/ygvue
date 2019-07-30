<template>

       <!-- 轮播图 -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="../../public/imgs/img/index/ad2.jpg" alt="First slide">
          </div>
          
          <div class="carousel-item">
            <img class="d-block w-100" src="../../public/imgs/img/index/ad3.jpg" alt="4th slide">
          </div>
        </div>
         <!-- 轮播指示器 -->
        <ul class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    
        </ul>
      <!-- 左右箭头 -->
     <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
             <span class="sr-only">Next</span>
        </a>
       
        <!-- 左侧导航栏 -->
        <div id="sideBar">
                <div class="dropdown">
                   <div class="dropdown-toggle" @click="dropdown">全部商品分类</div>
                    <ul class="dropdown-menu" :class="phoneClass">
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
    
    </div>

</template>
<style scoped>
  
  *{margin:0px;padding:0px;}
#carouselExampleIndicators{
    width:100%;
    height:100%;
    position: relative;
}
 ul.carousel-indicators>li{
    width:10px;
    height:10px;
    border-radius: 50%;
    background-color:#fff;

  }
  ul.carousel-indicators>li.active{
      background-color:rgb(9, 195, 228);
  }
  #sideBar{
      width:200px;
      height:500px;
   
      z-index: 3;
      position: absolute;
      top:0px;
      left:15%;
  }
  #sideBar>.dropdown{
    width:200px;
    height:500px;
    position: relative;
  }
  #sideBar .dropdown-toggle{
      width:100%;
      height:40px;
      background:rgb(3, 104, 62);
      color:#fff;
      line-height: 40px;
      outline: none;
      text-align: center;
     
  }
  #sideBar .dropdown>ul.dropdown-menu{
      width:200px;
      height:460px;
      position:absolute;
      top:40px;
      background:rgba(20, 20, 20, 0.8);
      color:#fff;
      
  }
</style>

<script>
export default {
   data(){
       return{     
          phoneClass:{show:true}
           }
   },
   methods:{
    dropdown(){
        if(this.phoneClass.show==true){
            this.phoneClass.show=false;
        }else{
             this.phoneClass.show=true;
        }
    } 
   }  
}



</script>


