<template>
    <div>

        <header>
            <nav>
                <nuxtLink to="/">NuxtJs</nuxtLink>
                <ul>
                    <li>
                        <nuxtLink to="/">Home</nuxtLink>
                    </li>
                    <li>
                        <nuxtLink to="/about">About</nuxtLink>
                    </li>

                </ul>
            </nav>
        </header>
        <h1>Home</h1>
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
div {
    background-color: rgb(146, 161, 161);
    padding: 20px;
    width: 50%;
    margin: auto;
    text-align: center;
    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.315);
    border-radius: 5px;
}

ul {
    /* display: inline; */
    list-style: none;
    text-decoration: none;
}

li {
    padding: 10px;
    display: inline;
    color: black;
    text-align: start;
    text-decoration: none;
    font-size: 20px;
}

h1 {
    color: green;
}

p {
    font-size: 18px;

}
</style>