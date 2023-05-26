<template>

    
      <div class="annuler">
        <img src="../assets/annuler.png">
      </div>

      <div class="col-3 ticket">
        <img src="../assets/ticket.png">
      </div>

      <div class="col-3 numero">
        <h1>1-1-9</h1>
      </div>

      <div class="confirmer">
        <img src="../assets/confirmer.png">
      </div>



</template>

 

<script>
export default {
    name : "HomePage",
    data() {
    return {
      
    };
  },
   
}
</script>



<style scoped>



.annuler{
    position: absolute;
    left: 65px;
    bottom: 250px;
    width: 300px;
}

.confirmer{
    position: absolute;
    right: 10px;
    bottom: 250px;
    width: 300px;
}

.ticket{
    position: absolute;
    left: 500px;
    bottom: 200px;
    width: 300px;
}

.numero{
    position: absolute;
    left: 660px;
    top: 480px;
    width: 300px;
}
.numero h1{
  color : rgb(255, 255, 255);
  font-size: 45px;
  font-weight: bolder;
  font-family: 'Courier New', Courier, monospace;
}

.ticket img{
    width: 350px;
    height: 350px;
    cursor: pointer;
}

.annuler img{
    width: 250px;
    height: 250px;
    cursor: pointer;
}

.annuler:hover{
    transform: scale(1.02);
}

.confirmer img{
    width: 250px;
    height: 250px;
    cursor: pointer;
}

.confirmer:hover{
    transform: scale(1.02);
}


</style>