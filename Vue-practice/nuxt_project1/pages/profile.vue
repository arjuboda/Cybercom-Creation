<template>
    <div>
      <profileComponent/>
    </div>
</template>
  
<script>
  import profileComponent from '@/components/profile-component.vue'
  
  export default {
    components: {
      profileComponent
    },
    computed: {
      userDetails() {
        return this.$store.getters.getUserDetails;
      }
    }
  }
</script>
  