<template>
    <div class="app_cart">
        <div>
            全选<input type="checkbox">
        </div>
          <!-- 购物车商品信息 -->
        <div v-for="(item,i) of list" :key="i" class="cart-item">
           <div class="leftImgText"  :data-id="item.id">
               <input type="checkbox">
               <img @click="delItem"  :src="`http://127.0.0.1:5050/${item.img_url}`" :data-id="item.id">
               <div @click="delItem" class="title" :data-id="item.id">{{item.title}}</div>
               <div @click="delItem" class="price" :data-id="item.id">￥{{item.price}}</div>
              <span class="cn1" :data-lid="item.lid" data-num="-1" @click="update">-</span>
              <input type="text" :value="item.count">
              <span  :data-lid="item.lid" data-num="1" @click="update">+</span>
           </div>     
        </div>
       
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[],  
        }
    },
    methods:{
       update(e){    
        var lid=e.target.dataset.lid;
        var num=e.target.dataset.num;
       //获取请求url
        var url="update"
        // 请求参数
        var obj={num,lid}
        this.axios.get(url,{params:obj}).then(result=>{ 
            // console.log(result)
           if(result.data.code==1){
              this.loadMore();
           }
        })
       },
        // 删除功能
       delItem(e){
         //获取当前商品的id
         var id=e.target.dataset.id;
         //获取请求url
         var url="delete"
        // 请求参数
        var obj={id:id}
        this.$messagebox.confirm("确认删除?")
        // 确认删除
        .then(action=>{
            this.axios.get(url,{params:obj}).then(result=>{
               this.loadMore();
            })
        })
        // 确认取消
        .catch(err=>{
            this.$toast("取消删除")
        })  
       },
        loadMore(){
            // 加载购物车中的数据
            // 当组件创建成功后调用
            // 请求服务器地址
        var url="cart";
       
        this.axios.get(url).then(result=>{
            if(result.data.code==-1){
               this.$messagebox("请登录")
                this.$router.push("/Login");
                return;
            } this.list=result.data.data;
           
        })

        }
    },
    created(){
        this.loadMore();
    }
}
</script>
<style scoped>
.cart-item{
    display:flex;
    /* 两端对齐 */
    justify-content: space-between;
    /* 垂直居中 */
    align-items: center;
    /* 加底部边框 */
    border-bottom:1px solid #ccc;
    

}
.leftImgText{
    display:flex;
    align-items: center;
}
.leftImgText img{
    width:50px;
    height:50px;
}
.price{
    color:red;
    margin-left:25px;
}
input{
    width:17px;
    height:17px;
    text-align: center;
    

}
span{
    padding:0px 3px;
    border:1px solid #BBBBBB;
 
}
.cn1{
       margin-left:20px;
       padding:0px 5px;
}
/* 左侧图片与文字 */
/* 单独修改图片高度与宽度 */
/* 商品价格 */
</style>

