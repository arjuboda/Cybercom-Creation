<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <button @click="increment">
      {{count}}
    </button>
   
  </div> 
</template>

<script>
import mixinCounter from '../mixins/counter.js'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  mixins:[mixinCounter]
}
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
