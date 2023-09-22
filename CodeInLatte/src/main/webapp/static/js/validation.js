/**
 * 유효성 검사 
 */
	function checkProduct() {
		let form = document.product
		let productId = form.productId
		let name = form.name
		let unitPrice = form.unitPrice
		let unitsInStock = form.unitsInStock
		
		let msg = ''
		
		let productIdCheck = /^P[0-9]{6}$/
		msg = '상품 아이디는 "P6자리" 로 입력해주세요'
		if( !check(productIdCheck, productId, msg) ) return false
		
		let nameCheck = /^.{2,20}$/
		msg = '상품명은 2~20자 이내로 입력해주세요'
		if( !check(nameCheck, name, msg) ) return false
		
		let priceCheck = /^\d{1,}$/
		msg = '가격은 1글자 이상의 숫자로 입력해주세요'
		if( !check(priceCheck, unitPrice, msg) ) return false
		
		let stockCheck = /^\d{1,}$/
		msg = '재고는 1글자 이상의 숫자로 입력해주세요'
		if( !check(stockCheck, unitsInStock, msg) ) return false
		
		return true
	}

	// 정규표현식 유효성 검사 함수
	function check(regExp, element, msg) {
		
		if( regExp.test(element.value)) {			
			return true
		}
		
		alert(msg)
		element.select()
		element.focus()
		return false
	}