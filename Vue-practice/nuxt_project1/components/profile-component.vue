<template>
    <div>
        <div v-if="userDetails" :class="addclasses">
            <h2>User Profile</h2>
            <p>Email: {{ userDetails.email }}</p>
            <p>Password: {{ userDetails.password }}</p>
            <p>Technologies: {{ userDetails.technologies }}</p>
            <p>Gender: {{ userDetails.gender }}</p>
        </div>
        <div v-else><p>User details not available</p></div>
        <button v-on:click="changebackground">Change background</button>
    </div>
</template>

<script>
export default {
    props: {
        userDetails: Object
    },
    data(){
        return{
            colourfull:false
        }
    },
    computed:{
        changebackground(){
            this.colourfull=!this.colourfull;
        },
        addclasses(){
            return{
                mainContainer:this.colourfull,
                fontformate:this.colourfull
            }
        }
    },
    watch:{
        colourfull(){
            alert('value changed');
        }
    }
}
</script>


<style scoped>
.mainContainer{
    background-color: #ffd;
}
.fontformate{
    font-size: 15px;
    color: blue;
}
</style>


<!-- 
<template>
    <div v-if="userDetails">
      <h2>User Profile</h2>
      <p>Email: {{ userDetails.email }}</p>
      <p>Password: {{ userDetails.password }}</p>
      <p>Technologies: {{ userDetails.technologies }}</p>
      <p>Gender: {{ userDetails.gender }}</p>
    </div>
    <div v-else>
      <p>User details not available</p>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      userDetails: Object
    }
  }
  </script>
   -->