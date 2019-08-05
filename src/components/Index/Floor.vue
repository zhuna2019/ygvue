<template>
<div class="container rows">
    <div class="left_step ">
            <div class="title" >礼品礼券</div>
            <div><img src="../../../public/imgs/img/index/gift_banner.png" alt=""></div>    
    </div>
    <div class="flool ">
        <!-- 面包屑导航 -->
        <div>
            <el-breadcrumb separator="|">
              
              <el-breadcrumb-item>礼卡礼券</el-breadcrumb-item>
              <el-breadcrumb-item>节日礼盒</el-breadcrumb-item>
              <el-breadcrumb-item>员工福利</el-breadcrumb-item>
              <el-breadcrumb-item>商务赠礼</el-breadcrumb-item>
              <el-breadcrumb-item>走亲访友</el-breadcrumb-item>
              <el-breadcrumb-item>生日礼盒</el-breadcrumb-item>
              <el-breadcrumb-item>伴手礼</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <!-- 商品列表 -->
        <div>
            <item></item>
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
    props:[],
    methods:{
       
    }
 
}
</script>
<style scoped>
.rows{
    display:flex;
}
.flool{
    margin-left:30px;
}

</style>

