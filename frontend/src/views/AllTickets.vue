<template>
<div>

    <div v-if="user_t=='ROLE_ADMIN'" class="tickets">
        <div v-for="ticket in this.tickets" :key="ticket.numTicket" class="ticket">
            <h4>{{ticket.numTicket}}</h4>
            <h4>{{ticket.nomPersonne}}</h4>
            <h4>{{ticket.nomService}}</h4>
            <h4>{{ticket.nomMunicipalite}}</h4>
            <h4>{{ticket.date}}</h4>
            <h4>{{ticket.etat}}</h4>

            
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
    name : "AllTickets",
    data(){
        return{
            tickets : [],
            
        }
    },
    methods : {
        getTickets(){
            axios.get("http://localhost:8080/tickets/all")
            .then((res) => {
               console.log(res.data)
               this.tickets = res.data
            }).catch((err) => {
                console.error(err)
            });
        },

    } , 
    mounted (){
         this.getTickets()
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
.tickets {
    display: flex;
    flex-wrap: wrap;
    position: absolute;
    top: 100px;
    left : 70px;
   

}

.ticket {
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

.ticket:hover {
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