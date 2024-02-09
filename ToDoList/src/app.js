let list = JSON.parse(localStorage.getItem('List')) || [];

function generateUniqId() {
    let id = new Date().getTime();
    return id;
}

function displayData() {
    let container = document.getElementsByClassName('container')[0];

    list.forEach(element => {
        let taskListContainer = document.createElement('div');
        taskListContainer.classList.add('subcontainer');
        // let divTask = taskListContainer.querySelector('.divTask');

        taskListContainer.innerHTML = `
                <div class='divListItem'>
                    <div class='divTask'> ${element.value}</div>
                    <div class='divDate'> Priority : ${element.priority} &nbsp;&nbsp;  Due-Date : ${element.date}</div>
                </div>
                <button class= 'btnEdit btn' onclick='editListItem(${element.id})'>EDIT </button>      
                <button class= 'btnCompleted btn' ${element.completed ? 'style="text-decoration: line-through;"' : ''} onclick='btnCompletedTask(${element.id})'>COMPLETED </button>      
                <button class= 'btnDelet btn' onclick='btnDeletListItem(this)'>DELETE </button>      
            `
        container.appendChild(taskListContainer);
        //get today's date
        let today = new Date();
        let dueDate = new Date(element.date);
        // Check if due date has passed
        if (dueDate < today && !element.completed) {
            // Set text color to red and apply line-through style
            let divTask = taskListContainer.querySelector('.divTask');
            if (divTask) {
                divTask.style.color = 'red';
                divTask.style.textDecoration = 'line-through';
            }
        }
    });

}

function filterTasks() {
    const filterValue = document.getElementById('taskFilter').value;
    const container = document.querySelector('.container');

    // Remove existing subcontainer elements
    const subcontainers = container.querySelectorAll('.subcontainer');
    subcontainers.forEach(subcontainer => {
        subcontainer.remove();
    });

    let filteredTasks = [];
    if (filterValue === 'completed') {
        filteredTasks = list.filter(task => task.completed);
    } else if (filterValue === 'incomplete') {
        filteredTasks = list.filter(task => !task.completed);
    } else {
        filteredTasks = list; // Show all tasks
    }

    // Display filtered tasks
    filteredTasks.forEach(element => {
        let taskListContainer = document.createElement('div');
        taskListContainer.classList.add('subcontainer');

        taskListContainer.innerHTML = `
            <div class='divListItem'>
                <div class='divTask'> ${element.value}</div>
                <div class='divDate'> Priority : ${element.priority} &nbsp;&nbsp;  Due-Date : ${element.date}</div>
            </div>
            <button class= 'btnEdit btn' onclick='editListItem(${element.id})'>EDIT </button>      
            <button class= 'btnCompleted btn' ${element.completed ? 'style="text-decoration: line-through;"' : ''} onclick='btnCompletedTask(${element.id})'>COMPLETED </button>      
            <button class= 'btnDelet btn' onclick='btnDeletListItem(this)'>DELETE </button>      
        `;
        container.appendChild(taskListContainer);
    });

    // Check if the due date has passed for any task
    let today = new Date().toISOString().split('T')[0];
    list.forEach(element => {
        if (element.date < today && !element.completed) {
            // Find the divTask element associated with this task and change its color to red
            let divTask = container.querySelector(`.divTask:contains(${element.value})`);
            if (divTask) {
                divTask.style.color = 'red';
            }
        }
    });
}

function editListItem(id) {
    // Fetch the task data from localStorage based on the ID
    const task = list.find(item => item.id === id);

    // Update input field value
    document.getElementById('inpList').value = task.value;
    document.getElementById('priority').value = task.priority;
    document.getElementById('dtDueDate').value = task.date;

    // Change button text to "Update"
    document.getElementById('btnAddTask').textContent = 'Update';

    // Store the ID of the task being edited in localStorage temporarily
    localStorage.setItem('editingTaskId', id);
}

function addItemToList() {
    let inpTask = document.getElementById('inpList');
    let selPriority = document.getElementById('priority');
    let dueDate = document.getElementById('dtDueDate');
    let editingTaskId = localStorage.getItem('editingTaskId');

    if (!inpTask.value == '' && !selPriority.value == '' && !dueDate.value == '') {
        // Check if there's an editing task ID stored
        if (editingTaskId) {
            // Update existing task
            const index = list.findIndex(item => item.id === parseInt(editingTaskId));
            if (index !== -1) {
                list[index].value = inpTask.value;
                list[index].date = dueDate.value;
                list[index].priority = selPriority.value;
                list[index].completed = false; //set completed to false as we update the task
                updateLocalStorage();
                inpTask.value = '';
                document.getElementById('btnAddTask').textContent = 'Add';
                localStorage.removeItem('editingTaskId'); //remove temporarily store value
                location.reload();
                return; // Exit function after updating task
            }
        } else {
            // Add new task

            let currentTask = {
                id: generateUniqId(),
                value: inpTask.value,
                completed: false,
                date: dueDate.value,
                priority: selPriority.value

            };
            list.push(currentTask);
            localStorage.setItem('List', JSON.stringify(list));
            inpTask.value = '';
            document.location.reload();
        }
    }
    else {
        alert('Please fill all the fields!');
        if (inpTask.value == '') {
            inpTask.style.borderColor = 'red'
        }
        if (selPriority.value == '') {
            selPriority.style.borderColor = 'red'
        }
        if (dueDate.value == '') {
            dueDate.style.borderColor = 'red'
        }
    }
}
btnAddTask.addEventListener('click', function () {
    addItemToList();
});

function btnCompletedTask(taskId) {
    // Find the task with the matching ID
    var matchingTask = list.find(item => item.id === taskId);
    if (matchingTask) {
        // Update the 'completed' property of the matching task
        matchingTask.completed = true;

        updateLocalStorage();

        // Apply line-through style to the task text
        var listItem = document.querySelector('.divListItem[id="' + taskId + '"]');
        if (listItem) {
            listItem.style.textDecoration = 'line-through';
        }

    }
    location.reload();

}

function btnDeletListItem(button) {
    let permission = confirm('Are you sure you want to delete the item?');
    if (permission) {
        // Find the parent element of the button, which contains the item to be deleted
        var itemToDelete = button.parentNode;
        var valueToDelete = itemToDelete.querySelector('.divTask').textContent.trim();
        // Remove the item from list
        list = list.filter(item => item.value !== valueToDelete);
        updateLocalStorage();

        // Remove the item from container
        itemToDelete.parentNode.removeChild(itemToDelete);
    }
}

// Update local storage
function updateLocalStorage() {
    localStorage.setItem('List', JSON.stringify(list));
}

document.addEventListener('DOMContentLoaded', function () {
    let dueDateInput = document.getElementById('dtDueDate');
    // Get today's date 
    let today = new Date().toISOString().split('T')[0];
    // Set the minimum date for the input element to today
    dueDateInput.setAttribute('min', today);

    displayData();
    document.getElementById('taskFilter').addEventListener('change', filterTasks);

})
