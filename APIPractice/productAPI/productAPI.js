let apiData = []; // Global variable to store all products from the API
var filteredData = [];
let currentPage = 1; // Initialize current page
const productsPerPage = 12; // Number of products per page
const url = 'https://api.escuelajs.co/api/v1/products';

function filterByCategory(keyword, data) {
    return data.filter(product =>
        product.title.toLowerCase().includes(keyword.toLowerCase()) ||
        product.description.toLowerCase().includes(keyword.toLowerCase()) ||
        product.category.name.toLowerCase().includes(keyword.toLowerCase())
    );
}

// Function to perform search when the search button is clicked
function performSearch() {
    const keyword = document.getElementById('txtSearchcategory').value.trim();
    const filteredProducts = filterByCategory(keyword, apiData); // Pass the entire API data
    displayData(currentPage, filteredProducts);
    renderPagination(filteredProducts);
}
// Event listener for the search button
const searchButton = document.getElementById('btnSearch');
searchButton.addEventListener('click', performSearch);


function sortProducts(order) {
    apiData.sort((a, b) => {
        return order === 'asc' ? a.price - b.price : b.price - a.price;
    });
}
// Function to fetch data from the API
function fetchData(url) {
    const loadingSpinner = document.querySelector('.loading-spinner');
    loadingSpinner.style.display = 'block';
    fetch(url)
        .then(response => response.json())
        .then(data => {
            apiData = data; // Store all products from the API in apiData
            console.log(data)
            sortProducts('asc'); // Sort products initially (default: low to high)
            displayData(currentPage, apiData); // Display products for the current page
            renderPagination(); // Render pagination buttons
            loadingSpinner.style.display = 'none';
        })
        .catch(error => {
            console.error('Error fetching data:', error);
            loadingSpinner.style.display = 'none';
        });
}

// Function to display products for a specific page
function displayData(page, products) {
    if (products.length == 0) {
        alert('no items found!');
        return;
    }
    const container = document.querySelector('.container');
    container.innerHTML = ''; // Clear container before displaying new products

    const startIndex = (page - 1) * productsPerPage;
    const endIndex = startIndex + productsPerPage;
    const productsToDisplay = products.slice(startIndex, endIndex);

    productsToDisplay.forEach(element => {

        let container = document.getElementsByClassName('container')[0];
        let cartContainer = document.createElement('div');
        cartContainer.classList.add('cartContainer');

        let cartID = document.createElement('p');
        cartID.classList.add('cartID');
        cartID.innerText = `ID:${element.id}`;
        cartContainer.appendChild(cartID);

        let cartTitle = document.createElement('h3');
        cartTitle.classList.add('cartTitle');
        cartTitle.innerText = `${element.title}`;
        cartContainer.appendChild(cartTitle);
        // console.log(element.images[1]);
        // let cartItemImage = document.createElement('img');
        // cartItemImage.classList.add('cartItemImage');
        // cartItemImage.src = element.images[1];
        // cartItemImage.alt = element.title;
        // cartContainer.appendChild(cartItemImage);

        let cartItemPrice = document.createElement('p');
        cartItemPrice.classList.add('cartItemPrice');
        cartItemPrice.innerText = `$${element.price}`;
        cartContainer.appendChild(cartItemPrice);

        let cartItemDescription = document.createElement('p');
        cartItemDescription.classList.add('cartItemDescription');
        cartItemDescription.innerText = `${element.description}`;
        cartContainer.appendChild(cartItemDescription);

        let cartItemCategory = document.createElement('p');
        cartItemCategory.classList.add('cartItemCategory');
        cartItemCategory.innerText = `Category : ${element.category.name}`;
        cartContainer.appendChild(cartItemCategory);

        //delete button
        let cartDeletBtn = document.createElement('button');
        cartDeletBtn.classList.add('cartDeletBtn');
        cartDeletBtn.innerHTML = `DELETE`;
        cartDeletBtn.onclick = function () {
            // alert('deleted')
            let permision = confirm('are you sure, you want to delete the product?');
            if (permision) {
                fetch(`https://api.escuelajs.co/api/v1/products/${element.id}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                    .then((response) => {
                        if (!response.ok) {
                            throw new Error('DELETE request failed');
                        }
                        console.log('Deleted successfully');
                        location.reload();
                    })
                    .catch(error => {
                        console.error('There was a problem with the DELETE request:', error);
                    });

            }

        }
        cartContainer.appendChild(cartDeletBtn);

        //update button
        let cartupdateBtn = document.createElement('button');
        cartupdateBtn.classList.add('cartupdateBtn');
        cartupdateBtn.innerHTML = `UPDATE`;
        cartupdateBtn.onclick = function () {
            location.href = `productAPIUpdateForm.html?id=${element.id}`
        }
        cartContainer.appendChild(cartupdateBtn);

        container.appendChild(cartContainer);
    });
}

// Event listener for sorting select
const sortSelect = document.getElementById('sortSelect');
sortSelect.addEventListener('change', function () {
    const selectedOption = this.value;
    sortProducts(selectedOption);
    displayData(currentPage, apiData);
});
// Function to render pagination buttons
function renderPagination(filteredData) {
    // alert(filteredData)
    const paginationContainer = document.querySelector('.paginationContainer');
    paginationContainer.innerHTML = ''; // Clear pagination container before rendering
    const dataToPaginate = filteredData && filteredData.length > 0 ? filteredData : apiData; // Check if filteredData is defined
    //    alert(dataToPaginate)
    const totalPages = Math.ceil(dataToPaginate.length / productsPerPage);
    for (let i = 1; i <= totalPages; i++) {
        const button = document.createElement('button');
        button.textContent = i;
        button.addEventListener('click', function () {
            currentPage = i; // Update current page when a pagination button is clicked
            displayData(currentPage, apiData); // Display products for the selected page
        });
        paginationContainer.appendChild(button);
    }
}

// Initial call to fetch data
fetchData(url);
