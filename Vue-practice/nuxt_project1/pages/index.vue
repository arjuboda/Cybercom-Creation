<template>
    <h2>this is home page</h2>
    <input v-model="message" type="text">
    <p>{{ message }}</p>
    <br/>   
    <nuxtLink to="/about">Go to About page</nuxtLink>
</template>
<script>
export default {
    data() {
        return {
            message: ''
        }
    }
}
</script>