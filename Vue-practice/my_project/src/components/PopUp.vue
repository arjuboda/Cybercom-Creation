<template>
    <div class="popupcontainer">
        <h1>User Detail popup</h1>
        <ul>
            <li v-for="(item,key) in detail" :key="item">
                {{ key }} : {{ item }}
            </li>
        </ul>
        <button @click="$emit('Close',name)">Close</button>
    </div>
</template>

<script>
export default{
    name:'PopUp',
    // emits: ['Close'],
    emits: {
        Close:(name)=>{
            if(!name){
                return false
            }
            else{
                return true
            }
        }
    },
    props:{
        detail:Object
    },
    data(){
        return {
            name:'Arju'
        }
    }
}
</script>
<style>
ul{
    list-style: none;
    text-align: left;
}
</style>
