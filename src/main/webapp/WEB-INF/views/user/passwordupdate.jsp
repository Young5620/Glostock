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
  	width:1000px;}
    .input-form {
      max-width: 100px;
      margin-top: 80px;
	 max-width: 680px;
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
      		background: linear-gradient(to bottom right, #54E6DE, pink);
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
       <div align="center"> <h4><b>비밀번호 변경</b></h4></div>
       <br> 
       <br> 
 		
        <form class="validation-form" name="change" id="change" action="passwordUpdate" method="post">
        
            <div class="mb-3">
              <label for="password">현재 비밀번호</label>
              <input type="text" class="form-control" id="password" name="password" placeholder="" value="" >
            </div>
       
 
			<div class="mb-3">
              <label for="newpassword">변경할 새 비밀번호</label>
              <input type="text" class="form-control" id="newpassword" name="newpassword" placeholder=""  >
       
            </div>
            
            <div class="mb-3">
              <label for="newpassword2">변경할 새 비밀번호(확인)</label>
              <input type="text" class="form-control" id="newpassword2" name="newpassword2" placeholder=""  >
       
            </div>
            
          <div class="mb-4"></div>
          <button class="w-100 btn btn-secondary" onclick="change()">비밀번호 변경하기</button>
        </form>
       
        <div><br> </div>
         <button class="w-100 btn btn-secondary" onclick="location.href='mypage'">마이페이지로</button>
      </div>
    </div>
    </main>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br>



<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">

	function change() {

			if(document.change.newpassword.value!=document.change.newpassword2.value) {  
				alert("새로운 비밀번호가 일치하지 않습니다.");
				return; 
				
			} else if (confirm("변경하시겠습니까?")) {  
				document.change.submit(); 
				
			}
	}
	
	
</script>
</body>
    
</html>
