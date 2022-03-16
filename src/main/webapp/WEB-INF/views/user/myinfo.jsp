<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Glo Stock | 내정보</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



<style>
  	.container {
  	width:400px;}
    .input-form {
      max-width: 100px;
      margin-top: 80px;
	 max-width: 500px;
      margin-top: 80px;
      padding: 32px;


      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    body {
    background: linear-gradient(to right, #61E6DC, #FDEBE2);
	}
    
  </style>




<body>
 <%@ include file="../include/header.jsp" %>
<br>
<br> 
  <div class="container">
  <main class="form-join">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
       <div align="center"> <h4><b>내정보</b></h4></div>
       <br> 
       <br> 
        <form class="validation-form" action="update" method="post" >
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="username" name="username" placeholder="${mypage.username}" value="" readonly >
           
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="nickname">별명(작성자)</label>
              <input type="text" class="form-control" id="nickname" name="nickname" placeholder="${mypage.nickname}" readonly >
           
            </div>
            
          </div>

          <div class="mb-3">
            <label for="email">이메일(로그인용)</label>
            <input type="email" class="form-control" id="email" name="email" value="${mypage.email}" readonly>
         
          </div>

        

          <div class="mb-3">
            <label for="address2">전화번호<span class="text-muted"></span></label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="${mypage.phone }" readonly >
          </div>

      	<div class="mb-3">
            <label for="address2">개인정보수집동의<span class="text-muted"></span></label>
          <input class="form-control" type="text" placeholder="동의" readonly>

            
          </div>
      
          <div class="mb-4"></div>
          <button class="w-100 btn btn-secondary" type="submit">개인정보 변경하기</button> <br>
          
     
        </form>
        <div><br> </div>
         <button class="w-100 btn btn-secondary" onclick="location.href='mypage'">마이페이지로</button>
      </div>
    </div>
    </main>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br>


  <%@ include file="../include/footer.jsp" %>

</body>
    
</html>
