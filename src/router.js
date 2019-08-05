import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/Index'
import Details from './views/Details'
import Floor from './components/Index/Floor'
import Item from './components/Index/Item'

Vue.use(Router)

export default new Router({
  routes: [
    {path:"/", component:Index},
    {path:"/details", component:Details},
    {path:"/floor", component:Floor},
    {path:"/item", component:Item},
  ]
})
