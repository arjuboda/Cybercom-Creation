import { createWebHashHistory, createRouter } from 'vue-router'
import HelloWorld from './components/HelloWorld.vue'
import TheWelcome from './components/TheWelcome.vue';

const routes = [
    {
        name: 'Home',
        path: '/',
        component: HelloWorld
    },
    {
        name: 'Welcome',
        path: '/welcome',
        component: TheWelcome
    }
];

const router = createRouter({
    history: createWebHashHistory(),
    routes
});
export default router;
