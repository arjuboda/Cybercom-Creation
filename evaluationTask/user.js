 // Retrieve data from local storage and display in table
 document.addEventListener('DOMContentLoaded', function() {
    // Function to generate unique ID
    function displayLocalstorageData(){
        let userData = JSON.parse(localStorage.getItem('userData')) || [];
        let tableBody = document.querySelector('#UserData tbody');

        userData.forEach(user => {
            let row = document.createElement('tr');
            row.innerHTML = `
                <td>${user.userName}</td>
                <td>${user.userEmail}</td>
                <td>${user.userPassword}</td>
                <td>${user.userBirthDate}</td>
                <td>-</td>
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
    function addNewUser(){
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
    function deleteUser(userName, button) {
        let UserData = JSON.parse(localStorage.getItem('userData')) || [];
        let userData = UserData.filter(user => user.userName !== userName);
        localStorage.setItem('userData', JSON.stringify(userData));
        
        // Remove row from the table
        let row = button.closest('tr');
        row.parentNode.removeChild(row);
    }
    $('#btnAddUser').click(function(){
        addNewUser();
    });
    displayLocalstorageData();

});
                   



// function editUser(userId) {
   
//     let userData = JSON.parse(localStorage.getItem('userData')) || [];
//     let userID = userData.findIndex(user => user.userID === userID);

//     if (userID !== -1) {
//         let user = userData[userID];
//         let updateUser = {
//             userID: user.userID,
//             userName: user.userName,
//             userEmail: user.userEmail,
//             userPassword: user.userPassword
//         };

//     }    
// }