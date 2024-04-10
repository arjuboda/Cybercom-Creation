<template>
    <p>This is product with id <b>{{ id }} </b></p>
    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Fugit quis adipisci iure voluptatem, soluta reiciendis ad
    minima corrupti incidunt assumenda id! Cupiditate alias voluptas maiores magnam similique eaque a autem.
</template>

<script setup>
const { id } = useRoute().params;
</script>