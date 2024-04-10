<template>
    <div class="container">
        <header>
            <nav>
                <div class="logo">
                    <nuxtLink to="/">NuxtJs</nuxtLink>
                </div>
                <div class="linkSection">
                    <ul>
                        <li>
                            <nuxtLink to="/">Home</nuxtLink>
                        </li>
                        <li>
                            <nuxtLink to="/about">About</nuxtLink>
                        </li>

                    </ul>

                </div>
            </nav>
        </header>


        <h1>About</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, eaque! Rerum ipsum quo adipisci illo ex.
            Rem
            veniam, ducimus laboriosam voluptatum maiores, velit dignissimos eligendi iste, vero ipsam fugit dolores!
        </p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, eaque! Rerum ipsum quo adipisci illo ex.
            Rem
            veniam, ducimus laboriosam voluptatum maiores, velit dignissimos eligendi iste, vero ipsam fugit dolores!
        </p>

    </div>
</template>

<style scoped>
.container {
    background-color: azure;
    padding: 20px;
    width: 50%;
    margin: auto;
    text-align: center;
    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.315);
    border-radius: 5px;
}

.logo {
    display: inline-block;
    border: 1px rgb(0, 0, 0) dashed;
}

.linkSection {
    display: inline-block;
}

h1 {
    color: rgb(9, 0, 128);
}

header {
    border: 1px solid red;
}

nav {
    /* border: 1px dotted green; */
    /* padding: 0px; */
    background-color: beige;
    justify-content: space-between;
}

ul {
    margin: 0px;
    border: 2px solid black;
    display: inline-block;
}

li {
    display: inline-block;
    padding: 10px;
    text-align: start;
}
</style>