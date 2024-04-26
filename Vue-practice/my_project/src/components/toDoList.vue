
<template>
    <div class="container">
        <div class="title_container">
            <h2 class="title">hello, <input type="text" placeholder="your name" v-model="name"/></h2>
        </div>

        <div class="body_container">
            <h3>CREATE A TO-DO</h3>
            <form @submit.prevent="addTodo">
                <h4>What's on your to do?</h4>
                <input type="text" class="inpContent" placeholder="e.g. review the project" v-model="input_content"> <br>
                <!-- {{ input_content }} -->
                <h4>Pick a category</h4>
                <label for="category_personal" class="category category_personal">
                    <input type="radio" name="category" id="category_personal" value="personal" v-model="input_category"> 
                    personal
                </label>
                <label for="category_bussiness" class="category category_bussiness">
                    <input type="radio" name="category" class="radio" id="category_bussiness" value="business" v-model="input_category"> 
                    Business
                </label>
                <br><br>
                <input type="submit" value="Add TO DO" class="btnAddToDo">
            </form>
        </div>
        <div class="todos-container">
      <table class="todos-table">
        <thead>
          <tr>
            <th>Content</th>
            <th>Category</th>
            <th>Created At</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(todo, index) in todo_asc" :key="todo.createdAt">
              <td>{{ todo.content }}</td>
              <td>{{ todo.category }}</td>
              <td>{{ new Date(todo.createdAt).toLocaleString() }}</td>
              <td><button @click="removeItem(index)">Remove</button></td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>
</template>

<script>
    import {onMounted, ref, watch,computed} from 'vue'
    export default{
        name:'ToDoList',
        setup(){
          const localContent=JSON.parse(localStorage.getItem('content') )||[]
            const todos= ref(localContent.length > 0 ? localContent : []);
            const name=ref('')
            const input_content=ref('')
            const input_category=ref(null)
            // const local_content=JSON.parse(localStorage.getItem('content') )|| []
            // const todo_asc = computed(() => [...todos.value].sort((a, b) => a.createdAt - b.createdAt));
            const todo_asc = computed(() => todos.value.slice().sort((a, b) => a.createdAt - b.createdAt));


            const addTodo=()=>{  
                if(input_category.value !=='' && input_content.value.trim() !==''){
                  const newTodo=({
                        createdAt:Date.now(),
                        content:input_content.value,
                        category:input_category.value
                    })
                    // todos.value.push(newTodo);
                    todos.value.push(newTodo)
                    localStorage.setItem('content',JSON.stringify(todos.value))
                }
                
            }
            const removeItem = (index) => {
                todos.value.splice(index, 1); // Remove the task from todos array
                localStorage.setItem('content', JSON.stringify(todos.value)); // Update localStorage
            }
            watch(name,(newval)=>{
                // console.log(newval);
                localStorage.setItem('name',newval)
            })
            onMounted(()=>{
                name.value=localStorage.getItem('name')|| ''
            })
            return{
                name,
                input_category,
                input_content,
                todos,
                addTodo,todo_asc,removeItem
            }
        }
    }
</script>

<style>
.container {
  width: 30%;
  margin: auto auto;
  padding: 30px;
  box-shadow: 0px 0px 4px gray;
  font-family: Arial, sans-serif;
  background-color: #f2f2f2; 
  min-width: calc(100% - 10%); /*Added space between 100% and -100px */
}
.title_container{
  color: #01264d;
}
.title_container input{
  color: #01264d;
  font-weight: 700;
  border: none;
  font-size: 28px;
  width: auto;
  background-color: transparent;
}

.body_container {
  margin-top: 50px;
}

.body_container h3 {
  text-shadow: 1px 0px 4px rgb(78, 78, 78);
  margin: 0px 0px 15px 0px;
  font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  font-size: 25px;
  color: #01264d;
}
.body_container h4{
  /* border: 1px solid green; */
  margin: 25px 0px 10px 0px;
  color: #01264d;
  font-size: 18px;

}
.inpContent{
  border: 2px solid gray;
  padding: 5px;
  width: 100%;
  border-radius: 5px;
  font-size: 16px;
  background: transparent;
  color: #01264d;
}
.category{
 font-size: 16px;
 font-weight: 600;
  padding: 5px;
  color: #01264d;
}
input[type="radio"]:checked{
  padding: 5px;
  accent-color: #01264d;
}
.btnAddToDo{
  padding:5px 10px;
  font-size: 14px;
  font-weight: 700;
  border:2px solid #01264d;
  color: #01264d;
  border-radius: 5px;
  margin-bottom: 30px;
  margin-top: 10px;
  cursor: pointer;
}
.btnAddToDo:hover{
  background-color: #01264d;
  color: #f2f2f2;
}
.todos-table {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid #ddd;
  color: #01264d;
}

.todos-table th, .todos-table td {
  border: 1px solid #ddd;
  padding: 12px; /* Increased padding for better spacing */
  
}

.todos-table th {
  background-color: #01264d;
  font-weight: bold;
  text-align: left;
  color: #f2f2f2;
}
.todos-table tr button{
  padding:5px 10px;
  font-size: 14px;
  font-weight: 600;
  border: 2px solid #01264d;
  border-radius: 5px;
}
.todos-table tr:hover {
  background-color: #f9f9f9;
}

</style>
