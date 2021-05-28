window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  // 入力するたびにイベントを発火
  priceInput.addEventListener("input", () => {
    // 入力した金額の値を取得
    const inputValue = priceInput.value;

    // HTML要素にしている
    const addTaxDom = document.getElementById("add-tax-price");
    // innerHTMLでHTML要素の書き換え
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const profitNumber = document.getElementById("profit")
    const addTaxDom1 = inputValue * 0.1
    profitNumber.innerHTML = (Math.floor(inputValue - addTaxDom1));
  });
});