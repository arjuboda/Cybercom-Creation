<template>
    <div>
        <h1>component2</h1>
        <!-- {{ $store.state.count }} -->
        <button @click="incrementCount">increament</button>
        <button @click="getAPIData">get data</button>
        <p>
            name:{{ $store.getters.personDetails.name}}
           age: {{ $store.getters.personDetails.age}}
           count: {{ $store.getters.counts}}
        </p>
        {{ $store.state.postdata }}
    </div>
</template>

<script>

    export default {
        methods:{
            incrementCount(){
                this.$store.commit('increment')
            },
            getAPIData(){
                this.$store.dispatch('getPostData')
            }
        }
    }
</script>
