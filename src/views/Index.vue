<template>
    <div class="container">
        <my-header></my-header>
        
       <main id="main" class="container">
           <carousel/> 
           <floor v-for="(elem,i) of result" :key="i" :messages="elem"></floor>
              
       </main>
       <my-footer/>
      
    </div>
</template>

<script>
// 引入轮播子件到首页父件
import Carousel from "../components/Carousel"
// 引入楼层子组件到首页父组件
import Floor from "../components/Index/Floor"
export default {
    data(){
        return{
            //将result.data数组保存到data当中供模板显示
           result:[],   
        }
    },
   components:{
       Carousel,
       Floor,
   
   },
    created(){
   this.axios.get(
      "http://localhost:5050/index"
    ).then(result=>{
        //   console.log(result.data);
          this.result=result.data;
          console.log(this.result)
    })
  },

  
}
</script>