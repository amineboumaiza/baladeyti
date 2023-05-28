<template>
  <div>
    <div class="wrapper">
      <a href="#" class="accept button" @click="handleTraiter(this.ticketEncours.id)"
        >SUIVANT <img src="../assets/check.svg" class="check"
      ></a>
      <span class="digit ">{{ this.ticketEncours.num }}</span>
      <a href="#" class="deny button" @click="handleAnnuler(this.ticketEncours.id)">ANNULER
         <img src="../assets/close.svg" class="close" ></a>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  
    name : "QueuePage",
    data() {
    return {
      ticketEncours : {}
      
    };
  },

  methods :{
    async getTicketEnCours(){
      const response = await axios.get("http://localhost:8080/tickets/employe/enCours")
      this.ticketEncours = response.data;
      console.log(response)
    },
     async handleAnnuler(id){
        const response = await axios.put("http://localhost:8080/tickets/update/annuler/"+id)
        this.getTicketEnCours();
        console.log(response) 
    },

    async handleTraiter(id){
        const response = await axios.put("http://localhost:8080/tickets/update/traite/"+id)
        this.getTicketEnCours();
        console.log(response) 
    }
  },

  mounted(){
    this.getTicketEnCours()
  },

}
</script>

<style scoped>
body {
  background-color: #d4adfc;
}
* {
  padding: 0;
  margin: 0;
}
.digit {

  border: 10px solid #5c469c; 
  border-radius: 20px;
  display: inline-block;
  font-size: 200px;
  color: #5c469c;
  padding: 25px;
  line-height: 1;
}
.wrapper {
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin: 0;
  padding: 0;
}

a {
  text-decoration: none;
}
.accept,
.deny {
  display: flex;
  justify-content: space-around;
  align-items: center;
  gap: 10px;

}

.accept {
  color: #fff;
  background: #249f42;
  border-radius: 10px;
  padding: 15px 20px;
  box-shadow: 0 4px 0 0 #20923d;
}
.accept:hover {
  background: #27ad48;
  box-shadow: 0 4px 0 0 #20923d;
}
.deny {
  color: #fff;
  background: #e5325c;
  border-radius: 10px;
  padding: 15px 20px;
  box-shadow: 0 4px 0 0 #e91f4e;
}
.deny:hover {
  background: #cf3d5f;
  box-shadow: 0 4px 0 0 #e91f4e;
}

.check,
.close {
  width: 20px;
  filter: invert(100%) sepia(0%) saturate(0%) hue-rotate(123deg)
    brightness(101%) contrast(105%);
}
.button:active {
  box-shadow: 0 5px #8f8f8f;
  transform: translateY(4px);
}

</style>