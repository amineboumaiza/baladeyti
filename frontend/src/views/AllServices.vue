<template>
<div class="container-fluid">
<div class="d-flex align-items-center row">
     <div class="col-md-5 text-center ajout" id="ajout" >
      <div class="form-fluid text-center" v-if="type_admin">
      
      <h1>Créer un nouveau service</h1> <br>
      <form @submit.prevent="handleSubmit" method="post">
        <div class="form-group">
          <input class="form-control" required placeholder="Nom" type="text" name="nom" id="nom" v-model.trim="AjoutFormValues.nom"><br>
        </div>

        <ErrorMsg v-if="AjoutFormValues.error" :error="AjoutFormValues.error"/>
        
        <button class="btn ajouter"> Ajouter</button>
      </form>
    </div>
    </div>

    <div class="col-md-5 text-center hidden" id="modif" >
      <div class="form-fluid text-center" v-if="type_admin">
      
      <h1>Modifier votre service</h1> <br>
      <form @submit.prevent="handleUpdate" method="post">

        <div class="form-group">
          <input class="form-control" required placeholder="Nom" type="text" name="nom" id="nom" v-model.trim="ModifFormValues.nom"><br>
        </div>

        <ErrorMsg v-if="ModifFormValues.error" :error="ModifFormValues.error"/>
        
        <button class="btn ajouter" @click="handleUpdate()">Modifier</button>

         <a class="btn backAjout btn-warning mx-3" @click="handleAjout()"> Reset </a>
     
      </form>
    </div>
    </div>


    <div class="col-md-1"></div>
        <div class="col-md-5">

        <div class="services" v-if="type_admin">
            <div class=" mt-3 card" v-for="service in this.services" :key="service.id">
                <div class="row">
                    <div class="col-3 d-flex flex-column justify-content-center align-items-center">
                <img src="../assets/service.png" class="card-img-top" >
                <h5 class="mt-3">{{service.id}}</h5>
            </div>
            <div class="col-9">
                <div class="card-body service">
                    
                    <h6 class="mb-5">Nom : {{service.nom}}</h6>
                    
                    <div class="d-flex justify-content-end">
                    <a href="#" class="btn btn-outline-secondary" @click="handleModifier(service)" >Modifier</a> 
                    <a href="#" class="btn btn-danger ms-2" @click="handleDelete(service.id)" >Supprimer</a>
                    
                    </div>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div>
    </div>

    <div v-if="!type_admin" class="not-logged-in">
      You Should Log in To see <span>The Services</span> 
    </div> 
</div>
</template>

<script>
import axios from 'axios'
import ErrorMsg from '../components/ErrorMsg.vue'
export default {
    name : "AllServices",
    data(){
        return{
            services : [],
            AjoutFormValues: {
                nom: "",
                error:"",
            },

            ModifFormValues: {
                nom: "",
                error:"",
            }
            
        }
    },
    methods : {
        getServices(){
            axios.get("http://localhost:8080/service/all")
            .then((res) => {
               console.log(res.data)
               this.services = res.data
            }).catch((err) => {
                console.error(err)
            });
        },

         handleModifier(service){

            const AjoutDiv = document.getElementById("ajout");
            const ModifDiv = document.getElementById("modif");

            AjoutDiv.classList.add("hidden");
            ModifDiv.classList.remove("hidden");

            this.ModifFormValues.id = service.id;
            this.ModifFormValues.nom = service.nom;
            this.ModifFormValues.prenom = service.prenom;
            this.ModifFormValues.email = service.email;
            
        },

        handleAjout(){
            const AjoutDiv = document.getElementById("ajout");
            const ModifDiv = document.getElementById("modif");

            AjoutDiv.classList.remove("hidden");
            ModifDiv.classList.add("hidden");
        },

        async handleSubmit() {

              const response = await axios.post("http://localhost:8080/service/create", this.AjoutFormValues);
            
              if (response.status != 200){
                this.AjoutFormValues.error = "Invalid Informations.";
              }

              else{
                 this.getServices()
              }

              this.AjoutFormValues.nom ="";

           
        },
    async handleUpdate() {

      const response = await axios.put("http://localhost:8080/service/update/"+this.ModifFormValues.id,this.ModifFormValues)
      
      this.getServices();
      console.log(response)
      const AjoutDiv = document.getElementById("ajout");
      const ModifDiv = document.getElementById("modif");

      AjoutDiv.classList.remove("hidden");
      ModifDiv.classList.add("hidden");
        
    },
         handleDelete(id){
            axios.delete("http://localhost:8080/service/delete/"+id)
            .then((res) => {
                console.log(res.data)
                this.getServices()
            }).catch((err) => {
                console.error(err)
            });

            const AjoutDiv = document.getElementById("ajout");
            const ModifDiv = document.getElementById("modif");

            AjoutDiv.classList.remove("hidden");
            ModifDiv.classList.add("hidden");

        },
    } ,
    components: { ErrorMsg },
    mounted (){
         this.getServices()
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


.services{
    margin-bottom: 30px;
}

img{
    width: 50px;
    height: 50px;
    border-radius: 20%;
}

.hidden{
    display: none;
}


</style>