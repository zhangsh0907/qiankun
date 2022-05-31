/*
 * @Description:
 * @Author: lishifeng
 * @Date: 2022-01-26 15:14:48
 * @LastEditors: zhangsh0907 44243174@qq.com
 * @LastEditTime: 2022-05-31 15:08:43
 */
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/home'
  },
  {
    path: '/home',
    name: 'home',
    redirect: '/home/main-app',
    component: () => import('@/views/Home'),
    children: [
      {
        path: 'main-app',
        component: () =>
          import(/* webpackChunkName: "main-app" */ '@/views/main-app')
      }
    ]
  },
  {
    // 因为子应用渲染在 home 路由下, 故这里加上 /home/*
    path: '/home/*',
    name: 'home',
    component: () => import('@/views/Home')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import(/* webpackChunkName: "login" */ '@/views/login')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
