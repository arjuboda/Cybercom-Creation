<template>
    <div class="popupcontainer">
        <h1>User Detail popup</h1>
        <ul>
            <li v-for="(item,key) in detail" :key="item">
                {{ key }} : {{ item }}
            </li>
        </ul>
        <button @click="$emit('Close')">Close</button>
    </div>
</template>

<script>
export default{
    name:'PopUp',
    emits: ['Close'],
    props:{
        detail:Object
    }
}
</script>

