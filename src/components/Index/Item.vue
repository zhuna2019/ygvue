<template>
    <div  class="publics">
        <div class="pub_img">
           <img :src="`http://127.0.0.1:5050/${item.img_url}`">
        </div>
        <div class="title">
           {{item.title}}
        </div >
        <div class="price">
          ￥{{item.price}}
        </div>
        <div class="cart">
          <button @click="addcart"  :data-pid="item.pid" :data-price="item.price" :data-title="item.title" :data-img="item.img_url">加入购物车</button>
        </div>
    </div>
</template>
<script>
export default {
    data(){return{
       
    }
    },
    props:["item"],
    methods:{
        addcart(e){
          // 1获取参数
             var pid=e.target.dataset.pid;
             var price=e.target.dataset.price;
             var title=e.target.dataset.title;
             var img_url=e.target.dataset.img;
              console.log(title)
            // 2发送ajax请求
            // 2.1请求服务器地址
            var url="api/addcart";
            // 2.2请求参数
            var obj={pid,price,title,img_url};
            // 3发送请求获取返回结果
            this.axios.get(url,{params:obj}).then(result=>{
                console.log(result)
                if(result.data.code==-1){
                
                    this.$router.push("/Login");
                }else{
                     this.$message({
                     message: '恭喜你，成功加入购物车',
                     type: 'success'
                     });
                    // 修改共享购物车中数量值
                  this.$store.commit("increment");
                }
            })
        }
    },
}
</script>
<style scoped>
.publics{
  width:190px;
  height:210px;
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
.cart{
    margin-right:30px;
}
</style>

