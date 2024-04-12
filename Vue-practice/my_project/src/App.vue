<template>
  <SignupForm/>
  <!-- <img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>-->
    <!-- <AboutUs/>  -->
    <!-- <componentC/> -->
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue';
import SignupForm from './components/SignupForm.vue';
// import AboutUs from './components/AboutUs.vue';
// import componentC from './components/componentC.vue';

export default {
  name: 'App',
  components: {
    // HelloWorld,
    SignupForm,
    // AboutUs,
    // componentC
  },
  data(){
    return {
      name:'abc'
    }
  },
  provide:{
    user:'arju'
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
