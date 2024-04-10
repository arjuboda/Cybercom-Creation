<template>
    <p>this is my message component!</p>
    <button @click="displayMessage">click me</button>
    <p>{{ messageText }}</p>
</template>

<script>
export default {
    data() {
        return {
            messageText: ''
        }
    },
    methods: {
        displayMessage() {
            this.messageText = 'Button clicked!';
        }
    }
}
</script>