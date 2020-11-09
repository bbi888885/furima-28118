function calculate() {
  const priceInput = document.getElementById("item-price")
  //入力する時、下記のアクションを発火させる
  priceInput.addEventListener("input", doCalculate);
  
  function doCalculate() {
    // 値の取得
    var numData = document.getElementById("item-price").value;
    // 手数料の計算
    var numTax = Math.round(numData * 0.1);
    // 販売利益の計算
    var numProfit = numData - numTax;
    // カンマ付与(フォーマット)
    numTax = dataFormatPrice(numTax);
    numProfit = dataFormatPrice(numProfit);
    //HTMLに入力させる
    document.getElementById("add-tax-price").innerHTML = numTax;
    document.getElementById("profit").innerHTML = numProfit;
    }

  function dataFormatPrice(numTax) {
    var data = "";
    var nData = new String(numTax); //数値に変更
    for(i=nData.length-3;i>0;i-=3) {
      data = ','+nData.substr(i,3)+data;
    }
    data = nData.substr(0,i+3)+data;
    return data;
  }
  function dataFormatPrice(numProfit) {
    var data = "";
    var nData = new String(numProfit); //数値に変更
    for(i=nData.length-3;i>0;i-=3) {
      data = ','+nData.substr(i,3)+data;
    }
    data = nData.substr(0,i+3)+data;
    return data;
  }  
}

window.addEventListener("load", calculate);