<template>
<div class="container">
<top-header></top-header>
<!-- 顶部 -->
<div class="top">
<div class="logo">
<router-link to='/' ><img src="../../public/imgs/logo.jpg" alt=""></router-link>
</div>
<div>
<h3 class="loginText">结算</h3>
</div>
</div>
<!-- 付款主体 -->
<div class="pay_body">
<div class="check_item">
<h5>填写收件人信息</h5>
</div>
<hr>
  <div class="address">
    <div class="receiver">
        <span>收货人姓名:</span>
        <input type="text" v-model="receiver" vlaue="receiver"  placeholder="请输入收货人姓名">
    </div>
    <div class="cellphone">
        <span>手机号:</span>
        <input type="text" v-model="cellphone" value="cellphone" placeholder="请输入收货人电话">
    </div>
    <div class="city">
        <span>收货地址:</span>
        <el-cascader :options="options" clearable v-model="value" ></el-cascader>
    </div>
    <div class="detail">
        <span>详细地址:</span>
        <input type="text" v-model="address" value="address">
    </div>
    <div>
        <button @click="submit">提交</button>
    </div>
 </div> 
</div>
<my-footer/>
</div>
</template>
<style scoped>
hr{
margin:0;
padding:0;
}
.address{
width:100%;
padding:3rem;
border:1px solid #eee;
}
.receiver,.cellphone,.city,.detail{
display:flex;
align-items:center;
text-align: center;
margin-bottom:2rem;
}
span{
text-align: right;
margin-right:2rem;
}
.receiver>span{
margin-right:1rem;
}
.cellphone>input{
margin-left:1rem;
}
input{
width:20%;
height:2.5rem;
}
button{
width:30%;
height:3rem;
background:rgb(4, 151, 70);
border:0;outline: 0;
color:#fff;
font-size:20px;
border-radius: 5%; 
}

.check_item{
width:25%;
height:5%;
background:rgb(8, 153, 69); 
color:#fff;
padding:0.5rem;
border-radius:3%; 
font-size:20px;
}
.top{
width:100%;
height:5rem;
background:#eee;
display:flex;
margin-bottom:1rem;
align-items: center;
padding-left:1rem;
}
.logo{
margin-top:1rem;
}
.loginText{
color:rgb(39, 121, 46);
margin-left:10rem;
margin-top:1rem;
}

</style>
<script>
import qs from 'qs';
export default {
data(){
return {
receiver:"",
cellphone:"",
address:"",
value:"",
options: [{
            value: '杭州',
            label: '杭州',
            children: [{
            value: '余杭区',
            label: '余杭区', 
            }, {
            value: '萧山区',
            label: '萧山区',
            }, {
            value: '江干区',
            label: '江干区',
            }, {
            value: '上城区',
            label: '上城区',
            }, {
            value: '西湖区',
            label: '西湖区',
            }, {
            value: '滨江区',
            label: '滨江区',
            }, {
            value: '高新区',
            label: '高新区',
            }, {
            value: '拱墅区',
            label: '拱墅区',
            }]
        }]
   }
},
methods:{
    submit(){
         var receiver=this.receiver;
         var cellphone=this.cellphone;
         var address=this.address; 
         var county=this.value[1];
         var city=this.value[0];
         var url="api/receiver"
         var obj={receiver,cellphone,address,county,city}
        this.axios.post(url,qs.stringify(obj)).then(res=>{
            if(res.data.code==-1){
                
                this.$router.push("/Login")
            }else if(res.data.code==1){
                 this.$router.push("/")
            }
        })
        
    }
},
}
</script>