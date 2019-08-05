<template>
    <div  ...
     class="publics">
        <div class="pub_img">
           <img src="http://127.0.0.1:5050/01.jpg">
        </div>
        <div class="title">
           心中最甜幸福礼赞礼盒1.296kg
        </div>
        <div>
           ￥158
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
.publics{
  width:200px;
  height:300px;
  text-align: center;
}
.pub_img{
    width:200px;
    height:200px;
    display:flex;
    align-items: center;
    
}
.pub_img>img{
    width:150px;
    height:150px;
    margin:0 25px;
}
.title{
    font-size:12px;
    
}
</style>

