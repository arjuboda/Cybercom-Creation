<template>
    <div class="card">
        <!-- <slot name="header"></slot>
        <slot>defualt</slot>
        <slot name="footer"></slot> -->
        <!-- {{content}} -->
        <slot :uname="user.name"></slot>
    </div>
</template>

<script>
    export default {
        name:'cardComponent',
        props:['content'],
        data(){
            return{
                user:{
                    'name':'abc',
                    'age':21,
                    'Address':'Jamnagar'
                }

            }
        }
    }
</script>

<style scoped>

</style>