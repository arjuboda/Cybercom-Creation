// Update functionality
function updateProduct(productId) {
    const storedProducts = JSON.parse(localStorage.getItem('products'));
    const productToUpdate = storedProducts.find(product => product.id === productId);

    // Fill the update form with current product details
    document.getElementById('updateTitle').value = productToUpdate.title;
    document.getElementById('updateCategory').value = productToUpdate.category;
    document.getElementById('updateDescription').value = productToUpdate.description;
    document.getElementById('updateDiscount').value = productToUpdate.discountPercentage;
    document.getElementById('updatePrice').value = productToUpdate.price;
    document.getElementById('updateRating').value = productToUpdate.rating;

    // Display the update form
    document.getElementById('updatePopup').style.display = 'block';

    // Update form submission
    document.getElementById('updateForm').addEventListener('submit', function (event) {
        event.preventDefault();

        // Update the product details with form values
        productToUpdate.title = document.getElementById('updateTitle').value;
        productToUpdate.category = document.getElementById('updateCategory').value;
        productToUpdate.description = document.getElementById('updateDescription').value;
        productToUpdate.discountPercentage = parseFloat(document.getElementById('updateDiscount').value);
        productToUpdate.price = parseFloat(document.getElementById('updatePrice').value);
        productToUpdate.rating = parseFloat(document.getElementById('updateRating').value);

        // Update the product on the server
        fetch(`https://your-api-url/products/${productId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(productToUpdate),
        })
            .then(response => response.json())
            .then(updatedProduct => {
                // Find the index of the updated product in storedProducts
                const index = storedProducts.findIndex(product => product.id === productId);
                // Update the product in storedProducts array
                storedProducts[index] = updatedProduct;
                // Update local storage with the updated products
                localStorage.setItem('products', JSON.stringify(storedProducts));
                // Close the update form
                document.getElementById('updatePopup').style.display = 'none';
                // Redisplay products
                displayProducts(storedProducts);
            })
            .catch(error => console.error('Error updating product:', error));
    });
}

// Delete functionality
// function deleteProduct(productId) {
//     const confirmMsg = confirm('Are you sure you want to delete the item?');
//     if (confirmMsg) {
//         // Delete the product from the server
//         fetch(`https://your-api-url/products/${productId}`, {
//             method: 'DELETE',
//         })
//             .then(response => {
//                 if (response.ok) {
//                     // Remove the product from the storedProducts array
//                     const updatedProducts = storedProducts.filter(product => product.id !== productId);
//                     // Update local storage with the updated products
//                     localStorage.setItem('products', JSON.stringify(updatedProducts));
//                     // Redisplay products
//                     displayProducts(updatedProducts);
//                 } else {
//                     console.error('Failed to delete product');
//                 }
//             })
//             .catch(error => console.error('Error deleting product:', error));
//     }
// }
function deleteProduct(productId) {
    const confirmMsg = confirm('Are you sure you want to delete the item?');
    if (confirmMsg) {
        // Attempt to delete the product from the server
        fetch(`https://your-api-url/products/${productId}`, {
            method: 'DELETE',
        })
            .then(response => {
                if (response.ok) {
                    // If deletion is successful, refresh the product list
                    fetch('https://your-api-url/products')
                        .then(res => res.json())
                        .then(data => {
                            // Update the UI with the updated product list
                            displayProducts(data.products);
                        })
                        .catch(error => console.error('Error fetching products:', error));
                } else {
                    // If deletion from API fails, store the deleted item in local storage
                    const deletedData = JSON.parse(localStorage.getItem('deletedData')) || [];
                    const deletedItem = storedProducts.find(product => product.id === productId);
                    deletedData.push(deletedItem);
                    localStorage.setItem('deletedData', JSON.stringify(deletedData));
                    console.error('Failed to delete product');
                }
            })
            .catch(error => console.error('Error deleting product:', error));
    }
}

// Check if products exist in local storage
const storedProducts = localStorage.getItem('products');

if (storedProducts && JSON.parse(storedProducts).length > 0) {
    // If products exist in local storage, parse and display them
    displayProducts(JSON.parse(storedProducts));
} else {
    // If products don't exist in local storage, fetch and then store
    fetch('https://dummyjson.com/products')
        .then(res => res.json())
        .then(data => {
            // Store products in local storage
            localStorage.setItem('products', JSON.stringify(data.products));
            // Display products
            displayProducts(data.products);
        })
        .catch(error => console.error('Error fetching products:', error));
}

function displayProducts(products, page = 1) {
    const productList = document.getElementById('productList');
    const pagination = document.getElementById('pagination');
    productList.innerHTML = ''; // Clear previous content
    pagination.innerHTML = ''; // Clear previous pagination

    // Retrieve the search query
    const searchQuery = document.getElementById('searchInput').value.toLowerCase();

    const sortCriteria = document.getElementById('sortCriteria').value;

    let filteredProducts = products.filter(product => {
        return searchQuery === '' || product.title.toLowerCase().includes(searchQuery);
    });

    // Sorting
    if (sortCriteria === 'priceAsc') {
        filteredProducts.sort((a, b) => a.price - b.price);
    } else if (sortCriteria === 'priceDesc') {
        filteredProducts.sort((a, b) => b.price - a.price);
    }

    const itemsPerPage = 6;
    const startIndex = (page - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const paginatedProducts = filteredProducts.slice(startIndex, endIndex);

    paginatedProducts.forEach(product => {
        const productDiv = document.createElement('div');
        productDiv.classList.add('product');
        const leftPartProductDiv = document.createElement('div');
        leftPartProductDiv.classList.add('leftPart');
        const image = document.createElement('img');
        image.src = product.thumbnail;
        image.alt = product.title;
        leftPartProductDiv.appendChild(image);
        const Category = document.createElement('p');
        Category.textContent = `Category: ${product.category}`;
        leftPartProductDiv.appendChild(Category);
        productDiv.appendChild(leftPartProductDiv);

        const rightPartProductDiv = document.createElement('div');
        rightPartProductDiv.classList.add('rightPart');

        const title = document.createElement('h2');
        title.textContent = product.title;
        rightPartProductDiv.appendChild(title);

        const description = document.createElement('p');
        description.textContent = `Description: ${product.description}`;
        description.style.padding = '10px'
        rightPartProductDiv.appendChild(description);

        const discount = document.createElement('p');
        discount.textContent = `Discount: ${product.discountPercentage}%`;
        rightPartProductDiv.appendChild(discount);

        const price = document.createElement('p');
        price.textContent = `Price: $${product.price}`;
        rightPartProductDiv.appendChild(price);

        const rating = document.createElement('p');
        rating.textContent = `Rating: ${product.rating}`;
        rightPartProductDiv.appendChild(rating);

        productDiv.appendChild(rightPartProductDiv);
        let deleteBtn = document.createElement('button');
        deleteBtn.textContent = `Delete`;
        deleteBtn.classList.add('btnDel');
        deleteBtn.addEventListener('click', function () {

            let confirmMsg = confirm('are you sure, you want to delete the item? ');
            if (confirmMsg) {
                // Remove the product from the filtered products
                filteredProducts = filteredProducts.filter(p => p.id !== product.id);
                // Update local storage with the updated products
                // localStorage.setItem('products', JSON.stringify(filteredProducts));
                // Redisplay products
                displayProducts(filteredProducts, currentPage);

            }
        });
        rightPartProductDiv.appendChild(deleteBtn);
        // Update button
        let updateBtn = document.createElement('button');
        updateBtn.textContent = `Update`;
        updateBtn.classList.add('btnUpdate');
        updateBtn.dataset.productId = product.id;
        rightPartProductDiv.appendChild(updateBtn);


        productList.appendChild(productDiv);
    });
    let currentPage = 1;

    // Pagination
    const totalPages = Math.ceil(filteredProducts.length / itemsPerPage);
    for (let i = 1; i <= totalPages; i++) {
        const pageButton = document.createElement('button');
        pageButton.textContent = i;
        pageButton.addEventListener('click', function () {
            currentPage = i; // Update the current page
            displayProducts(products, currentPage);
            // Remove active class from previously active button
            const activeButton = document.querySelector('#pagination button.active');
            if (activeButton) {
                activeButton.classList.remove('active');
            }
            // Add active class to the clicked button
            pageButton.classList.add('active');
        });
        // Add active class to the current page button
        if (currentPage === i) {
            pageButton.classList.add('active');
        }
        pagination.appendChild(pageButton);
    }
}
