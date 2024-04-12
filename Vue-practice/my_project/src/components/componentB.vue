<template>
    <componentA/>
</template>
<script>
import componentA from './componentA.vue'
    export default{
        name:'componentB',
        components:{
            componentA
        },
        provide:{
            age:'20'
        }
    }
</script>