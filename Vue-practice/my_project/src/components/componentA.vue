<template>
    <h1>this is component A</h1>
    <h2>user:{{ user }} <br/> age:{{ age }}</h2>
    <h2>user by composite:{{ C_name }}</h2>
    <h2>c_count:{{ count }} <br> c_city: {{ city }} c_state:{{ state }}</h2>
</template>
<script>
import { inject,toRefs } from 'vue';
    export default{
        setup(){
            const C_name=inject('C_name','default')
            const count=inject('count',0)
            const address=inject('address',{})
            return{
                C_name,
                count,
                ...toRefs(address)
            }
        },
        name:'componentA',
        inject:['user','age']
        
    }
</script>