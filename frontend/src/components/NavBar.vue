<template>


 <div class="container">
     <nav class="navbar">

      <a class="navbar-brand "><router-link to='/'><img src="../assets/logo.png" width="180" height="60" class="d-inline-block align-top" alt="Your Logo"></router-link> </a>

      <div class="nav-item"><router-link to='#'> Lien 1</router-link></div> 
      <div class="nav-item"><router-link to='#'>Lien 2</router-link></div> 
        
      <router-link to="/userRegister">
        <button class="btn signup">S'inscrire</button>
      </router-link>

      <router-link to="/userLogin">
        <button class="btn login">Se connecter</button>
      </router-link>
        
     </nav>
 </div>

</template>

<script>

export default {
    name : "NavBar", 
    data(){
      return{
      }
    },
    methods:{
    
    }
   
    
}
</script>

<style scoped>

.signup{
border-color: #9e3ffd;
  color:white;
  background-color: #9e3ffd;
  border-radius: 115px;
  width: 153px;
  height: 52px;
  padding: 0.5rem 1rem;
  font-size: 18px;
  font-family: Century Gothic;
}

.signup:hover{
  border-color: #9e3ffd;
  background-color: #ffffff;
  color : #9e3ffd;
  transition: 0.5s;
}

.login{
  border-color: #9e3ffd;
  color:#9e3ffd;
  background-color: #ffffff;
  border-radius: 115px;
  width: 153px;
  height: 52px;
  padding: 0.5rem 1rem;
  font-size: 18px;
  font-family: Century Gothic;
}

.login:hover{
  border-color: #ffffff;
  background-color: #9e3ffd;
  color : #ffffff;
  transition: 0.5s;
}

.nav-item a{
  text-decoration: none;
  font-size: 17px;
  color : rgb(0, 0, 0);
  font-family: Century Gothic;
}

.nav-item a:hover{
  color : #9e3ffd;
  transition: 0.5s;
}

.nav-item a:focus{
  color : #9e3ffd;
}

</style>