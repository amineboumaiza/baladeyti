<template>
  <div>

     <div v-if="!user">
      <UserLoginForm />
    </div>
   
  <div class="col-md-10 container-fluid row" v-if="type_client">
    <div class="col-md-6 div1 text-center">
      <br><br><br><br><br><br><br><br>
      <span class="span1">Bienvenue !</span><br>
      <span class="span2">Veuillez reserver une ticket ici</span>
      <div>

      </div>
    </div>
    <div class="col-md-6 div2 text-center">
      <div class="container text-center">
        <br>
      <h1>Réserver une ticket</h1> <br>
      <form @submit.prevent="handleSubmit" method="post">
        <div class="form-group">
           <select class="form-control"
           v-model="selectedGovernorate" @change="getMunicipalities">
            <option value="">Choisir votre gouvernot</option>
            <option v-for="governorate in this.governorates" :value="governorate.idGouvernorat" :key="governorate.idGouvernorat">
              {{ governorate.name }}
            </option>
          </select><br>
        </div>
        
        <div class="form-group">
          <select class="form-control" 
         v-model="selectedMunicipality" @change="logging">
          <option value="">Choisir votre municipalité</option>
          <option v-for="municipality in this.municipalities" :value="municipality.id " :key="municipality.id">
            {{ municipality.nom }}
          </option>
        </select><br>
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
        
        <button class="btn reserver"> Reserver</button>
      </form>
    </div>
    </div>
  
</div>


</div>
</template>

<script>
import axios from 'axios';
import UserLoginForm from './UserLoginForm.vue'

export default {
  name : "AddTicket",
  components : {
    UserLoginForm,
  },
  data() {
    return {
      FormValues:{
        idService :0,
        idMunicipalite :0
            }, 
      selectedService:'',
      selectedMunicipality: '',
      selectedGovernorate: '',
      governorates: [],
      municipalities: [],
      services : [],
    };
  },
  methods: {
     //get all gouvernorats
     async getGovernorates() {
     
      try {
        const response = await axios.get("http://localhost:8080/gouvernorat/all");

        
        this.governorates = response.data;

        }
        catch(e){
          console.log(e);
        }
    },
    //municipality by gouvernorat
    getMunicipalities() {
       if (this.selectedGovernorate) {
        
      const url = `http://localhost:8080/municipalite/gouvernorat/id/${this.selectedGovernorate}`;

      axios.get(url)
        .then(response => {
          
          this.municipalities = response.data;
        })
        .catch(e => {
          console.error(e);
        });
    } else {
      this.municipalities = [];
    }
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



     async handleSubmit(){
        
        try {

        this.FormValues.idService = this.selectedService;
        this.FormValues.idMunicipalite = this.selectedMunicipality;
        
        const response = await axios.post("http://localhost:8080/tickets/reserve",this.FormValues);
        
        console.log(response);

        this.$router.push({name : "TodayTickets"});
        } 
        catch(e){
          console.log(e);
        }
      },

  },
  mounted() {
    this.getGovernorates();
    this.getServices();
    
  },
   computed:{
        user(){
        return this.$store.state.user;
      },

      type_admin(){
        return this.$store.state.type_admin;
      },

      type_emp(){
        return this.$store.state.type_emp;
      },

      type_client(){
        return this.$store.state.type_client;
      },
    }
  
};
</script>


<style scoped>

.container-fluid{
    position: relative;
    bottom: 120px;
    left: 100px;
    height: 380px;
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
    font-size: 35px;
    font-family: Century Gothic;

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

</style>