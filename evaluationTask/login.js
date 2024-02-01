
function openRegistrationPage() {
    // alert('hrllo');
    window.location.href = 'registration.html'
}
function redirectToDashboard() {
    // alert();
    // let Name = localStorage.getItem('userEmail');
    // let password = localStorage.getitem('userPassword');
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
        window.location.href = 'user.html';
    }
}
