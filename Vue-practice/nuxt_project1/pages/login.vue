
<template>
    <LoginFormComponent  :sendUserDetails="receiveUserDetails" :newemail="email" formTitle="Login Form"/>
    <ProfileComponent :userDetails="userDetails"/>
</template>

<script>
    import LoginFormComponent from '@/components/loginForm-component.vue';
    import profileComponent from '@/components/profile-component.vue';

    export default{
        components:{
            LoginFormComponent,
            profileComponent
        },
        data() {
            return {
                email: 'abc@gmail.com',
                userDetails:{}
            };
        },
        methods: {
            receiveUserDetails(userDetails) {
                this.userDetails = userDetails; // receiving userDetails from login component
                console.log(this.userDetails);
            }
        }
    }
</script> 
 <!--
 <template>
    <div>
      <LoginFormComponent @sendUserDetails="receiveUserDetails" :newemail="email" formTitle="Login Form"/>
      <nuxt-link :to="{ name: 'profile', params: { userDetails: userDetails } }">Go to Profile</nuxt-link>
    </div>
  </template>
  
  <script>
  import LoginFormComponent from '@/components/loginForm-component.vue';
  
  export default {
    components: {
      LoginFormComponent
    },
    data() {
      return {
        email: 'abc@gmail.com',
        userDetails: {}
      };
    },
    methods: {
      receiveUserDetails(userDetails) {
        this.userDetails = userDetails; // receiving userDetails from login component
      }
    }
  };
  </script>
   -->