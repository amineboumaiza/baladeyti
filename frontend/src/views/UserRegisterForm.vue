<template>
  <div class="col-md-10 container-fluid row">
    <div class="col-md-6 div1 text-center">
      <br><br><br><br><br><br><br><br>
      <span class="span1">Bienvenue !</span><br>
      <span class="span2">Pour rester en contact avec nous, veuillez vous connecter avec vos informations personnelles</span>
      <div>
        <router-link to="/userLogin">
        <button class="btn login">Se connecter</button>
      </router-link>
      </div>
    </div>
    <div class="col-md-6 div2 text-center">
      <div class="container text-center">
        <br>
      <h1>Créer un nouveau compte</h1> <br>
      <form @submit.prevent="handleSubmit" method="post">
        <div class="form-group">
          <input class="form-control" required placeholder="Nom" type="text" name="nom" id="nom" v-model.trim="FormValues.nom"><br>
        </div>
        
        <div class="form-group">
          <input class="form-control" required placeholder="Prenom" type="text" name="prenom" id="prenom" v-model.trim="FormValues.prenom"><br>
        </div>

        <div class="form-group">
          <input class="form-control" required placeholder="Matricule" type="text" name="matricule" id="matricule" v-model.trim="FormValues.matricule"><br>
        </div>


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
  
</div>
  <ErrorMsg v-if="FormValues.error" :error="FormValues.error"/>
</template>

<script>
import axios from 'axios'
import ErrorMsg from '../components/ErrorMsg.vue'
export default {
    name: "UserRegisterForm",
    data() {
        return {
            FormValues: {
                nom: "",
                prenom:"",
                matricule:"",
                adresse:"",
                email: "",
                password: "",
                error:"",
            }
        };
    },
    methods: {
        async handleSubmit() {

              const response = await axios.post("http://localhost:8080/api/auth/signup/client", this.FormValues);

              if (response.status == 200){
                this.$router.push({ name: "UserLoginForm" });
              }

              else{
                this.FormValues.error = "Invalid Informations.";
                
              } 
         
           
        }
    },
    components: { ErrorMsg }
}
</script>

<style scoped>
  .container-fluid{
    position: relative;
    bottom: 120px;
    left: 100px;
    height: 500px;
  }


  .div1{
      background-image: linear-gradient(-90deg,#c58efc, #9e3ffd);
      border-top-left-radius: 15px;
      border-bottom-left-radius: 15px;
  }

  .span1{
    font-family: Century Gothic;
    font-size: 45px;
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

  .div2{
      
      background-image: linear-gradient(90deg,#ffffff, #f8f8f8);
      border-top-right-radius: 15px;
      border-bottom-right-radius: 15px;
  }

  h1{
    font-size: 30px;
    font-family: Century Gothic;

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




</style>