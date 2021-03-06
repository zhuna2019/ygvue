import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/Index'
import Details from './views/Details'
import Floor from './components/Index/Floor'
import Item from './components/Index/Item'
import Regist from './views/Regist'
import Login from './views/Login'
import Cart from './views/Cart'
import Products from './views/Products'
import toPay from './views/toPay'
import TopHeader from './components/TopHeader'

Vue.use(Router)

export default new Router({
  routes: [
    {path:"/", component:Index},
    {path:"/details", component:Details},
    {path:"/floor", component:Floor},
    {path:"/item", component:Item},
    {path:"/regist", component:Regist},
    {path:"/login", component:Login},
    {path:"/cart", component:Cart},
    {path:"/products/:kw", component:Products,props:true},
    {path:"/toPay", component:toPay},
    {path:"/TopHeader", component:TopHeader},
  ]
})
