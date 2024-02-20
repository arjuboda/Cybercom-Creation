let patientData = JSON.parse(localStorage.getItem('patientData'));
let doctorData = JSON.parse(localStorage.getItem('doctorData'));
let currentPatient = {};
let currentDoctor = {};

function redirectToDashboard() {
    let userName = document.getElementById('emlEmail').value;
    let password = document.getElementById('pswPassword').value;

    if (userName === '' || password === '') {
        alert('Please fill all the fields');
    } else {
        let patientFound = false;
        let doctorFound = false;

        patientData.forEach(element => {
            if (element.email === userName && element.password === password) {
                patientFound = true;
                currentPatient.id = element.id;
                currentPatient.name = element.name;
                localStorage.setItem('currentPatient', JSON.stringify(currentPatient));
                location.href = 'patientDashboard.html';
            } else if (element.email === userName) { //email matched but not password
                patientFound = true;
                document.getElementById('pswPassword').style.border = '2px solid red'
                alert('Password not match!');
            }
        });

        if (!patientFound) { // If patient not found, check doctor data
            doctorData.forEach(element => {
                if (element.email === userName && element.password === password) {
                    doctorFound = true;
                    currentDoctor.id = element.id;
                    currentDoctor.name = element.name;
                    localStorage.setItem('currentDoctor', JSON.stringify(currentDoctor));
                    location.href = 'doctorDashboard.html';
                } else if (element.email === userName) { //email matched but not password
                    doctorFound = true;
                    document.getElementById('pswPassword').style.border = '2px solid red'
                    alert('Password not match!');
                }
            });
        }
        if (!doctorFound && !patientFound) {
            // If not found in both patient and doctor data
            alert('User not found!');
            let permission = confirm('You want to register your self?');
            if (permission) {
                location.href = 'RegistrationForm.html'
            }
        }
    }
}
