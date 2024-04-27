import { createStore } from "vuex";
import axios from "axios";

const store = createStore({
    state() {
        //use to define property
        return {
            count: 1,
            person: {
                name: 'abc',
                age: 21
            },
            postdata: {}
        }
    },
    mutations: {
        //use for performm operation on data
        increment(state) {
            console.log('incrementing count')
            state.count++;
        },
        updateData(state, postdata) {
            state.postdata = postdata
            console.log(state.postdata)
        }
    },
    actions: {
        //use for api call related work
        async getPostData({ commit }) {
            const res = await axios.get('https://jsonplaceholder.typicode.com/posts/1')
            const data = res.data;
            commit('updateData', data)
        }
    },
    getters: {
        //used to represent the data
        personDetails(state) {
            return { name: state.person.name, age: state.person.age };
        },
        counts(state) {
            return (state.count + state.count);
        }
    }
})

export default store;