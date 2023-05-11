import { createRouter, createWebHistory } from 'vue-router'
import HomePage from '../views/HomePage.vue'
import UserRegisterForm from '../views/UserRegisterForm.vue'
import UserLoginForm from '../views/UserLoginForm.vue'
import AddTicket from '../views/AddTicket.vue'

const routes = [
  {
    path: '/',
    name: 'HomePage',
    component: HomePage,
  },
  {
    path: '/userRegister',
    name: 'UserRegisterForm',
    component: UserRegisterForm,
  },
   {
    path: '/userLogin',
    name: 'UserLoginForm',
    component: UserLoginForm,
  },
   {
    path: '/addTicket',
    name: 'AddTicket',
    component: AddTicket,
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
