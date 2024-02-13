
document.addEventListener('DOMContentLoaded', function () {
    let loginButton = document.getElementById('btnLogin');
    let SignUpButton = document.getElementById('btnSignUp');
    loginButton.addEventListener('click', () => {
        location.href = 'loginForm.html'
    });
    SignUpButton.addEventListener('click', () => {
        location.href = 'RegistrationForm.html'
    });
})


