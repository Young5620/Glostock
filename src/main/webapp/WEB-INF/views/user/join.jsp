<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Glo Stock | 회원가입</title>
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
       <div align="center"> <h4><b>회원가입</b></h4></div>
       <br> 
       <br> 
        <form class="validation-form" action="joinForm" method="post">
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="username" name="username" placeholder="홍길동" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div> 
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="nickname">별명(작성자)</label>
              <input type="text" class="form-control" id="nickname" name="nickname" placeholder="동해번쩍" value="" required>
              <div class="invalid-feedback">
                별명을 입력해주세요.
              </div>
            </div>
            
          </div>

          <div class="mb-3">
            <label for="email">이메일(로그인용)</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Hongildong@glostock.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="text" class="form-control" id="password" name="password" placeholder="8~20자리 이상 입력해주세요." required>
            <div class="invalid-feedback">
            </div>
          </div>
			
			 <div class="mb-3">
            <label for="password">비밀번호확인</label>
            <input type="text" class="form-control" id="passwordcheck" name="passwordcheck" placeholder="8~20자리 이상 입력해주세요." required>
            <div class="invalid-feedback">
            </div>
          </div>

          <div class="mb-3">
            <label for="address2">전화번호<span class="text-muted"></span></label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="'-'기호 제외 입력해주세요.">
          </div>

      
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="dataagree" name="dataagree" required>
            <label class="custom-control-label" for="dataagree">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="w-100 btn btn-secondary" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    </main>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br>


  <%@ include file="../include/footer.jsp" %>

</body>
    
</html>
