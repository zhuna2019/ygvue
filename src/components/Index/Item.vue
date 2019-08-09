<template>
    <div  class="publics">
        <div class="pub_img">
           <img :src="`http://127.0.0.1:5050/${item.img_url}`">
           <img src="" alt="">
        </div>
        <div class="title">
           {{item.title}}
        </div >
        <div class="price">
          ￥{{item.price}}
        </div>
    </div>
</template>
<script>
export default {
    data(){return{}
    },
    props:["item"],
}
</script>
<style scoped>
.publics{
  width:180px;
  height:180px;
  text-align: center;
  margin-top:20px;
 
}
.pub_img{
    
    display:flex;
   
    
}
.pub_img>img{
    width:150px;
    height:150px;
    
}
.title{
    font-size:12px;
    margin-right:50px;
    
}
.price{
    margin-right:50px;
}
</style>

