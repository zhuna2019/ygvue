<template>
    <div class="container">
        <my-header></my-header>
        
       <main id="main" class="container">
          <carousel/>
         
         
       </main>




        
        <my-footer/>
    </div>
</template>

<script>
// 引入轮播子件到首页父件
import Carousel from "../components/Carousel"
export default {
    data(){
        return{}
    },
   components:{Carousel},
    created(){
   this.axios.get(//异步: mounted才不会等ajax请求回来！
      "http://localhost:5050/index"
    ).then(result=>{
    
    })
  },
  
}
</script>