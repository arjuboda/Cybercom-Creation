<template>
    <div class="signup-container">
      <h1>Sign Up</h1>
      <form @submit.prevent="submitForm">
        <div :class="['form-group', { 'error': !user.name }]">
          <label for="txtName">Name</label>
          <txtInputField v-model="user.name" :class="{ 'error-border': !user.name }"/>
          <!-- <input type="text" id="txtName" v-model="user.name" :class="{ 'error-border': !user.name }" placeholder="Enter your name"> -->
        </div>
        <div :class="['form-group', { 'error': !user.address }]">
          <label for="txtAddress">Address</label>
          <textarea id="txtAddress" v-model.trim.lazy="user.address" :class="{ 'error-border': !user.address }" placeholder="Enter your address"></textarea>
        </div>
        <div class="form-group">
          <label>Hobbies</label>
          <div class="checkbox-group">
            <label>
              <input type="checkbox" value="reading" v-model="user.hobbies"> Reading
            </label>
            <label>
              <input type="checkbox" value="writing" v-model="user.hobbies"> Writing
            </label>
          </div>
        </div>
        <div class="form-group">
          <label>Gender</label>
          <div class="radio-group">
            <label>
              <input type="radio" value="Male" v-model="user.gender"> Male
            </label>
            <label>
              <input type="radio" value="Female" v-model="user.gender"> Female
            </label>
          </div>
        </div>
        <div class="form-group">
          <input type="checkbox" id="chkVerify" value="true" v-model="user.verify">
          <label for="chkVerify" v-bind="$attrs">I confirm that the details provided are accurate.</label>
        </div>
        <button type="submit" :style="{ 'background-color': user.name && user.address ? '#4CAF50' : '#ccc' }">Submit</button>
      </form>
      <div v-show="showPopup" class="popup">
        <PopUp @Close="closePopup" :detail="user" />
      </div>
    </div>
  </template>
  
  <script>
  import PopUp from './PopUp.vue';
import txtInputField from './txtInputField.vue';
  
  export default {
    name: 'SignUpForm',
    inheritAttrs:false,
    components: {
      PopUp,
      txtInputField
    },
    data() {
      return {
        showPopup: false,
        user: {
          name: '',
          address: '',
          hobbies: [],
          gender: '',
          verify: false
        }
      }
    },
    methods: {
      submitForm() {
        this.showPopup = true;
      },
      closePopup(name){
        this.showPopup = false;
        console.log(name);
      }
    }
  }
  </script>
  
  <style scoped>
  .signup-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
  }
  
  .signup-container h1 {
    text-align: center;
    margin-bottom: 20px;
  }
  .form-group,
  .form-row {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
  }
  
  label {
    flex: 1;
    margin-right: 10px;
  }
  
  input[type="text"],
  textarea,
  .checkbox-group,
  .radio-group,
  input[type="checkbox"] {
    flex: 3;
  }
  
  
  textarea {
    box-sizing: border-box;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
   .checkbox-group,
  .radio-group {
     display: flex; 
     margin: 10px auto;
  } 
  
  .checkbox-group label,
  .radio-group label {
    margin-right: 20px;
  }
  
  button[type="submit"] {
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
  }
  
  .popup {
    margin-top: 20px;
  }
  #chkVerify{
    width: 100px;
    flex: none;
  }

  #confirmLabel{
    text-align: left;
  }
  </style>