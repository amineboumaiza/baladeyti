import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './vuex'
import './axios'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'



createApp(App).use(router).use(store).mount('#app')

