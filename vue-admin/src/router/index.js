import Vue from 'vue'
import VueRouter from 'vue-router'
import Cookies from "js-cookie";
import HomeView from "@/views/HomeView";
import User from "@/views/user/User";
import AddUser from "@/views/user/AddUser";
import EditUser from "@/views/user/EditUser";

Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    name: 'home',
    component: HomeView,
  },
  {
    path:'/userList',
    name: 'UserList',
    component: User,
  },
  {
    path: '/addUser',
    name: 'Adduser',
    component: AddUser
  },
  {
    path: '/editUser',
    name: 'EditUser',
    component: EditUser
  },
  //  ====  Admin  ====
  {
    path: 'adminList',
    name: 'AdminList',
    component: () => import('@/views/admin/List.vue'),
  },
  {
    path: 'addAdmin',
    name: 'AddAdmin',
    component: () => import('@/views/admin/Add.vue'),
  },
  {
    path: 'editAdmin',
    name: 'EditAdmin',
    component: () => import('@/views/admin/Edit.vue'),
  },


]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// router.beforeEach((to, from, next) => {
//   if (to.path === '/login') next()
//   const admin = Cookies.get("admin")
//   if (!admin && to.path !== '/login') return next("/login")  // 强制退回到登录页面
//   // 访问 /home 的时候，并且cookie里面存在数据，这个时候我就直接放行
//   next()
// })

export default router