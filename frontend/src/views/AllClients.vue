<template>
<div class="container-fluid">
<div class="d-flex align-items-center row">

    <div class="col-md-1"></div>
        <div class="col-md-5">

        <div class="clients" v-if="user_t=='ROLE_ADMIN'">
            <div class=" mt-3 card" v-for="client in this.clients" :key="client.id">
                <div class="row">
                    <div class="col-3 d-flex flex-column justify-content-center align-items-center">
                <img src="../assets/client.png" class="card-img-top" >
                <h5 class="">{{client.id}}</h5>
            </div>
            <div class="col-9">
                <div class="card-body employe">
                    
                    <h6>Nom : {{client.nom}}</h6>
                    <h6>Prenom : {{client.prenom}}</h6>
                    <h6>Email : {{client.email}}</h6>
                    <h6>Ville : {{client.adresse.ville}}</h6>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div>
    </div>

    <div v-if="!user" class="not-logged-in">
      You Should Log in To see <span>The Tickets</span> 
    </div> 
</div>
</template>

<script>
import axios from 'axios'
export default {
    name : "AllClients",
    data(){
        return{
            clients : [],
        }
    },
    methods : {
        getClients(){
            axios.get("http://localhost:8080/personne/client")
            .then((res) => {
               console.log(res.data)
               this.clients = res.data
            }).catch((err) => {
                console.error(err)
            });
        },   
    } ,
    mounted (){
         this.getClients()
    },

    computed:{
        user(){
          return this.$store.state.user;
        },
        user_t(){
          return this.$store.state.user_t;
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
    width: 70px;
    margin: 10px;
    border-radius: 20%;
    
}

.hidden{
    display: none;
}

.card:hover{
    transition: 0.2s;
    transform: scale(1.02);
    
}


</style>