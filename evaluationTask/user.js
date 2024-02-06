// Retrieve data from local storage and display in table
document.addEventListener('DOMContentLoaded', function () {
    // Function to generate unique ID
    function displayLocalstorageData() {
        let userData = JSON.parse(localStorage.getItem('userData')) || [];
        let tableBody = document.querySelector('#UserData tbody');

        userData.forEach(user => {
            let row = document.createElement('tr');
            let userAge = calculateAge(user.userBirthDate);
            function calculateAge(birthdate) {
                var today = new Date();
                var birthDate = new Date(birthdate);
                var age = today.getFullYear() - birthDate.getFullYear();
                var month = today.getMonth() - birthDate.getMonth();
                if (month < 0 || (month === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }
                return age;
            }
            row.innerHTML = `
                <td>${user.userName}</td>
                <td>${user.userEmail}</td>
                <td>${user.userPassword}</td>
                <td>${user.userBirthDate}</td>
                <td>${userAge}</td>
                <td class="action-buttons">
                    <button onclick="editUser('${user.userID}')">Edit</button>
                    <button onclick="deleteUser('${user.userName}', this)">Delete</button>
                </td>
            `;
            tableBody.appendChild(row);

        });

    }

    function generateId() {
        return '_' + Math.random().toString(36).substr(2, 9);
    }
    function addNewUser() {
        // alert();
        // let newUserName=document.getElementById('txtNewUserName').value; 
        // let newUserEmail = document.getElementById('emlNewUserEmail').value;
        // let newUserPassword = document.getElementById('pswNewUserPassword').value;
        // let dtNewUserBirthDate = document.getElementById('dtNewUserBirthDate').value;
        //alert();
        let userData = JSON.parse(localStorage.getItem('userData'));
        if (!Array.isArray(userData)) {
            userData = []; // Initialize as empty array if not an array
        }
        let userId = generateId();
        let newData = {
            userId: userId,
            userName: $('#txtNewUserName').val(),
            userEmail: $('#emlNewUserEmail').val(),
            userPassword: $('#pswNewUserPassword').val(),
            userBirthDate: $('#dtNewUserBirthDate').val()
        };
        userData.push(newData);
        localStorage.setItem('userData', JSON.stringify(userData));
        location.reload();
        // displayLocalstorageData();

    }
    displayLocalstorageData();

    $('#btnAddUser').click(function () {
        addNewUser();
    });

});
function deleteUser(userName, button) {
    let UserData = JSON.parse(localStorage.getItem('userData')) || [];
    let userData = UserData.filter(user => user.userName !== userName);
    localStorage.setItem('userData', JSON.stringify(userData));

    // Remove row from the table
    let row = button.closest('tr');
    row.parentNode.removeChild(row);
}



function editUser(userId) {
    let userData = JSON.parse(localStorage.getItem('userData')) || [];
    let user = userData.find(user => user.userId === userId);

    if (user) {
        // Populate the input fields with user data
        document.getElementById('txtEditUserName').value = user.userName;
        document.getElementById('emlEditUserEmail').value = user.userEmail;
        document.getElementById('pswEditUserPassword').value = user.userPassword;
        // Populate other fields as needed

        // Show the edit user popup
        document.getElementById('editUserPopup').style.display = 'block';
    }
}

function saveEditedUser() {
    // Get the edited user data from the input fields
    let editedUser = {
        userName: document.getElementById('txtEditUserName').value,
        userEmail: document.getElementById('emlEditUserEmail').value,
        userPassword: document.getElementById('pswEditUserPassword').value
        // Get other fields as needed
    };

    // Retrieve the edited user index from sessionStorage
    let userIndex = sessionStorage.getItem('editedUserIndex');

    // Retrieve userData from local storage
    let userData = JSON.parse(localStorage.getItem('userData')) || [];

    // Update the user data at the specified index
    userData[userIndex] = editedUser;

    // Save the updated userData array back into local storage
    localStorage.setItem('userData', JSON.stringify(userData));

    // Close the edit user popup
    closeEditUserPopup();

    // Refresh the displayed data (if needed)
    displayLocalstorageData();
}

function closeEditUserPopup() {
    // Close the edit user popup
    document.getElementById('editUserPopup').style.display = 'none';
}
