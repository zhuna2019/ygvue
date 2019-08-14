<template>
    <div>
       
        <div id="main" class="container">
            <my-header></my-header>
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
            <div class="plist " >
              
                <div class="products" v-for="(item,i) of plist" :key="i" >
                     <!-- 上面图片 -->
                    <div class="top">
                        <img :src="`http://127.0.0.1:5050/${item.img_url}`" >
                        <button @click="addcart" :data-lid="item.lid" :data-price="item.price" :data-title="item.title" :data-img="item.img_url">加入购物车</button>
                    </div>
            
                  <!-- 下面标题 -->
                    <div class="title">
                    {{item.title}}
                    </div>
                     <!-- 单价 -->
                    <div class="price">
                     ￥{{item.price.toFixed(2)}}
                     </div>
                </div>
            </div>
            <!-- 分页 -->
            <div class="block">
          
               <el-pagination
                 layout="total,  prev, pager, next, jumper"
                 :total="total">
               </el-pagination>
            </div>
        </div>
    </div>
</template>
<script>
import Item from "../components/Index/Item"
export default {
    data(){
        return{
            //将result.data数组保存到data当中供模板显示
           plist:[], 
           total:0,
           pno:0,  
        }
    },
    props:["kw"],
    watch:{
        "$route"(){
            this.load();
        }
    },
    methods:{
        load(){
            var url="http://localhost:5050/api/products"
            this.axios.get(url,{params:{kw:this.kw}}).then(res=>{
                console.log(res.data)
                this.plist=res.data.data;
                this.total=res.data.count;
                

               
            })
        },
        addcart(e){
          // 1获取参数
             var pid=e.target.dataset.lid;
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
     created(){
        this.load();
    },

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
    padding-left:0;
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
.plist{
    width:100%;
    display:flex;
    flex-wrap: wrap;
    background:rgba(243, 243, 243, 0.829);
    font-size:12px;
}
.products{
    background:#fff;
    margin-right:0.83rem;
   margin-bottom:0.83rem;
    
}
.top{
    position:relative;
  
}
.products img{
    width:16.51rem;
    height:16.5rem;
   
}

button{
  position:absolute;
  width:8rem;
  display:none;
  height:1.2rem;
  font-size:12px;
   color:#fff;
   background:forestgreen;
   line-height: 1.2rem;
   border-radius: 6%;
   outline: 0;
   border:0;
   top:14.5rem;
   left:3.5rem;
   
}
.products:hover button{
    display:block;
}
.price{
    font-weight: bolder;
    color:red;
    font-size:14px;
}
.block{
    text-align: right;                                                                                                                                         
}

</style>>