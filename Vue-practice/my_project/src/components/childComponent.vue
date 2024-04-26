<template>
    <div>
        <h2>This is child component</h2>
    </div>
</template>

<script>
    export default {
        name:'childComponent',
        beforeCreate(){
            // setTimeout(()=>{
                
                console.log('child before created',Date());

            // },1500)
        },
        created(){
            console.log('child created',Date());
        },
        beforeMount(){
            // setTimeout(()=>{
                console.log('child before mounted',Date());

            // },1000)
        },
        mounted(){
            console.log('child Mounted!', Date());
        },
        beforeUpdate(){
            console.log('child before update',Date());
        },
        updated(){
            console.log('child Updated',Date());
        }
    }
</script>

<style scoped>

</style>