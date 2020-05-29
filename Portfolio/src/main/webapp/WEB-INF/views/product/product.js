function addCart() {
	document.form.action = "add_cart";
	document.form.submit();
}

function change(cnt, price) {
	var x = document.form;
	var y = Number(x.quantity.value) + cnt;
	if (y < 1) {
		alert("최소 1개 이상은 주문 하셔야 합니다.");
		y = 1;
	}
	x.quantity.value = y;
	x.count.value = y;
	x.totalPrice.value = y * price;
}

