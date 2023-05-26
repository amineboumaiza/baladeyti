<template>
<div >
<section class="container" v-if="user" >
<h1>Today's Tickets</h1>
  <div class="row" >
    <article class="card fl-left" v-for="ticket in tickets" :key="ticket.id">
      <section class="date">
        <time datetime="23th feb">
          <span>{{ticket.date.slice(8,10)}}</span><span>{{ticket.date.slice(5,7)}}</span>
        </time>
      </section>
      <section class="card-cont">
        <h3>{{ticket.numTicket}}</h3>
        <div class="even-date">
         <i class="fa fa-calendar"></i>
         <time>
           <span>{{ticket.nomPersonne}}</span>
           <span>{{ticket.nomMunicipalite}}</span>
         </time>
        </div>
        <div class="even-info">
          <i class="fa fa-map-marker"></i>
          <p>
            {{ticket.nomService}}
          </p>
        </div>
        <a href="#">{{ticket.etat}}</a>
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
export default {
    name : "MyTickets",
    data(){
        return{
            tickets : [],
        }
    },
    methods : {
        getTickets(){
            axios.get("http://localhost:8080/tickets/today")
            .then((res) => {
               this.tickets = res.data;
               console.log(res.data);
    
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
    color : black;
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
</style>