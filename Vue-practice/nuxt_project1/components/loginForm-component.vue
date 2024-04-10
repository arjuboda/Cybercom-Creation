 <template>
    <h1>{{ formTitle }}</h1>
    <label for="emlEmail">Email</label><br/>
    <input type="email" name="emlEmail" id="emlEmail" placeholder="Enter Your email address " v-model="email">
    <br/><br/>
    <label for="pswPassword">Password</label><br/>
    <input type="password" name="pswPassword" id="pswPassword" placeholder="Enter your password" ref="refPassword" v-model="password"><br/>
    <br/><br/>
    <label>Technology</label><br/>
    <input type="checkbox" name="chkbxVue" id="chkbxVue" value="VueJs"  v-model="technologies"><label for="chkbxVue">Vue</label>
    <input type="checkbox" name="chkbxJava" id="chkbxJava" value="Java"  v-model="technologies"><label for="chkbxJava">Java</label>
    <input type="checkbox" name="chkbxPhp" id="chkbxPhp" value="PHP"  v-model="technologies"><label for="chkbxPhp">PHP</label>
    <br/><br/>
    <label>Gender</label><br/>
    <input type="radio" value="Male" name="rdGender" id="rdGenderMale" v-model="gender"><label for="rdGenderMale">Male</label>
    <input type="radio" value="Female" name="rdGender" id="rdGenderFemale" v-model="gender"><label for="rdGenderFemale">Feale</label>
    <input type="radio" value="Other" name="rdGender" id="rdGenderother" v-model="gender"><label for="rdGenderOther">Other</label>
    <br/><br/>
    <button @click="getData" type="button"> Display Data</button>
    <button v-on:click="sendUserDetails(userDetails)">get user details</button>
    <br/><br/><br/>
    <h2>Form data</h2>
    <!-- <p v-show="clicked" >
        Email: {{ email }}<br/>
        Password: {{ password }} <br/>
        Technology: {{ technologies }}<br/>
        Gender: {{ gender }}
    </p> -->
</template>

<script>
export default{
    props:{
        formTitle:String,
        newemail:String,
        sendUserDetails:Function
    },
    data(){
        return{
            email:'',
            password:null,
            technologies:[],
            gender:[],
            clicked:false,
            userDetails:{}
        }
    },
    created() {
        this.email = this.newemail;
        this.userDetails={
            email:this.email,
            password:this.password,
            technologies:this.technologies,
            gender:this.gender
        }
    },
    methods:{
        getData(){
            this.clicked=true;
            // console.log(this.$refs.refPassword.value)
        }
    }
}
</script>

<!-- // const userDetails={
//     email:this.email,
//     password:this.password,
//     technologies:this.technologies,
//     gender:this.gender
// }

// this.$emit('sendUserDetails', userDetails); // Emitting an event to send userDetails to parent component -->
<!-- <script>
export default {
  props: {
    formTitle: String,
    newemail: String
  },
  data() {
    return {
      email: '',
      password: null,
      technologies: [],
      gender: [],
      clicked: false
    }
  },
  created() {
    this.email = this.newemail;
  },
  methods: {
    async getData() {
      this.clicked = true;
      const userDetails = {
        email: this.email,
        password: this.password,
        technologies: this.technologies,
        gender: this.gender
      }

      this.$store.dispatch('setUserDetails', userDetails); // Dispatching an action to store the user details
      
      // Redirect to profile page
      this.$router.push({ name: 'profile' });
    }
  }
}
</script> -->

<!-- 
<template>
    <div>
      <h1>{{ formTitle }}</h1>
      <label for="emlEmail">Email</label><br/>
      <input type="email" name="emlEmail" id="emlEmail" placeholder="Enter Your email address " v-model="email">
      <br/><br/>
      <label for="pswPassword">Password</label><br/>
      <input type="password" name="pswPassword" id="pswPassword" placeholder="Enter your password" v-model="password"><br/>
      <br/><br/>
      <label>Technology</label><br/>
      <input type="checkbox" name="chkbxVue" id="chkbxVue" value="VueJs"  v-model="technologies"><label for="chkbxVue">Vue</label>
      <input type="checkbox" name="chkbxJava" id="chkbxJava" value="Java"  v-model="technologies"><label for="chkbxJava">Java</label>
      <input type="checkbox" name="chkbxPhp" id="chkbxPhp" value="PHP"  v-model="technologies"><label for="chkbxPhp">PHP</label>
      <br/><br/>
      <label>Gender</label><br/>
      <input type="radio" value="Male" name="rdGender" id="rdGenderMale" v-model="gender"><label for="rdGenderMale">Male</label>
      <input type="radio" value="Female" name="rdGender" id="rdGenderFemale" v-model="gender"><label for="rdGenderFemale">Female</label>
      <input type="radio" value="Other" name="rdGender" id="rdGenderother" v-model="gender"><label for="rdGenderOther">Other</label>
      <br/><br/>
      <button @click="getData" type="button">View Profile</button> 
    </div>
  </template>
  
  <script>
  export default {
    props: {
      formTitle: String,
      newemail: String
    },
    data() {
      return {
        email: '',
        password: null,
        technologies: [],
        gender: [],
        clicked: false
      }
    },
    created() {
      this.email = this.newemail;
    },
    methods: {
      getData() {
        this.clicked = true;
        const userDetails = {
          email: this.email,
          password: this.password,
          technologies: this.technologies,
          gender: this.gender
        }
  
        this.$emit('sendUserDetails', userDetails);
      }
    }
  }
  </script>
   -->