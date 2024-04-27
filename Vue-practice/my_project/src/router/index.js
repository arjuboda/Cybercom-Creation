import { createRouter, createWebHistory } from 'vue-router'
import AboutUs from '@/components/AboutUs.vue'
import HelloWorld from '@/components/HelloWorld.vue'
import SignupForm from '@/components/SignupForm.vue'
import storePractice from '@/view/storePractice.vue'
import activeTabExmpl from '@/view/activeTabExmpl.vue'

const routes = [
    {
        path: '/',
        name: 'home',
        component: HelloWorld
    },
    {
        path: '/about',
        name: 'about',
        component: AboutUs
    },
    {
        path: '/signup',
        name: 'signup',
        component: SignupForm
    },
    {
        path: '/storePractice',
        name: 'storePractice',
        component: storePractice
    },
    {
        path: '/activeTabExmpl',
        name: 'activeTabExmpl',
        component: activeTabExmpl
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router
