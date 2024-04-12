<template>
    <componentB/>
</template>

<script>
    
    import componentB from './componentB.vue'

    export default{
        name:'componentC',
        components:{
            componentB
        }
    }
</script>