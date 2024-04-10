<template>
    <h1>this is about page</h1>
    <messageComponent></messageComponent>
    <linkcomponent></linkcomponent>

    <button v-on:click="handleClick">Click me</button>

</template>

<script>
import messageComponent from '@/components/message-component.vue';
import linkcomponent from '@/components/link-component.vue';
export default {
    components: {
        messageComponent,
        linkcomponent
    }, 
    methods:{
        handleClick(){
           console.log('clicked!')
        }
    }
}
</script>
