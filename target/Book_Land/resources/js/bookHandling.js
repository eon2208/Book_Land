function saveToCart(id) {
    console.log("inside saveToCart");
    let cart = JSON.parse(localStorage.getItem("cart"));
    if (cart == null) {
        cart = [];
    }
    let item = {};
    item.id = id;
    item.quantity = document.getElementById("quantity").value;
    cart.push(item);
    localStorage.setItem("cart", JSON.stringify(cart));
}

function emptyCartMassage() {
    alert("Cart is Empty")
}

function notLoggedMessage() {
    alert("You have to Login first")
}

function customMassage() {
    alert("customMassage")
}

function orderSuccess() {
    alert("Order Completed")
}


