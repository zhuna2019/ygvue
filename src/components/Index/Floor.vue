<template>
<div>
    <div class="step">
            <div><img src="../../../public/imgs/img/index/1.png" alt=""></div>
            <div class="title">F1进口水果</div>
    </div>
    <div class="flool">
        
        <div class="fl_left">
            <img src="../../../public/imgs/img/index/9288735686894994.jpg" alt="">
        </div>
        <div class="fl_right">
            <div class="fl_right_top">
                <div><img src="../../../public/imgs/img/index/9288734314669428.jpg" alt=""></div>
                <div><img src="../../../public/imgs/img/index/9288734314800500.jpg" alt=""></div>
                <div><img src="../../../public/imgs/img/index/9288734315029876.jpg" alt=""></div>
            </div>
            <div class="fl_right_btm">
                <div><img src="../../../public/imgs/img/index/9288734315292020.jpg" alt=""></div>
                <div><img src="../../../public/imgs/img/index/9288734315390324.jpg" alt=""></div>
                <div><img src="../../../public/imgs/img/index/9288734315652468.jpg" alt=""></div>
            </div>
        </div>
    </div>
</div>
</template>
<script>
export default {
    data(){
        return{
           
        }
    },
    // 定义自定义属性接收父元素传递数据的变量
    props:["messages"],
    
    
 
}
</script>
<style scoped>
.step{
    width:100%;
    height:40px;
    display:flex;
    margin-bottom:20px;
    line-height: 40px;
    
}
.flool{
    display:flex;
}
.fl_right_top{
      display:flex;
  }
.fl_right_btm{
      display:flex;
  }
</style>

