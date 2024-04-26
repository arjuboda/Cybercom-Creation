<template>
    <div>
        <input type="text" ref="nameInput">
    </div>
</template>
<script>
export default{
    name:'txtInputFeild',
    mounted(){
        console.log('inmounted',this.$refs)
      this.$refs.nameInput.focus();
    }
}
</script>

<style>
    input[type='text']{
        box-sizing: border-box;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>