<template>
    <componentB/>
</template>

<script>
    
    import componentB from './componentB.vue'
    import { provide, ref, reactive } from 'vue';
    export default{
        setup(){
            provide('C_name','c_arju')
            const count=ref(1)
            const address=reactive({
                city:'Jamnagar',
                state:'Gujarat'
            })
            provide('count',count)
            provide('address',address)
        },
        name:'componentC',
        components:{
            componentB
        }
    }
</script>