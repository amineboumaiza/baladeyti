<template>
  <div>
      <div v-if="user" class="container2">
        <form @submit.prevent="handleSubmit" method="post">
          <label>Gouvernorat :</label> <br> <br>

          <select class="form-select-lg col-3"
           v-model="selectedGovernorate" @change="getMunicipalities">
            <option value="">Choisir votre gouvernot</option>
            <option v-for="governorate in this.governorates" :value="governorate.idGouvernorat" :key="governorate.idGouvernorat">
              {{ governorate.name }}
            </option>
          </select>

         <br> <br> <label>Municipalité :</label> <br> <br>

         <select class="form-select-lg col-3" 
         v-model="selectedMunicipality">
          <option value="">Choisir votre municipalité</option>
          <option v-for="municipality in municipalities" :value="municipality.id_municipalite " :key="municipality.id_municipalite ">
            {{ municipality.nom_municipalite }}
          </option>
        </select> <br> <br>

      <label>Service :</label> <br> <br>

        <select class="form-select-lg col-3" 
         v-model="selectedMunicipality">
          <option value="">Choisir un service</option>
          <option v-for="municipality in municipalities" :value="municipality.id_municipalite " :key="municipality.id_municipalite ">
            {{ municipality.nom_municipalite }}
          </option>
        </select> <br> <br> <br>

    
        <button class="btn reserver"> Reserver</button>

        </form>
      </div>

      <div v-if="!user" class="container">
        <h1 class="dsl"> 
        DÉSOLÉ, 
        VOUS NE POUVEZ PAS VOIR CETTE PAGE. <br>
        VOUS DEVEZ ETRE CONNECTER.
      </h1>

       <router-link to="/userLogin">
        <button class="btn login">Se connecter</button>
      </router-link>
       
      
      </div>
      
  </div>
  
</template>

<script>
import axios from 'axios';

export default {
  name : "AddTicket",
    computed:{
        user(){
          return this.$store.state.user;
        },
    },
  data() {
    return {
      selectedGovernorate: '',
      selectedMunicipality: '',
      governorates: [],
      municipalities: []
    };
  },
  methods: {
     async getGovernorates() {
      
      try {
        const response = await axios.get("/get all gouv api");

        this.governorates = response;

        }
        catch(e){
          console.log(e);
        }
    },
    getMunicipalities() {
       if (this.selectedGovernorate) {
        //municipality by gouv name
      const url = `http://localhost:8080/municipalite/gouvernorat/${this.selectedGovernorate}`;

      axios.get(url)
        .then(response => {
          this.municipalities = response;
        })
        .catch(e => {
          console.error(e);
        });
    } else {
      this.municipalities = [];
    }
    },

     async handleSubmit(){
        
        try {
        const response = await axios.post("http://localhost:8080/tickets/reserve",{});
        
        console.log(response);
        } 
        catch(e){
          console.log(e);
        }
      }
  },
  mounted() {
    this.getGovernorates();
  } 
  
};
</script>


<style scoped>


.container{
text-align: center;
}
.dsl{
  
  font-family: cursive;
  font-weight: bold;
}

form{
  position: relative;
  bottom: 200px;
  left: 150px;

}

label{
  font-family:cursive;
  font-weight: 500;
  font-size: 22px;
}

 .reserver{
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

.reserver:hover{
  border-color: #190131;
  background-color: #190131;
  color : white;
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
  margin-top: 40px;
  cursor: pointer;
  z-index: 1;
}

.login:hover{
  border-color: #ffffff;
  background-color: #9e3ffd;
  color : #ffffff;
  transition: 0.8s;
}

</style>