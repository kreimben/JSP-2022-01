
const check = (regExp, e, msg) => {
	if (regExp.test(e.value)) {
		return true;
	}
	alert(msg);
	e.select();
	e.focus();
	return fasle;
}

const checkAddProduct = () => {
	const productId = document.getElementById("productId");
	const name = document.getElementById("name");
	const unitPrice = document.getElementById("unitPrice");
	const unitsInStock = document.getElementById("unitsInStock");

	// Check product ID
	if (!check(/^P[0-9]{4,11}$/, productId, "[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작 해야합니다.")) {
		return false;
	}

	// Check product name
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[상품명]\n최소 4글자에서 최대 12글자까지 입력하세요.");
		name.select();
		name.focus();
		return false;
	}

	// Check product price
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력 할 수 없습니다.")
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[가격]\n소수점 둘째 자리까지만 입력하세요.")) { return false; }

	// Check stock
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요.");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}

	// Submit
	document.newProduct.submit();
}