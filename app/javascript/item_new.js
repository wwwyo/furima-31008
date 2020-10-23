function calc() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");
    const tax = itemPrice.value * 0.1;
    const profit = itemPrice.value - tax;
    addTaxPrice.innerHTML = tax;
    addProfit.innerHTML = profit;
  });
}

window.addEventListener("load", calc);