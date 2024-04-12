<template>
    <h1>This is About page</h1>
    <h2>{{ user }}</h2>
</template>
<script>
    export default{
        name:'AboutUs',
        inject:['user']
    }
</script>