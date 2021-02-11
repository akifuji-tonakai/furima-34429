function calc() {
  const priceInt = document.getElementById("item-price");
  priceInt.addEventListener("input", () => {
    const priceInput = priceInt.value
    const itemFee = document.getElementById("add-tax-price");
    const itemProfit = document.getElementById("profit");
    itemFee.innerHTML = `${Math.floor(priceInput * 0.1)}`;
    itemProfit.innerHTML = `${Math.floor(priceInput * 0.9)}`;

  });

}
window.addEventListener('load', calc);