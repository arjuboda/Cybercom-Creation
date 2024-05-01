 <template>
    <h1>{{ formTitle }}</h1>
    <label for="emlEmail">Email</label><br/>
    <input type="email" name="emlEmail" id="emlEmail" placeholder="Enter Your email address " v-model.lazy="userDetail.email">
    <br/><br/>
    <label for="pswPassword">Password</label><br/>
    <input type="password" name="pswPassword" id="pswPassword" placeholder="Enter your password" ref="refPassword" v-model.lazy="userDetail.password"><br/>
    <br/><br/>
    <label>Technology</label><br/>
    <input type="checkbox" name="chkbxVue" id="chkbxVue" value="VueJs"  v-model.lazy="userDetail.technologies"><label for="chkbxVue">Vue</label>
    <input type="checkbox" name="chkbxJava" id="chkbxJava" value="Java"  v-model="userDetail.technologies"><label for="chkbxJava">Java</label>
    <input type="checkbox" name="chkbxPhp" id="chkbxPhp" value="PHP"  v-model="userDetail.technologies"><label for="chkbxPhp">PHP</label>
    <br/><br/>
    <label>Gender</label><br/>
    <input type="radio" value="Male" name="rdGender" id="rdGenderMale" v-model="userDetail.gender"><label for="rdGenderMale">Male</label>
    <input type="radio" value="Female" name="rdGender" id="rdGenderFemale" v-model="userDetail.gender"><label for="rdGenderFemale">Female</label>
    <input type="radio" value="Other" name="rdGender" id="rdGenderOther" v-model="userDetail.gender"><label for="rdGenderOther">Other</label>
    <br/><br/>
    <button @click="getData" type="button"> Display Data</button>
    <button v-on:click="sendUserDetails(userDetail)">Show user details</button>
    <br/><br/><br/>
    <h2>Form data</h2>
    <p v-show="clicked" >
        Email: {{ userDetail.email }}<br/>
        Password: {{ userDetail.password }} <br/>
        Technology: {{ userDetail.technologies }}<br/>
        Gender: {{ userDetail.gender }}
    </p>

    <ul>
      <li v-for="item in error" v-bind:key="item">
      {{ item }} is require feild!
      </li>
    </ul>
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
          userDetail:{
            email:'',
            password:null,
            technologies:[],
            gender:[]
          },
          clicked:false,
          error:[]
        }
    },
    created() {
        this.userDetail.email = this.newemail;
    },
    methods:{
        getData(){
            this.clicked=true;
            this.error=[];
            for(let item in this.userDetail){
              if(this.userDetail[item]==null||this.userDetail[item]==''){
                this.error.push(item);
              }
            }
            console.log(this.error);
            // if(this.error.length==0){
            //   alert('no error!')
            // }
            // else{
            //   alert(this.error+ ' feilds are require feilds!')
            // }
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