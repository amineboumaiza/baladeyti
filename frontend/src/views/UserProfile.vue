<template>

<div class="container-fluid">
            <div v-if="user" class=" col-md-6 card">
                <div class="row">
                    <div class="col-3">
                <img src="../assets/profile.png" class="card-img-top" >
                <h5 class="ms-5">{{infos.id}}</h5>
            </div>
            <div class="col-9">
                <div class="card-body info">
                    <h6>Nom : {{infos.nom}}</h6>
                    <h6>Prenom : {{infos.prenom}}</h6>
                    <h6>Email : {{infos.email}}</h6>
                    <div class="d-flex justify-content-end">
                    <a href="#" class="btn btn-outline-secondary" @click="handleModifier(infos)" >Modifier</a> 
                     </div>
                </div>
            </div>
            </div>
        </div>

      
      <div class="form-fluid col-6 text-center">
      
      <h1>Modifier vos informations</h1> <br>
      <form @submit.prevent="handleUpdate" method="post">

         <div class="form-group">
          <input hidden class="form-control" required placeholder="id" type="text" name="id" id="id" v-model.trim="ModifFormValues.id"><br>
        </div>

        <div class="form-group">
          <input class="form-control" required placeholder="Nom" type="text" name="nom" id="nom" v-model.trim="ModifFormValues.nom"><br>
        </div>
        
        <div class="form-group">
          <input class="form-control" required placeholder="Prenom" type="text" name="prenom" id="prenom" v-model.trim="ModifFormValues.prenom"><br>
        </div>

        <button class="btn ajouter" @click="handleUpdate()">Modifier</button>
        <a class="btn ms-2 btn-outline-warning reset" @click="reset()">Reset</a>
      </form>
    </div>
    

    <div v-if="!user" class="not-logged-in">
      You Should Log in To see <span>The infos</span> 
    </div> 
</div>
</template>

<script>
import axios from 'axios'
export default {
    name : "UserProfile",
    data(){
        return{
            infos : {},
            
            ModifFormValues: {
                id:'',
                nom: "",
                prenom:"",
            }
            
        }
    },
    methods : {
        getInfos(){
            axios.get("http://localhost:8080/profile")
            .then((res) => {
               console.log(res.data)
               this.infos = res.data
            }).catch((err) => {
                console.error(err)
            });
        },

         handleModifier(infos){
            this.ModifFormValues.id = infos.id;
            this.ModifFormValues.nom = infos.nom;
            this.ModifFormValues.prenom = infos.prenom;
            
        },

          reset(){
            this.ModifFormValues.id = '';
            this.ModifFormValues.nom = '';
            this.ModifFormValues.prenom = '';
            
        },

    async handleUpdate() {

      const response = await axios.put("http://localhost:8080/profile/update",this.ModifFormValues)
      
      this.getInfos();
      this.reset();
      console.log(response);
        
    },
    } ,
 
    mounted (){
         this.getInfos()
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

  .card{
    position: absolute;
    top: 20%;
    left: 350px;
  }

  .form-fluid{
    position: absolute;
    top: 40%;
    left: 350px;
    border-radius: 15px;
    border: 1px solid #d4d4d4;
    background-color: white;
    padding: 20px;
    width: 685px;
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

.reset{
  border-radius: 115px;
  width: 153px;
  height: 52px;
  padding: 0.5rem 1rem;
  font-size: 19px;
  font-family: Century Gothic;
}

.reset:hover{
  color : white;
  transition: 0.5s;
}

img{
    width: 100px;
    height: 100px;
    margin: 10px;
    border-radius: 50%;
    
}

</style>