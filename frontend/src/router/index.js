import { createRouter, createWebHistory } from 'vue-router'
import HomePage from '../views/HomePage.vue'
import UserRegisterForm from '../views/UserRegisterForm.vue'
import UserLoginForm from '../views/UserLoginForm.vue'
import AddTicket from '../views/AddTicket.vue'
import MyTickets from '../views/MyTickets.vue'
import TodayTickets from '../views/TodayTickets.vue'
import AllTickets from '../views/AllTickets.vue'
import AllClients from '../views/AllClients.vue'
import AllEmployes from '../views/AllEmployes.vue'

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
  {
    path: '/mytickets',
    name: 'MyTickets',
    component: MyTickets,
  },
  {
    path: '/todaytickets',
    name: 'TodayTickets',
    component: TodayTickets,
  },
   {
    path: '/alltickets',
    name: 'AllTickets',
    component: AllTickets,
  },
   {
    path: '/allclients',
    name: 'AllClients',
    component: AllClients,
  },

    {
    path: '/allemployes',
    name: 'AllEmployes',
    component: AllEmployes,
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
