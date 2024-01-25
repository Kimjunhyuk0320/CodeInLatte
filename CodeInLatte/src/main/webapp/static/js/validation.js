validation.js
/**
 * 유효성 검사 
 */
	// 상품
	function checkProduct() {
		let productForm = document.product
		let name = productForm.name
		let unitPrice = productForm.unitPrice
		let msg = ''
		
		
		let nameCheck = /^.{2,20}$/
		msg = '상품명은 2~20자 이내로 입력해주세요'
		if( !check(nameCheck, name, msg) ) return false
		
		let priceCheck = /^\d{1,}$/
		msg = '가격은 1글자 이상의 숫자로 입력해주세요'
		if( !check(priceCheck, unitPrice, msg) ) return false
		
		
		
		return true
	}
	
	
	// -------------------------------------------------------------------
		
	
	// 회원 가입시 전체 양식 체크
	
	function checkUser() {
		let password = document.getElementById('pw').value;
		let passwordCheck = document.getElementById('pwcheck').value;
		
		let form = document.joinForm
		let pw = form.pw
		let birth = form.birth
		let tel = form.tel
		
		let msg = ''
				
		if(password != passwordCheck) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
		} 
		
		let pwCheck = /^.{8,20}$/
		msg = '비밀번호는 8~20자 사이로 입력해주세요'
		if( !check(pwCheck, pw, msg) ) return false
		
		let birthCheck = /^\d{4}-\d{2}-\d{2}$/
		msg = '생년월일은 YYYY-MM-DD 형식으로 입력해주세요'
		if( !check(birthCheck, birth, msg) ) return false
		
		let telCheck = /^\d{3}-\d{3,4}-\d{4}$/
		msg = '휴대폰 번호로 입력해주세요(xxx-xxxx-xxxx)'
		if( !check(telCheck, tel, msg) ) return false
		
		return true
	}
	
	// 생년월일 체크
	function checkJoinUser_birth() {
		let form = document.joinForm
		let birth = form.birth
		let b_check = form.birth_check
		
		let birthCheck = /^\d{4}-\d{2}-\d{2}$/
		msg = '생년월일은 YYYY-MM-DD 형식으로 입력해주세요'
		if( birthCheck.test(birth.value) ){ 			
				b_check.value = ''	
			} else {
				b_check.value = msg
			}
		}
		
	// 휴대폰 번호 체크
	function checkJoinUser_tel() {
		let form = document.joinForm
		let tel = form.tel
		let t_check = form.tel_check
		
		let telCheck = /^\d{3}-\d{3,4}-\d{4}$/
		msg = '휴대폰 번호는 XXX-XXXX-XXXX 형식으로 입력해주세요'
		if( telCheck.test(tel.value) ){ 			
				t_check.value = ''	
			} else {
				t_check.value = msg
			}
		}
		  
	//---------------------------------------------------------------
	
		// 회원 수정 전체 양식 체크
		
	function checkUpdateUser() {
		let password = document.getElementById('pw').value;
		let passwordCheck = document.getElementById('pwcheck').value;
		
		let form = document.updateForm
		let pw = form.pw
		let birth = form.birth
		let tel = form.tel
		
		let msg = ''
				
		if(password != passwordCheck) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
		} 
		
		let pwCheck = /^.{8,20}$/
		msg = '비밀번호는 8~20자 사이로 입력해주세요'
		if( !check(pwCheck, pw, msg) ) return false
		
		let birthCheck = /^\d{4}-\d{2}-\d{2}$/
		msg = '생년월일은 YYYY-MM-DD 형식으로 입력해주세요'
		if( !check(birthCheck, birth, msg) ) return false
		
		let telCheck = /^\d{3}-\d{3,4}-\d{4}$/
		msg = '휴대폰 번호로 입력해주세요(xxx-xxxx-xxxx)'
		if( !check(telCheck, tel, msg) ) return false
		
		return true
	}
	
	// 생년월일 체크
	function checkUser_birth() {
		let form = document.updateForm
		let birth = form.birth
		let b_check = form.birth_check
		
		let birthCheck = /^\d{4}-\d{2}-\d{2}$/
		msg = '생년월일은 YYYY-MM-DD 형식으로 입력해주세요'
		if( birthCheck.test(birth.value) ){ 			
				b_check.value = ''	
			} else {
				b_check.value = msg
			}
		}
		
	// 휴대폰 번호 체크
	function checkUser_tel() {
		let form = document.updateForm
		let tel = form.tel
		let t_check = form.tel_check
		
		let telCheck = /^\d{3}-\d{3,4}-\d{4}$/
		msg = '휴대폰 번호는 XXX-XXXX-XXXX 형식으로 입력해주세요'
		if( telCheck.test(tel.value) ){ 			
				t_check.value = ''	
			} else {
				t_check.value = msg
			}
		}	  
	
	//--------------------------------------------------------------------
	
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
	