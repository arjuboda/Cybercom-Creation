<template>
    <div  class="bg-gray-800 py-4">
        <header>
            <NuxtLink to="/">MyAPP</NuxtLink>
            <nav>
                <NuxtLink to="/">Home</NuxtLink>
                <NuxtLink to="/login">Lgin</NuxtLink>
                <NuxtLink to="/signup">Signup</NuxtLink>
                <NuxtLink to="/cart">Cart</NuxtLink>
            </nav>
        </header>
        <Nuxt/>
    </div>
</template>

<script>
    export default {
        
    }
</script>

<style>

</style>