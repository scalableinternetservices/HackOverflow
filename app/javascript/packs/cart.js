window.addQuantity = function () {
    alert("add quantity");

}

window.placeOrder = function () {
    //alert("reduce quantity");

}

window.changeQuantity = function (selectElement) {
    const id = selectElement.id.split('_');
    var costField = document.getElementById("cost_"+id[1]);
    var priceField = document.getElementById("price_"+id[1]);
    var totalField = document.getElementById("totalCost");
    
    var prevCost = parseInt(costField.innerText.split("$")[1]);
    var currTotal = parseInt(totalField.innerText.split("$")[1]);
    
    var newCost = priceField.innerText.split("$")[1] * selectElement.value

    costField.innerHTML = "<b>" + costField.innerText.split("$")[0] + "$" + newCost + "</b>";

    var diff = newCost - prevCost;
    var newTotal = currTotal + diff;

    totalField.innerHTML = "<b>" + totalField.innerText.split("$")[0] + "$" + newTotal + "</b>";

}