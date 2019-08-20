<template>
    <div class=" container">
       <my-header></my-header>
       <div class="app_cart">
       <div class="cart_text">我的购物车</div>
       <hr>
        <div class="ml-3">
            全选<input type="checkbox">
        </div>
          <!-- 购物车商品信息 -->
        <div v-for="(item,i) of list" :key="i" class="cart-item ml-3">
           <div class="leftImgText"  :data-id="item.id">
               <input type="checkbox" >
               <img class="ml-3" @click="delItem"  :src="`http://127.0.0.1:5050/${item.img_url}`" :data-id="item.id">
               <div  @click="delItem" class="title ml-3" :data-id="item.id">{{item.title}}</div>
               <div @click="delItem" class="price1 ml-5" :data-id="item.id">￥{{(item.price*item.count).toFixed(2)}}</div>
              <span class="cn1 ml-5" :data-lid="item.lid" data-num="-1" @click="update"  :data-count="item.count" >-</span>
              <input class="count" type="text" :value="item.count">
              <span  :data-lid="item.lid" data-num="1" @click="update" :data-count="item.count">+</span>
              <button class="ml-5"  @click="delItem" :data-id="item.id" :data-count="item.count">删除</button>
           </div>  
            
        </div>
        <div class="total">
            <div class="cot">
               <div class="del">删除选中的商品</div>
               <div class="clear">
                  清空购物车 
               </div>
            </div>
            <div class="price">
              <div class="total_price">总价￥{{total.toFixed(2)}}</div>
              <button class="pay" @click="toPay">去结算</button>
            </div>
        </div>
      </div>
         <my-footer/>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[],
            total:0  
        }
    },
    methods:{
        // 结算
        toPay(){
          this.$router.push("/toPay")
        },
       update(e){    
        
        var lid=e.target.dataset.lid;
        var num=e.target.dataset.num;
        var count=e.target.dataset.count;
       //获取请求url
        var url="api/update"
        // 请求参数
       
        var obj={num,lid}
        this.axios.get(url,{params:obj}).then(result=>{ 
            //  console.log(result)
           if(result.data.code==1){
              
               if(num==1){
                // 修改共享购物车中数量值
                 this.$store.commit("increment"); 
               }else if(num==-1){
                     console.log(count)
                   if(count==0){
                       e.target.disabled=true;
                   }else {
                         // 修改共享购物车中数量值
                      this.$store.commit("unincrement");
                   }
                  
               }  
                this.loadMore();
             }
        })
       }, 
        // 删除功能
       delItem(e){
         //获取当前商品的id
         var id=e.target.dataset.id;
         var count=e.target.dataset.count;
         //获取请求url
         var url="api/delete"
        // 请求参数
        var obj={id:id}
        this.$confirm('您确定删除吗？')
        // 确认删除
        .then(action=>{
            this.axios.get(url,{params:obj}).then(result=>{
            //    this.$store.commit("subduction");
               this.loadMore();
            })
        })
        // 确认取消
        .catch(err=>{
            throw err;
        })  
       },
    loadMore(){
            // 加载购物车中的数据
            // 当组件创建成功后调用
            // 请求服务器地址
        var url="api/cart";
       
        this.axios.get(url).then(result=>{
            if(result.data.code==-1){
               this.$messagebox("请登录")
                this.$router.push("/Login");
                return;
            } 
            var list=result.data.data;
            console.log(list)
            // 加载之前先清空
            this.$store.commit("clear");
            // 先添加cb属性再赋值list 
            for (var item of list){
                item.cb=false;
                // 修改共享购物车中数量值
                // this.$store.commit("increment");
                this.$store.commit('addductio', item.count)
                this.total+=item.price*item.count;
            }
            // 保存购物车数据
            this.list=list;
            // console.log(list)
           
        })
        }
    },
    created(){
        this.loadMore();
    }
}
</script>
<style scoped>


/* 购物车头部加主体内容 */
hr{
     background:rgb(9, 170, 130);
     margin:0;
}
.cart_text{
    width:13rem;
    height:2rem;
    background:rgb(9, 170, 130);
    border-radius: 5%;
    border-top-right-radius: 50%;
    color:#fff;
    text-align: center;
    font-weight: bolder;
}
.cart-item{
    width:100%;
    height:5rem;
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
.title{
    width:20rem;
    height:100%;
}
.price1{
    width:10rem;
    height:100%;
    color:red;
    
    
}
.count{
    width:25px;
    height:26px;
    text-align: center;  
}
span{
    padding:0px 3px;
    border:1px solid #BBBBBB;
 
}
.cn1{
       margin-left:30px;
       padding:0px 5px;
}
button{
    width:5rem;
    border-radius: 5%;
    color:#fff;
    border:0;
    outline: 0;
    background:rgb(2, 167, 125);
}
/* 左侧图片与文字 */
/* 单独修改图片高度与宽度 */
/* 商品价格 */
/* 购物车底部结算部分 */
.total{
    width:100%;
    height:5rem;
    background:#eee;
    display:flex;
    justify-content:space-between;
    align-items: center;
    font-size:14px;
    margin-top:1rem;
}
.cot{
    width:50%;
    display:flex;
    margin-left:3rem;
}
.del{
    margin-right:6rem;
}
.price{
    width:50%;
    display:flex;
    align-items: center;
    font-size:20px;
    font-weight: bolder;
    margin-left:5rem;
    color:red;
}
.total_price{
    margin-right:2rem;
}
.pay{
    width:6rem;
    height:3rem;
}
</style>

