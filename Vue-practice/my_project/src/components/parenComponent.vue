<template>
    <div>
       <h1> Parent Component</h1>
        <button @click="showChild=!showChild">toggel child</button>
        <childComponent v-if="showChild"/>
    </div>
</template>

<script>
import { onBeforeMount,onMounted,onUpdated, onBeforeUpdate, onUnmounted, onBeforeUnmounted } from 'vue';
import childComponent from './childComponent.vue'
    export default {
        name:'parentComponent',
        setup(){
            onBeforeMount(()=>{
                console.log('beforMount')
            }),
            onMounted(()=>{
                console.log('onMounted')
            }),
            onUpdated(()=>{
                console.log('onUpdated')
            }),
            onBeforeUpdate(()=>{
                console.log('onBeforeUpdate')
            }),
            onUnmounted(()=>{
                console.log('onUnmounted')
            })
            onBeforeUnmounted(()=>{
                console.log('onBeforeUnmounted')
              })
        },
        components:{
            childComponent
        },
        data(){
            return{
                showChild:true
            }
        },
        beforeCreate(){
            // setTimeout(()=>{
                
                console.log('Parent before created',Date());

            // },1500)
        },
        created(){
            console.log('Parent created',Date());
        },
        beforeMount(){
            // setTimeout(()=>{
                console.log('Parent before mounted',Date());

            // },1000)
        },
        mounted(){
            console.log('Parent Mounted!', Date());
        },
        beforeUpdate(){
            console.log('Parent before update',Date());
        },
        updated(){
            console.log('Parent Updated',Date());
        }
    }
</script>

<style scoped>

</style>