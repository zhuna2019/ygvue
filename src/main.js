import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Vuex from "vuex"
import axios from "axios"
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

// 6配置axios基础路径
 axios.defaults.baseURL="http://127.0.0.1:5050/"
 // 7配置axios 保存session信息
 axios.defaults.withCredentials=true
// 引入element
 import ElementUI from 'element-ui'
 

 import 'element-ui/lib/theme-chalk/index.css'
//  把加入购物车部分做成全局组件
 import AddCart from  './components/AddCart'
 Vue.component("my-add",AddCart);
 //  把页面头部公用区域做成全局组件
import MyHeader from  './components/MyHeader'
Vue.component("my-header",MyHeader);
//  把页面底部公用区域做成全局组件
import Footer from  './components/Footer'
Vue.component("my-footer",Footer);

Vue.config.productionTip = false
Vue.prototype.axios=axios
// 先注册vuex 再创建实例对象
Vue.use(Vuex)
var store = new Vuex.Store({
  state:{cartCount:0},
  mutations:{
    increment(state){
      state.cartCount++;
    },
    unincrement(state){
      state.cartCount--;
    },
    clear(state){
      state.cartCount=0;
    }
  },
  getters:{//添加获取数据函数
    getCartCount(state){
      return state.cartCount;
    }

  },
  actions:{}
});

// 引入element
 Vue.use(ElementUI)


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
