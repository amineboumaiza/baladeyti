<template>
<div >
<section class="container" v-if="user" >
<h1>Tickets d'Aujourd'hui</h1>
  <div class="row" >
    <article class="card fl-left" v-for="ticket in tickets" :key="ticket.id">
      <section class="date">
        <time datetime="23th feb">
          <span>{{ticket.date.slice(8,10)}}</span><span>{{ticket.date.slice(5,7)}}</span>
        </time>
      </section>
      <section class="card-cont">
        <h3>{{ticket.num}}</h3>
        <div class="even-date">
         <i class="fa fa-calendar"></i>
         <time>
           <span>{{ticket.idPersonne.nom}} {{ticket.idPersonne.prenom}}</span>
           <span>{{ticket.idMunicipalite.nom}}</span>
         </time>
        </div>
        <div class="even-info">
          <i class="fa fa-map-marker"></i>
          <p>
            {{ticket.idService.nom}}
          </p>
        </div>
        <img src="../assets/annulerTicket.png" @click="handleAnnuler(ticket.id)">
        <a :id="'etat' + ticket.id" href="#">{{ticket.etat}}</a>
        
        <h5 :id="'pos' + ticket.id" class="position"></h5>
        <div hidden>{{ this.getPosition(ticket.id) }}</div>
      </section>
    </article>

  </div>
  
</section>
</div>
<br>
<br>
</template>

<script>
import axios from 'axios'
import SockJS from 'sockjs-client';
import Stomp from 'stompjs';
export default {
    name : "MyTickets",
    data(){
        return{
            tickets : [],
            position : '',
            infos : {},
        }
    },
    mounted (){
    this.getTickets();
    this.getInfos();
    // Establish a WebSocket connection using SockJS
    const socket = new SockJS("http://localhost:8080/web-socket");
    this.client = Stomp.over(socket);

    // Handle connection open event
    this.client.connect({}, (frame) => {
      console.log(frame);
      console.log("WebSocket connection established.");

      // Subscribe to the topic where messages will be received
      this.client.subscribe("/topic/queue/user/"+ this.infos.id, (message) => {
        const body = JSON.parse(message.body);
        console.log("Received message:", body);

      //  FONCTION ILLY TRAJA3LEK FL POSITION
        let pos = document.getElementById("pos"+body.idTicket);
        pos.innerHTML = "Position : "+body.pos

       if (body.pos == 0){
        let etat = document.getElementById("etat"+body.idTicket);
       etat.innerHTML = "EN COURS"
      }
      });
    });
    },
    methods : {
        getTickets(){
            axios.get("http://localhost:8080/tickets/today/enCours-enAttente")
            .then((res) => {
               this.tickets = res.data;
               console.log(res.data);
    
            }).catch((err) => {
                console.log(err)
            });
        },  
        
    async handleAnnuler(id){
        const response = await axios.put("http://localhost:8080/tickets/update/annuler/"+id)
        this.getTickets();
        console.log(response) 
       
    },

     async getPosition(id){
       const response =  await axios.get("http://localhost:8080/tickets/queue/"+id)
       console.log(response.data);
      
       let pos = document.getElementById("pos"+id);
       pos.innerHTML = "Position : "+response.data
    },

     // Send a message to the server
    sendMessage(message) {
      this.client.send("/send-message", {}, message);
    },

    getInfos(){
            axios.get("http://localhost:8080/profile")
            .then((res) => {
               console.log(res.data)
               this.infos = res.data
            }).catch((err) => {
                console.error(err)
            });
        },
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
@import url('https://fonts.googleapis.com/css?family=Oswald');




h1 {
    text-transform: uppercase;
    font-weight: 900;
    border-left: 10px solid #9e3ffd;
    padding-left: 10px;
    margin-bottom: 30px
}


.card {
    display: table-row;
    width: 49%;
    background-color: #faf9f9;
    color: #2a0230;
    margin-bottom: 10px;
    margin-right: 10px;
    font-family: 'Oswald', sans-serif;
    text-transform: uppercase;
    border-radius: 4px;
    position: relative;
}



.date {
    display: table-cell;
    width: 25%;
    position: relative;
    text-align: center;
    border-right: 2px dashed #dadde6
}

.date:before,
.date:after {
    content: "";
    display: block;
    width: 30px;
    height: 30px;
    background-color: #ffffff;
    position: absolute;
    top: -15px;
    right: -15px;
    z-index: 1;
    border-radius: 50%
}


.date time {
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%)
}

.date time span {
    display: block
}

.date time span:first-child {
    color: #2b2b2b;
    font-weight: 600;
    font-size: 250%
}


.card-cont {
    display: table-cell;
    width: 75%;
    font-size: 85%;
    padding: 10px 10px 30px 50px
}


.card-cont .even-date i,
.card-cont .even-info i,
.card-cont .even-date time,
.card-cont .even-info p {
    display: table-cell
}

.card-cont .even-date i,
.card-cont .even-info i {
    padding: 5% 5% 0 0
}

.card-cont .even-info p {
    padding: 30px 50px 0 0
}

.card-cont .even-date time span {
    display: block
}

.card-cont a {
    display: block;
    text-decoration: none;
    width: 80px;
    height: 30px;
    background-color: #D8DDE0;
    color: #ffffff;
    text-align: center;
    line-height: 30px;
    border-radius: 2px;
    position: absolute;
    right: 10px;
    bottom: 10px
}


.card-cont a {
    background-color: #faf9f9;
    color : rgb(49, 3, 47);
    border: solid 1px #9e3ffd;
}

@media screen and (max-width: 860px) {
    .card {
        display: block;
        float: none;
        width: 100%;
        margin-bottom: 10px;
        
    }
    .card+.card {
        margin-left: 0
    }
    .card-cont .even-date,
    .card-cont .even-info {
        font-size: 75%
    }
}

.container{
    position: absolute;
    top: 150px;
    left: 20px;
}


img{
    position: relative;
    bottom: 130px;
    left: 380px;
    width: 25px;
    height: 35px;
    cursor: pointer;
}

img:hover{
   transform: scale(1.05);
}

.position{
    font-size: 20px;
    text-align: center;
    color: rgb(69, 110, 3);
    position: relative;

}

</style>