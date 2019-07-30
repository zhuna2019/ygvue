import Vue from 'vue'
import App from './App.vue'
import router from './router'

import store from './store'
import axios from "axios"
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
// 引入element
 Vue.use(ElementUI)


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
