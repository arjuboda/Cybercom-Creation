
function openRegistrationPage() {
    // alert('hrllo');
    window.location.href = 'registration.html'
}
let currentUserName;
let currentUserBirthDate;

// $('#loginForm').submit(function () {
function redirectToDashboard() {
    let emlEmail = document.getElementById('emlEmail').value;
    let pswPassword = document.getElementById('pswPassword').value;
    let adminEmail = 'admin@abc.com';
    let adminPassword = 'admin';
    if (emlEmail == '' || pswPassword == '') {
        alert('please fill the fields')
    }
    else if (emlEmail === adminEmail && pswPassword == adminPassword) {
        window.location.href = 'adminDashboard.html';
    }
    else {
        let nameFind = false;
        let passwordFails = false;
        let emlEmail = document.getElementById('emlEmail').value;
        let pswPassword = document.getElementById('pswPassword').value;
        let UserData = JSON.parse(localStorage.getItem('userData')) || [];
        // console.log("Email:", emlEmail);
        // console.log("Password:", pswPassword);
        // console.log("UserData:", UserData);
        UserData.forEach(element => {
            if (element.userEmail == emlEmail && element.userPassword == pswPassword) {
                currentUserName = element.userName;
                currentUserBirthDate = element.userBirthDate;
                nameFind = true;
            }
            else if (element.userEmail == emlEmail) {
                passwordFails = true;
            }
        });

        if (nameFind) {
            JSON.stringify(sessionStorage.setItem('currentUserName', currentUserName));
            JSON.stringify(sessionStorage.setItem('currentUserBirthDate', currentUserBirthDate));
            window.location.href = 'userDashboard.html';
        }
        else if (passwordFails) {
            alert('check your email id and password');
            event.preventDefault();
        }
        else {
            alert('First Register Your self');
            window.location.href = 'registration.html';
        }
    }
}
