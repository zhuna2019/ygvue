<template>
<div class=" rows">
    <div class="left_step ">
            <div class="title" >进口水果<span>/ GIFT COUPONS</span></div>
            <div><img src="../../../public/imgs/img/index/9288735686141330.jpg" alt=""></div>    
    </div>
    <div class="flool ">
        
        <!-- 商品列表 -->
        <div class="details">
            <item  v-for="(item,i) of messages" :key="i" :item="item" ></item>
        </div>
    </div>
</div>
</template>
<script>
// 1引入子组件
import Item from "./Item"
export default {
    data(){
           return{}     
    },
    components:{
              Item
    },
    // 定义自定义属性接收父元素传递数据的变量
    props:["messages"],
    methods:{
       
    },
 
}
</script>
<style scoped>
.rows{
     margin-top:30px;
    display:flex;
}
.flool{
   margin-top:20px;
    margin-left:30px;
}
.details{
    display:flex;
    flex-wrap: wrap;
}
.title{
    font-size:26px;
}
.title>span{
    font-size:10px;
}
</style>

