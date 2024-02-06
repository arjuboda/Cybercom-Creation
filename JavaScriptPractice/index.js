function decreaseValue(elementId) {
    let itemCountElement = document.getElementById(elementId);
    let itemCount = parseInt(itemCountElement.textContent);
    if (itemCount > 0) {
        itemCount--;
        itemCountElement.textContent = itemCount;
    }
}

function increaseValue(elementId) {
    let itemCount = document.getElementById(elementId);
    let Count = parseInt(itemCount.textContent);
    Count++;
    itemCount.textContent = Count;
}

function generateId() {
    let id = new Date().getTime();
    return id;
}

document.addEventListener('DOMContentLoaded', function () {
    let btnSubmit = document.getElementById('btnBuy');

    btnSubmit.addEventListener('click', function (event) {
        let items = [];
        let orderId = generateId();
        items.push(orderId);
        // Retrieve existing items from localStorage, if any
        // let existingItems = localStorage.getItem('Item');
        // if (existingItems) {
        //     items = JSON.parse(existingItems);
        // }

        let firstItemElement = document.getElementById('firstItem');
        let firstItemCount = parseInt(firstItemElement.textContent);
        let firstItem = {
            name: 'Strandmond',
            count: parseInt(firstItemCount),
            price: 295
        };
        items.push(firstItem);

        let secondItemElement = document.getElementById('secondItem');
        let secondItemCount = parseInt(secondItemElement.textContent);
        let secondItem = {
            name: 'Nockeby',
            count: parseInt(secondItemCount),
            price: 299
        };
        items.push(secondItem);

        let thirdItemElement = document.getElementById('thirdItem');
        let thirdItemCount = parseInt(thirdItemElement.textContent);
        let thirdItem = {
            name: 'Mellby',
            count: parseInt(thirdItemCount),
            price: 749
        };
        items.push(thirdItem);

        localStorage.setItem('Item', JSON.stringify(items));
        location.href = 'cart.html';
    });
});
