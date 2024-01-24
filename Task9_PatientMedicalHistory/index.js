function displayDays() {
    var dayDropdown = document.getElementById("day");
    for (var i = 1; i <= 31; i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = i;
        dayDropdown.add(option);
    }
}
function displayMonths() {
    var monthDropdown = document.getElementById("month");
    var months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
    ];
    for (var i = 0; i < months.length; i++) {
        var option = document.createElement("option");
        option.value = i + 1;
        option.text = months[i];
        monthDropdown.add(option);
    }
}
function displayYears() {
    var yearDropdown = document.getElementById("year");
    var currentYear = new Date().getFullYear();
    var startYear = currentYear - 100; 
    for (var i = currentYear; i >= startYear; i--) {
        var option = document.createElement("option");
        option.value = i;
        option.text = i;
        yearDropdown.add(option);
    }
}
displayDays();
displayMonths();
displayYears();


$(document).ready(function() {

    function validateForm() {
        var isValid = true;
        // Validate gender
        var selectedGender = $('#selGender').val();
        if (selectedGender === '') {
            $('#selGender').after('<div class="error-message">Please select Patient Gender</div>');
                isValid = false;
        }
        // Validate first name
        var firstName = $('#txtFirstName').val();
        if (firstName === '') {
            $('#txtFirstName').after('<div class="error-message">Please enter Patient First Name</div>');
                isValid = false;
        }
        // Validate last name
        var lastName = $('#txtLastName').val();
        if (lastName === '') {
            $('#txtLastName').after('<div class="error-message">Please enter Patient Last Name</div>');
                isValid = false;
        }
        // Validate birth date (you can add your date logic here)
        var selectedMonth = $('#month').val();
        var selectedDay = $('#day').val();
        var selectedYear = $('#year').val();
        if (selectedMonth === '' || selectedDay === '' || selectedYear === '') {
            $('#year').after('<div class="error-message">please select date, day and year</div>');
            isValid = false;
        }

        // Validate Patient Height
        var patientHeight = $('#numPatientHeight').val();
        if (patientHeight === '' || isNaN(patientHeight)) {
            $('#numPatientHeight').after('<div class="error-message">Please enter a valid Patient Height</div>');
            isValid = false;
        }

        // Validate Patient Weight
        var patientWeight = $('#numPatientWeight').val();
        if (patientWeight === '' || isNaN(patientWeight)) {
            $('#numPatientWeight').after('<div class="error-message">Please enter a valid Patient Weight</div>');
            isValid = false;
        }

        // Validate Patient Email
        var patientEmail = $('#emlPatientEmail').val();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (patientEmail === '' || !emailRegex.test(patientEmail)) {
            $('#emlPatientEmail').after('<div class="error-message">Please enter a valid Patient Email</div>');
            isValid = false;
        }
        
        
        // Validate Reason
        var reason = $('#txtReason').val();
        if (reason === '') {
            $('#txtReason').after('<div class="error-message">Please enter a Reason</div>');
            isValid = false;
        }

        return isValid;
    }

    $('#patientInfoForm').submit(function(e) {
        e.preventDefault(); 

        if (validateForm()) {
            alert('Form is valid. Submitting data...');
        } else {
            alert('Please fix the form errors before submitting.');
        }
    });
});
