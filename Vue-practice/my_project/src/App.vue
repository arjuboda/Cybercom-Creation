<!-- <template>-->
  <!-- <SignupForm id="confirmLabel"/> -->
  <!-- <img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>-->
    <!-- <AboutUs/>  -->
    <!-- <componentC/> -->

    <!-- <cardComponent></cardComponent> -->
    <!-- <cardComponent content="this is content prop"><p>this is slot</p><h1>this is h1</h1></cardComponent> -->
    <!-- <cardComponent content="this is content prop"></cardComponent> -->
    <!-- <cardComponent >
      <template v-slot:header>
        <h1 >this is header componnet</h1>
      </template>
      <h2>card content</h2>
      <template v-slot:footer>
        <h1 >this is footer componnet</h1>
      </template>
      <p>
        text for card content without slot name
      </p>
    </cardComponent> -->
    <!-- <cardComponent>
      <template v-slot:default="slotProps">
        <h1>this is {{ slotProps.uname }}</h1>
      </template>
    </cardComponent> -->
<!-- 

    <button @click="isActive='tabA'">TabA</button>
    <button @click="isActive='tabB'">TabB</button>
    <button @click="isActive='tabC'">TabC</button>
    <button @click="isActive='HelloWorld'">HelloWorld</button>
    <button @click="isActive='signupForm'">SignupForm</button>
    <button @click="isActive='AboutUs'">AboutUs</button>
    <button @click="isActive='parentComponent'">lifecycle Hooks</button><br/><br/> -->
    
    <!-- <tabA v-if="isActive=='tabA'"/>
    <tabB v-if="isActive=='tabB'"/>
    <tabC v-if="isActive=='tabC'"/> -->

    <!-- <keep-alive>
      <component :is="isActive"></component>
    </keep-alive> -->
<!--
    <parenComponent/>

</template>

<script>

// import TabA from './components/tabA.vue';
// import TabB from './components/tabB.vue';
// import TabC from './components/tabC.vue';
// import txtInputField from './components/txtInputField.vue';
// import HelloWorld from './components/HelloWorld.vue';
// import SignupForm from './components/SignupForm.vue';
// import cardComponent from './components/card.vue';
// import AboutUs from './components/AboutUs.vue';
// import componentC from './components/componentC.vue';

// import parentComponent from './components/parenComponent.vue';

export default {
  name: 'App',
  components: {
    // HelloWorld,
    // SignupForm,
    // AboutUs,
    // componentC,
    // cardComponent,
    // TabA,
    // TabB,
    // TabC,
    // parentComponent,txtInputField
    ToDoList
  },
  data(){
    return {
      name:'abc',
      isActive:'tabA'
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
</style> -->

<template>
    <toDoList/>
</template>
 
 <script>
 import toDoList from './components/toDoList.vue';
 
  export default {
    components:{
      toDoList
    }
  }
 </script>
 
 <style lang="scss" scoped>
 
 </style>