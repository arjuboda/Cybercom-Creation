
function openRegistrationPage() {
    window.location.href = 'registration.html'
}

// Function to get current  time for a user login
function storeLoginTime(userid) {
    let date = new Date();
    let time = date.toString().split(' ')[4];
    return time; //return current time
}

let currentUserName;
let currentUserBirthDate;
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

        UserData.forEach(element => {
            if (element.userEmail == emlEmail && element.userPassword == pswPassword) {
                currentUserName = element.userName;
                currentUserBirthDate = element.userBirthDate;
                element.userLoginTime = storeLoginTime(element.userId); //set login time
                nameFind = true;
            }
            else if (element.userEmail == emlEmail) { //email matched but not password
                passwordFails = true;
            }
        });

        if (nameFind) { //email and password both matched
            JSON.stringify(sessionStorage.setItem('currentUserName', currentUserName));
            JSON.stringify(sessionStorage.setItem('currentUserBirthDate', currentUserBirthDate));
            localStorage.setItem('userData', JSON.stringify(UserData));
            window.location.href = 'userDashboard.html';
        }
        else if (passwordFails) {
            alert('Email Id and Password not matched');
            event.preventDefault();
        }
        else { //if email not matched then redirect to register page
            alert('First Register Your self');
            window.location.href = 'registration.html';
        }
    }
}
