<template>
  <div  class=" col-10 error">
            {{error}}
    </div>
</template>

<script>
export default {
    name:"ErrorMsg",
    props:['error']
}
</script>

<style scoped>


 .error{
    color: brown;
    background-color: rgb(250, 235, 235);
    
    padding: 15px;
    margin : 25px;
    border-radius: 15px;
  }

</style>