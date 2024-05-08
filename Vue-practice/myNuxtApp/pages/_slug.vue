<template>
  <div>
    <h1>hey</h1>
      <h1>{{ slug }}</h1>
  </div>
  </template>
  
  <script>
    export default {
      async asyncData({ params }) {
        const slug = params.slug // When calling /abc the slug will be "abc"
        return { slug }
      },
      layout:'header',
    }
  </script>