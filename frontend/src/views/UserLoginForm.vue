<template>
  <div class="col-md-10 container-fluid row">
    
    <div class="col-md-6 div1 text-center">
      <div class="container text-center">
        <br>
      
      <form @submit.prevent="handleSubmit" method="post">
          <h1>Se Connecter</h1> <br>
        <div class="form-group">
          <input class="form-control" required placeholder="Email" type="email" name="email" id="email" v-model.trim="FormValues.email"><br>
        </div>

        <div class="form-group">
          <input class="form-control" required placeholder="Password" type="password" name="password" id="password" v-model.trim="FormValues.password"><br>
        </div>

        <ErrorMsg v-if="FormValues.error" :error="FormValues.error"/>
        
        <button class="btn signup"> Soumettre</button>
      </form>
    </div>
    </div>

    <div class="col-md-6 div2 text-center">
      <br><br><br><br><br><br><br><br>
      <span class="span1">Contents de vous revoir !</span><br>
      <span class="span2">Entrez vos données personnelles et commencez à naviguer avec nous</span>
      <div>
        <router-link to="/userREgister">
          <button class="btn login">S'inscrire</button>
      </router-link>
      </div>
    </div>
  
</div>
  <ErrorMsg v-if="error" :error="error"/>
</template>

<script>
import axios from 'axios'
import Cookies from 'js-cookie';
import ErrorMsg from '../components/ErrorMsg.vue'
export default {
    name : "UserLoginForm",
    components : {
    ErrorMsg,
},
    data(){
        return {
            FormValues:{
                email : "",
                password :"",
            }, 
            error:""
        }
    },
    methods : {
      async handleSubmit(){
        
        try {
        const response = await axios.post("http://localhost:8080/api/auth/login",this.FormValues);

        const token = response.data.jwt;

        Cookies.set('jwt', token);
        
        this.$router.push({name : "HomePage"});
          
        this.$store.commit('updateUser',response.data);

        }
        catch(e){
          this.FormValues.error = "Invalid Email/Password.";
        }
      }
    },

    computed : {
      user(){
        return this.$store.state.user;
      }
    }
  
}
</script>

<style scoped>
  .container-fluid{
    position: relative;
    bottom: 120px;
    left: 100px;
    height: 500px;
  }


  .div2{
      background-image: linear-gradient(90deg,#c58efc, #9e3ffd);
      border-top-right-radius: 15px;
      border-bottom-right-radius: 15px;
  }

    .div1{
      
      background-image: linear-gradient(-90deg,#ffffff, #f8f8f8);
      border-top-left-radius: 15px;
      border-bottom-left-radius: 15px;
  }

  .span1{
    font-family: Century Gothic;
    font-size: 35px;
    font-weight: bolder;
    color: white;
    position: relative;
    bottom: 50px;
    justify-content: center;
  }

   .span2{
    font-family: Century Gothic;
    font-size: 16px;
    color: white;
    position: relative;
    bottom: 40px;
    text-align: center;
    margin: 20px;
  }



  h1{
    font-size: 40px;
    font-family: Century Gothic;
    font-weight: bold;

  }

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
  border-color: #190131;
  background-color: #190131;
  color : white;
  transition: 0.5s;
}

.login{
  border-color: #ffffff;
  color:#ffffff;
  background-color: none;
  border-radius: 115px;
  width: 153px;
  height: 52px;
  padding: 0.5rem 1rem;
  font-size: 18px;
  font-family: Century Gothic;
  text-align: center;
}

.login:hover{
   border-color: #190131;
  background-color: #190131;
  color : white;
  transition: 0.5s;
}

form{
  position: relative;
  top: 80px;
}

</style>