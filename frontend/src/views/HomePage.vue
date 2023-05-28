<template>
    <div class="container">


        <div class="d-flex flex-column align-items-center">
             <h1>Bienvenue dans notre Plateforme <span>Baladeyti</span></h1>
        </div>

        <div>
            <router-link to="/addTicket" v-if="!user || type_client">
                <button class="btn reserver">Reserver maintenant</button>
            </router-link>
        </div>
        
    </div>

</template>

<script>
export default {
    name : "HomePage",
    data() {
    return {
      hasRefreshed: false
    };
  },

    computed : {
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
      },
       mounted() {
       if(!window.location.hash) {
          window.location = window.location + '#loaded';
          window.location.reload();
        }
       }
}
</script>



<style scoped>
h1{
    position: relative;
    bottom: 50px;
    text-align: center;
    font-weight: bolder;
    font-family: Century Gothic;
    font-size: 55px;
}

span{
    font-family: Brush Script MT;
    font-size: 90px;
    color:#9e3ffd;
}


.reserver{
  border-color: #9e3ffd;
  color:white;
  background-color: #9e3ffd;
  border-radius: 115px;
  width: 250px;
  height: 52px;
  padding: 0.5rem 1rem;
  font-size: 18px;
  font-family: Century Gothic;
  position: relative;
  left : 430px;
}

.reserver:hover{
  border-color: #16012c;
  background-color: #16012c;
  color : #ffffff;
  transition: 0.5s;
}

</style>