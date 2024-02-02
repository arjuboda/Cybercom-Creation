let userName = document.getElementById('txtName');
let userEmail = document.getElementById('emlEmail')
let userPassword = document.getElementById('pswPassword');
let userConfirmPassword = document.getElementById('pswConfirmPassword');
let userBirthDate = document.getElementById('dtBirthDate');
let UserCity = document.getElementById('selCity');
let userState = document.getElementById('selState');
let checkedCondition = document.getElementById('chkBxTermsAndConditions');
let registartionBtn = document.getElementById('btnRegister');

function displayError() {
    let error = false;
    if (userName.value === '') {
        $('#txtName').addClass('red-border');
        error = true;
    }

    if (userEmail.value === '') {
        $('#emlEmail').addClass('red-border');
        error = true;
    }

    if (userPassword.value === '') {
        $('#pswPassword').addClass('red-border');
        error = true;
    }
    if (userBirthDate.value == null) {
        $('#dtBirthDate').addClass('red-border');
        error = true;

    }
    if (UserCity.value === '') {
        $('#selCity').addClass('red-border');
        error = true;
    }
    if (userState.value === '') {
        $('#selState').addClass('red-border');
        error = true;
    }
    if (checkedCondition.checkedCondition == false) {
        $('#chkBxTermsAndConditions').after('<div class="error-message">Please accept the terms and condition</div>');
        error = true;
    }
    return error;
}
function generateId() {
    return '_' + Math.random().toString(36).substr(2, 9);
}

// function addUserDataToLocalStorage() {
//     let userData = JSON.parse(localStorage.getItem('userData')) || [];
//     let userId = generateId();
//     let newData = {
//         userId: userId,
//         userName: $('#txtName').val(),
//         userEmail: $('#emlEmail').val(),
//         userPassword: $('#pswPassword').val(),
//         userBirthDate: $('#dtBirthDate').val()
//     };
//     userData.push(newData);
//     localStorage.setItem('userData', JSON.stringify(userData));
// }
function addUserDataToLocalStorage() {
    // let userData = JSON.parse(localStorage.getItem('userData')) || [];
    let userData = JSON.parse(localStorage.getItem('userData'));
    if (!Array.isArray(userData)) {
        userData = []; // Initialize as empty array if not an array
    }
    let userId = generateId();
    let newData = {
        userId: userId,
        userName: $('#txtName').val(),
        userEmail: $('#emlEmail').val(),
        userPassword: $('#pswPassword').val(),
        userBirthDate: $('#dtBirthDate').val()
    };
    userData.push(newData);
    localStorage.setItem('userData', JSON.stringify(userData));
}


function validateUser() {

    if (displayError()) {
        alert('check the errors!');
    } else {
        if (userName.value == 'admin') {
            registartionBtn.style.visibility = 'hidden';
        }
        else {
            addUserDataToLocalStorage();

        }
        window.open('login.html');
    }
}
// Event listener to remove red border on input
$('.container').on('input select textarea', '.red-border', function () {
    if ($(this).val() !== '') {
        $(this).removeClass('red-border');
    }
});

