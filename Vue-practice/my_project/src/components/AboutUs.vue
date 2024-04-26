<template>
    <h1>This is About page</h1>
    <h2>{{ user }}</h2>

    <p>Name:{{ user_name }}</p>
    <p>Address: {{ address.city }}, {{ address.state }}</p>
</template>
<script>
import {ref, reactive} from 'vue';
// import {toRefs} from 'vue';
import { watch } from 'vue';
    export default{
        name:'AboutUs',
        inject:['user'],
        setup(){
            const user_name=ref('pqr')
            const address=reactive({
                city:'Jamnagar',
                state:'Gujarat',
            })
            setTimeout(() => {
                user_name.value='mnp'
                address.city='Rajkot'
            }, 3000);
            watch(()=>{
                return {...address}
                // return address.city
            },(newvalue, oldvalue)=>{
                console.log('oldcity:',oldvalue.city, 'newcity:',newvalue.city);
                console.log('oldstate:',oldvalue.state, 'newstate:',newvalue.city);
                // console.log('old:',oldvalue, 'new:',newvalue);
            })
            watch(user_name,(newvalue, oldvalue)=>{
                console.log('old:',oldvalue, 'new:',newvalue);
            })
            return {
                user_name,
                address,
            }
            // return toRefs (address)
            
        }
    }
</script>