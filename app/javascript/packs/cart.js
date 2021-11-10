var removedItems = [];

window.addQuantity = function () {
    alert("add quantity");
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

window.placeOrder = function (value) {

    var requestArray = [];
    var ids = value.split(',');
    ids = ids.filter( function( id ) {
        return !removedItems.includes( id );
      });
    for(id of ids) {
        var quant = document.getElementById("quantity_"+id).value;
        var obj = {"item_id": id, "quantity": quant};
        requestArray.push(obj);
    }
    document.getElementById("requestparam").value = JSON.stringify({body: requestArray});
    removedItems = [];

}

window.removeItem = function (e, deleteItem) {
    e.preventDefault();
    const id = deleteItem.id.split('_');
    removedItems.push(id[1]);

    var costField = document.getElementById("cost_"+id[1]);
    var totalField = document.getElementById("totalCost");
    
    var prevCost = parseInt(costField.innerText.split("$")[1]);
    var currTotal = parseInt(totalField.innerText.split("$")[1]);

    var newTotal = currTotal - prevCost;

    totalField.innerHTML = "<b>" + totalField.innerText.split("$")[0] + "$" + newTotal + "</b>";

    document.getElementById("item_"+id[1]).remove();

    if(newTotal == 0) {
        document.getElementById("address_div").remove();
        document.getElementById("place_order").addClass("disabled");
    }
    e.preventDefault();
}
