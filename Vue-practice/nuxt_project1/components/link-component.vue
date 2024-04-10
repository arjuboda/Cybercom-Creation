<template>
    <div>
      <a v-bind:href="url">Link</a>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        url: 'https://google.com'
      }
    }
  }
  </script>
  