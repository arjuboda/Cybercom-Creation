function getURLParams() {
    let params = {};
    let urlParams = new URLSearchParams(window.location.search);
    for (let [key, value] of urlParams) {
        params[key] = value;
    }
    return params;
}

// Retrieve URL parameters
let params = getURLParams();

// Pre-fill form fields with product data
document.getElementById('hidProductId').value = params.productId || '';
document.getElementById('txtProductTitle').value = params.title || '';
document.getElementById('numPrice').value = params.price || '';
document.getElementById('description').value = params.description || '';
document.getElementById('category').value = params.category || '';

$(document).ready(function () {
    $('#productForm').submit(function (event) {
        event.preventDefault();

        // Function to display error message and validate form fields
        function displayError() {
            let error = false;
            let productTitle = $('#txtProductTitle').val();
            if (productTitle === '') {
                $('#txtProductTitle').addClass('red-border');
                error = true;
            }
            let productPrice = $('#numPrice').val();
            if (productPrice === '') {
                $('#numPrice').addClass('red-border');
                error = true;
            }
            let description = $('#description').val();
            if (description === '') {
                $('#description').addClass('red-border');
                error = true;
            }
            let category = $('#category').val();
            if (category === '') {
                $('#category').addClass('red-border');
                error = true;
            }
            return error;
        }

        if (displayError()) {
            alert('Please fill all the fields');
        } else {
            let existingData = JSON.parse(localStorage.getItem('productData')) || [];
            if (params.productId) {
                // Editing existing product
                let index = existingData.findIndex(product => product.productId === params.productId);
                if (index !== -1) {
                    existingData[index] = {
                        productId: params.productId,
                        productTitle: $('#txtProductTitle').val(),
                        productPrice: $('#numPrice').val(),
                        description: $('#description').val(),
                        category: $('#category').val()
                    };
                }
            } else {
                // Adding new product
                let productId = generateUniqueId();
                let newData = {
                    productId: productId,
                    productTitle: $('#txtProductTitle').val(),
                    productPrice: $('#numPrice').val(),
                    description: $('#description').val(),
                    category: $('#category').val()
                };
                existingData.push(newData);
            }
            // Save updated data back to local storage
            localStorage.setItem('productData', JSON.stringify(existingData));
            window.open('displayData.html');
        }
    });

    // Function to generate unique ID
    function generateUniqueId() {
        return '_' + Math.random().toString(36).substr(2, 9);
    }

    // Event listener to remove red border on input
    $('.container').on('input select textarea', '.red-border', function () {
        if ($(this).val() !== '') {
            $(this).removeClass('red-border');
        }
    });
});
