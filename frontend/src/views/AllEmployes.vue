<template>
<div class="container-fluid">
<div class="d-flex align-items-center row">
     <div class="col-md-5 text-center ajout" id="ajout" >
      <div class="form-fluid text-center" v-if="type_admin">
      
      <h1>Créer un nouveau employé</h1> <br>
      <form @submit.prevent="handleSubmit" method="post" >
        <div class="form-group">
          <input class="form-control" required placeholder="Nom" type="text" name="nom" id="nom" v-model.trim="AjoutFormValues.personne.nom"><br>
        </div>
        
        <div class="form-group">
          <input class="form-control" required placeholder="Prenom" type="text" name="prenom" id="prenom" v-model.trim="AjoutFormValues.personne.prenom"><br>
        </div>


        <div class="form-group">
          <input class="form-control" required placeholder="Email" type="email" name="email" id="email" v-model.trim="AjoutFormValues.personne.email"><br>
        </div>

        <div class="form-group">
          <input class="form-control" required placeholder="Password" type="password" name="password" id="password" v-model.trim="AjoutFormValues.personne.password"><br>
        </div>

        <div class="form-group">
          <select class="form-control" 
         v-model="selectedService" @change="logging">
          <option value="">Choisir un service</option>
          <option v-for="service in this.services" :value="service.id " :key="service.id ">
            {{ service.nom }}
          </option>
        </select><br>
        </div>

        <ErrorMsg v-if="AjoutFormValues.error" :error="AjoutFormValues.error"/>
        
        <button class="btn ajouter"> Ajouter</button>
      </form>
    </div>
    </div>

    <div class="col-md-5 text-center hidden" id="modif" >
      <div class="form-fluid text-center">
      
      <h1>Modifier votre employé</h1> <br>
      <form @submit.prevent="handleUpdate" method="post">

        <div class="form-group">
          <input class="form-control" required placeholder="Nom" type="text" name="nom" id="nom" v-model.trim="ModifFormValues.nom"><br>
        </div>
        
        <div class="form-group">
          <input class="form-control" required placeholder="Prenom" type="text" name="prenom" id="prenom" v-model.trim="ModifFormValues.prenom"><br>
        </div>

        <div class="form-group">
          <input class="form-control" required placeholder="Email" type="email" name="email" id="email" v-model.trim="ModifFormValues.email"><br>
        </div>


        <ErrorMsg v-if="ModifFormValues.error" :error="ModifFormValues.error"/>
        
        <button class="btn ajouter" @click="handleUpdate()">Modifier</button>

         <a class="btn backAjout btn-warning mx-3" @click="handleAjout()"> Reset </a>
     
      </form>
    </div>
    </div>


    <div class="col-md-1"></div>
        <div class="col-md-5">

        <div class="employes" v-if="type_admin">
            <div class=" mt-3 card" v-for="employe in this.employes" :key="employe.id">
                <div class="row">
                    <div class="col-3">
                <img src="../assets/employe.png" class="card-img-top" >
                <h5 class="ms-5">{{employe.id}}</h5>
            </div>
            <div class="col-9">
                <div class="card-body employe">
                    
                    <h6>Nom : {{employe.nom}}</h6>
                    <h6>Prenom : {{employe.prenom}}</h6>
                    <h6>Email : {{employe.email}}</h6>
                    <div class="d-flex justify-content-end">
                    <a href="#" class="btn btn-outline-secondary" @click="handleModifier(employe)" >Modifier</a> 
                    <a href="#" class="btn btn-danger ms-2" @click="handleDelete(employe.id)" >Supprimer</a>
                    
                    </div>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div>
    </div>

    <div v-if="!type_admin" class="not-logged-in">
      You Should Log in To see <span>The EMPLOYEES</span> 
    </div> 
</div>
</template>

<script>
import axios from 'axios'
import ErrorMsg from '../components/ErrorMsg.vue'
export default {
    name : "AllEmployes",
    data(){
        return{
            employes : [],
            services : [],
            selectedService:'',
           
            AjoutFormValues: {
                personne :{
                  nom: "",
                  prenom:"",
                  email: "",
                  password : "",
                },
                error:"",
                idService :0,
            },

            ModifFormValues: {
                nom: "",
                prenom:"",
                email: "",
                error:"",
            }
            
        }
    },
    methods : {
        getEmployes(){
            axios.get("http://localhost:8080/personne/employe")
            .then((res) => {
               console.log(res.data)
               this.employes = res.data
            }).catch((err) => {
                console.error(err)
            });
        },

         handleModifier(employe){

            const AjoutDiv = document.getElementById("ajout");
            const ModifDiv = document.getElementById("modif");

            AjoutDiv.classList.add("hidden");
            ModifDiv.classList.remove("hidden");

            this.ModifFormValues.id = employe.id;
            this.ModifFormValues.nom = employe.nom;
            this.ModifFormValues.prenom = employe.prenom;
            this.ModifFormValues.email = employe.email;
            
        },

        handleAjout(){
            const AjoutDiv = document.getElementById("ajout");
            const ModifDiv = document.getElementById("modif");

            AjoutDiv.classList.remove("hidden");
            ModifDiv.classList.add("hidden");
        },

        async handleSubmit() {
        
        this.AjoutFormValues.idService = this.selectedService;

        const response = await axios.post("http://localhost:8080/personne/employe/create", this.AjoutFormValues);
      
        if (response.status != 200){
          this.AjoutFormValues.error = "Invalid Informations.";
        }

        else{
          this.getEmployes()
        }

        this.AjoutFormValues.personne.nom ="";
        this.AjoutFormValues.personne.prenom ="";
        this.AjoutFormValues.personne.email ="";
        this.AjoutFormValues.personne.password ="";
        this.AjoutFormValues.idService ="";

           
        },
    async handleUpdate() {

      const response = await axios.put("http://localhost:8080/personne/update/"+this.ModifFormValues.id,this.ModifFormValues)
      
      this.getEmployes();
      console.log(response)
      const AjoutDiv = document.getElementById("ajout");
      const ModifDiv = document.getElementById("modif");

      AjoutDiv.classList.remove("hidden");
      ModifDiv.classList.add("hidden");
        
    },
         handleDelete(id){
            axios.delete("http://localhost:8080/personne/delete/"+id)
            .then((res) => {
                console.log(res.data)
                this.getEmployes()
            }).catch((err) => {
                console.error(err)
            });

            const AjoutDiv = document.getElementById("ajout");
            const ModifDiv = document.getElementById("modif");

            AjoutDiv.classList.remove("hidden");
            ModifDiv.classList.add("hidden");

        },

         async getServices() {
      
      try {
        const response = await axios.get("http://localhost:8080/service/all");

        this.services = response.data;

        }
        catch(e){
          console.log(e);
        }
    },
    } ,
    components: { ErrorMsg },
    mounted (){
         this.getEmployes();
         this.getServices();
    },

    computed:{
        user(){
          return this.$store.state.user;
        },
        type_admin(){
          return this.$store.state.type_admin;
        },
    }
}

</script>

<style scoped>

  .container-fluid{
    position: absolute;
    top: 15%;
    left: 50px;
  }

  .form-fluid{
    position: fixed;
    top: 25%;
    left: 50px;
    border-radius: 15px;
    box-shadow: 5px 5px 8px #888888;
    background-color: white;
    padding: 30px;
  }

  input{
    height: 50px;
  }

.ajouter{
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

.ajouter:hover{
  border-color: #190131;
  background-color: #190131;
  color : white;
  transition: 0.5s;
}

.backAjout{
  border-radius: 115px;
  width: 153px;
  height: 52px;
  padding: 0.5rem 1rem;
  font-size: 18px;
  font-family: Century Gothic;
}

.backAjout:hover{
  border-color: #190131;
  background-color: #190131;
  color : white;
  transition: 0.5s;
}


.employes{
    margin-bottom: 30px;
}

img{
    width: 100px;
    height: 100px;
    margin: 10px;
    border-radius: 50%;
    
}

.hidden{
    display: none;
}

.card:hover{
    transition: 0.2s;
    transform: scale(1.02);
    
}


</style>