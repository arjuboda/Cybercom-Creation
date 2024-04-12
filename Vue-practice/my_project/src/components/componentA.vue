<template>
    <h1>this is component A</h1>
    <h2>{{ user }}{{ age }}</h2>
</template>
<script>
    export default{
        name:'componentA',
        inject:['user','age']
        
    }
</script>