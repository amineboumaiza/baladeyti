<template>
  
  <div>
    <NavBar />

    <svg class="svg1" viewBox="0 0 100 20">
      <path d="M0 10 
              C 20 0, 40 20, 60 10
              C 80 0, 100 20, 120 10" 
            style="stroke: #9e3ffd; stroke-width: 0.3; fill: none;" />
    </svg>

    <svg class="svg2" viewBox="0 0 100 20">
      <path d="M0 10 
              C 20 0, 40 20, 60 10
              C 80 0, 100 20, 120 10" 
            style="stroke: #9e3ffd; stroke-width: 0.3; fill: none;" />
    </svg>

     <svg class="svg3" viewBox="0 0 100 20">
      <path d="M0 10 
              C 20 0, 40 20, 60 10
              " 
            style="stroke: #9e3ffd; stroke-width: 0.1; fill: none;" />
    </svg>

    


    <div>
      <router-view /> 
    </div>

  </div>
  
</template>

<script>
import NavBar from './components/NavBar.vue';
import axios from 'axios';

export default {
  name: 'App',
  components : {
    NavBar,
},
async created(){

      const response = await axios.get("http://localhost:8080/profile");
  
      this.$store.commit('updateUser',response.data);

      console.log(response.data);

    },
}
</script>

<style>
    body {
      
      background-size: cover;
      background-position: center center;
      background-attachment: fixed;
      background-image: linear-gradient(140deg, #fef6ff, #ffffff, #ffffff, #9e3ffd);
    }

    .svg1{
      width: 50%;
      position: absolute;
      top: 450px;
      right: 0px;
      z-index: -1;
      cursor: pointer;
    }

    .svg2{
      width: 50%;
      position: absolute;
      top: 550px;
      right: 0px;
    }
  

    
  </style>