<template>
    <div>
      <ul>
        <li v-for="(item, index) in items" :key="index">{{ item }}</li>
      </ul>
      <ul>
        <li v-for="item in items" :key="item.index">{{ item }}</li>
      </ul>
      <ul>
        <li v-for="(item,index) in userDetail" :key="index">{{ index }}:{{ item }}</li>
      </ul>
    </div>

    <button @click="toggleVisibility">Toggle button</button>
    <p v-if="seen">Visible</p>
    <p v-else>Not visible</p>
    <p v-show="seen">Now you see me</p>

    <span v-pre>{{ rawText }}</span>
    <div v-html="childtag"></div>

    <button v-on:click="increamentValue">Increase value</button>
    <p>{{ count }}</p>
  </template>
  
  <script>
  export default {
    data() {
      return {
        seen:'true',
        items: ['Item 1', 'Item 2', 'Item 3'],
        userDetail:{
        'name':'Arju',
        'Age':21,
        'Address':'jamnagar, Gujarat'
        },

        rawText: "This {{ will }} not display",
        childtag:'<div><p>This is sub child tag!</p></div><span>Other child</span>',
        count:1
      };
    },
    methods:{
        toggleVisibility() {
            this.seen = !this.seen;
        },
        increamentValue(){
            this.count++;
        }
    }
  }
  </script>
  