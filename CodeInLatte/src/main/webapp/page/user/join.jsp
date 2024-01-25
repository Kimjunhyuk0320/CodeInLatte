<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="/layout/link.jsp" />
</head>
<body>
   <jsp:include page="/layout/header.jsp" />
   <% String root = request.getContextPath(); %>

   <div class="px-4 py-5 my-2 text-center">
      <h1 class="display-5 fw-bold text-body-emphasis">회원 가입</h1>
      <div class="col-lg-6 mx-auto">
         <p class="lead mb-4">회원가입 페이지 입니다.</p>
         <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
         </div>
      </div>
   </div>

   <!-- 회원 가입 영역 -->
   <div class="container mb-5" style="width: 600px;">
      <form action="join_pro.jsp" name="joinForm" method="post">

         <div class="input-group mb-4 row">
            <input type="text" class="form-control col-md-10" name="id"
               placeholder="아이디 *" required
               style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-radius: 0;">
         </div>
         

         <div class="input-group mb-4 row">
            <input type="password" class="form-control col-md-10" name="pw"
               id="pw" placeholder="비밀번호 *" required
               style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-radius: 0;">
         </div>

         <div class="input-group mb-4 row">
            <input type="password" class="form-control col-md-10"
               name="pw_confirm" id="pwcheck" placeholder="비밀번호 확인 *" required
               style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-radius: 0;">
         </div>

         <div class="input-group mb-4 row">
            <input type="text" class="form-control col-md-10" name="name"
               placeholder="이름" required
               style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-radius: 0;">
         </div>

         <div class="input-group mb-1 row">
            <input type="text" class="form-control col-md-10" name="birth"
               placeholder="생년월일"  onkeyup="checkUser_birth()"
               style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-radius: 0;">
         </div>
         
         <div class="input-group row">
         <input type="text" class="form-control" name="birth_check" disabled 
            style="background-color: white; border: none; font-size: 7px; color: red;">
         </div>

         <div class="input-group mb-1 row">
            <input type="text" class="form-control col-md-10" name="tel"
               placeholder="휴대폰 번호" onkeyup="checkUser_tel()" required
               style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-radius: 0;">
         </div>
                  
         <div class="input-group row">
            <input type="text" class="form-control" name="tel_check" disabled 
               style="background-color: white; border: none; font-size: 7px; color: red;">
         </div>

         <div class="input-group mb-4 row">
            <input type="text" class="form-control col-md-10" name="address"
               placeholder="주소"
               style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); border-radius: 0;">
         </div>

         <div class="d-flex justify-content-center mt-5 mb-5">
            <a href="javascript: history.back()"
               style="background-color: pink; color: white; width: 300px;"
               class="btn btn-lg mx-3">취소</a> 
            <input type="submit"
               class="btn btn-lg mx-3"
               style="background-color: black; color: white; width: 300px;"
               onclick="return checkUser()" value="가입" />
         </div>
      </form>
   </div>

   <jsp:include page="/layout/script.jsp" />
   <jsp:include page="/layout/footer.jsp" />
</body>
</html>