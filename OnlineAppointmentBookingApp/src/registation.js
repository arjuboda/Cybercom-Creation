let patientName = document.getElementById('txtPatientName');
let patientEmail = document.getElementById('emlPatientEmail')
let patientPassword = document.getElementById('pswPatientPassword');
let patientCity = document.getElementById('txtPatientCity');

let doctorName = document.getElementById('txtDoctorName');
let doctorEmail = document.getElementById('emlDoctorEmail');
let doctorPassword = document.getElementById('pswDoctorPassword');
let doctorCity = document.getElementById('txtDoctorCity');

//handle tab for registartion page
function openTab(tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}
function generateId() {
    return '_' + Math.random().toString(36).substr(2, 9);
}
function patientValidation() {
    let error = false;
    if (patientName.value === '') {
        $('#txtPatientName').addClass('red-border');
        error = true;
    }

    if (patientEmail.value === '') {
        $('#emlPatientEmail').addClass('red-border');
        error = true;
    }

    if (patientPassword.value === '') {
        $('#pswPatientPassword').addClass('red-border');
        error = true;
    }
    if (patientCity.value === '') {
        $('#txtPatientCity').addClass('red-border');
        error = true;
    }
    return error;
}
function validatePatient() {
    if (patientValidation()) {
        alert('check the errors')
    }
    else {
        let patientData = JSON.parse(localStorage.getItem('patientData')) || [];
        let newData = {
            id: generateId(),
            name: patientName.value,
            email: patientEmail.value,
            password: patientPassword.value,
            city: patientCity.value
        }
        patientData.push(newData);
        localStorage.setItem('patientData', JSON.stringify(patientData));
        location.href = 'loginForm.html'
    }
}

function doctorValidation() {
    let error = false;
    if (doctorName.value === '') {
        $('#txtDoctorName').addClass('red-border');
        error = true;
    }

    if (doctorEmail.value === '') {
        $('#emlDoctorEmail').addClass('red-border');
        error = true;
    }
    // if (doctorPassword.value === '') {
    //     $('#pswDoctorPassword').addClass('red-border');
    //     error = true;
    // }

    if (doctorCity.value === '') {
        $('#txtDoctorCity').addClass('red-border');
        error = true;
    }
    return error;
}
function validateDoctor() {
    if (doctorValidation()) {
        alert('check the errors')
    }
    else {
        let doctorData = JSON.parse(localStorage.getItem('doctorData')) || [];
        let newData = {
            id: generateId(),
            name: doctorName.value,
            email: doctorEmail.value,
            password: doctorPassword.value,
            city: doctorCity.value
        }
        doctorData.push(newData);
        localStorage.setItem('doctorData', JSON.stringify(doctorData));
        location.href = 'loginForm.html'
    }
}
// Event listener to remove red border on input
$('.container').on('input', '.red-border', function () {
    if ($(this).val() !== '') {
        $(this).removeClass('red-border');
    }
});