<template>
<div>

    <div v-if="user_t=='ROLE_ADMIN'" class="clients">
        <div v-for="client in this.clients" :key="client.id" class="client">
            <h4>{{client.id}}</h4>
            <h4>{{client.nom}}</h4>
            <h4>{{client.prenom}}</h4>
            <h4>{{client.email}}</h4>
            <h4>{{ client.adresse.ville }}</h4>

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
.clients {
    display: flex;
    flex-wrap: wrap;
    position: absolute;
    top: 100px;
    left : 70px;
   

}

.client {
    position: relative;
    border: 2px rgb(27, 27, 27) solid;
    border-radius: 5px;
    margin: 20px;
    width : 300px;
    height: 300px;
    text-align: center;
    padding-top: 20px;
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
}

.client:hover {
    cursor: pointer;
    background: rgb(245, 244, 244);
    transition: 0.2s;
    transform: scale(1.06);
    border: 2px solid;
    border-color: #9e3ffd;
    font-size: 16px;
    font-family: cursive;
    
}

.not-logged-in{
  font-weight:900;
  font-family:cursive;
  font-size: 45px;
  text-align: center;
  position: absolute;
  top : 270px;
  left: 100px;
}
span{
  color: #09a146;
}
</style>