<template>
    <div>
        <tabA></tabA>
        <!-- <button @click="isActive='tabA'">TabA</button>
        <button @click="isActive='tabB'">TabB</button>
        <button @click="isActive='tabC'">TabC</button>

        <tabA v-if="isActive=='tabA'"/>
        <tabB v-if="isActive=='tabB'"/>
        <tabC v-if="isActive=='tabC'"/>
        <keep-alive>
        <component :is="isActive"></component>
        </keep-alive> -->
    </div>
</template>

<script>
import TabA from '@/components/tabA.vue'
//  import TabA from './components/tabA.vue';
import TabB from './components/tabB.vue';
import TabC from './components/tabC.vue';
    export default {
        name:'activeTabExmpl',
        component:{
            TabA,
            TabB,
            TabC
        },
        data(){
            return {
            isActive:'tabA'
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>