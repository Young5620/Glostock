<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.3/css/all.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">

<title>My Page | GloStock</title>
</head>
<style>	
  body {
      		background: linear-gradient(to bottom right, #54E6DE, pink);
  }
  .wrap {
  	width: 1300px;
    margin:0 auto;
  }
</style>
    
<body>

 <%@ include file="../include/header.jsp" %>
 <br><br> 
 <br><br>

<div class="container">
	<div class="container-fluid well span6">
		<div class="row-fluid">
        	<div class="span2" >
		    	<img src="/resources/img/Glostockblack.png" class="img-circle">
        	</div>
        	<div class="span8">
            	<h3><b>${mypage.username}님 환영합니다.</b></h3>
            	<br><br> 
            	<h6>이메일: ${sessionScope.user_email}</h6>
            	<h6>별명: ${mypage.nickname}</h6>
        	</div>      
		</div>
	</div>
</div>

<div class="container">
	<br>  
	<h2><b>마이페이지</b></h2>
	<hr>
	<aside class="col-sm-4">
	<div class="card">
		<article class="card-group-item">
			<header class="card-header secondary"><b>회원정보</b></header>
				<div class="filter-content">
					<div>
			  			<a href="myinfo" class="list-group-item">내 정보</a>
			  			<a href="update" class="list-group-item">내 정보수정 </a>
			  			<a href="passwordupdate" class="list-group-item">비밀번호 변경</a>
			  			<a href="logout" class="list-group-item">로그아웃</a>
			  			<a href="userleave" class="list-group-item">회원탈퇴</a>
					</div> 
				</div>
		</article> 
	</div> 
	</aside> 
	
	<aside class="col-sm-4">
	<div class="card">
		<article class="card-group-item">
			<header class="card-header"><b>게시글 관리</b></header>
				<div class="filter-content">
					<div class="list-group list-group-flush">
			  			<a href="myfeed " class="list-group-item">내 게시글 보기(수정) </a>
					</div> 
				</div>
		</article> 	
		<article class="card-group-item">
			<header class="card-header"><b>나의 자산</b></header>
				<div class="filter-content">
					<div class="list-group list-group-flush">
			  			<a href="#" class="list-group-item">관심종목 수정</a>			
					</div> 
				</div>
		</article> 
	</div> 
	</aside> <!-- col.// -->
	
	<aside class="col-sm-4">
	<div class="card">
		<article class="card-group-item">
			<header class="card-header"><b>고객센터</b></header>
				<div class="filter-content">
					<div class="list-group list-group-flush">
			  			<a href="#" class="list-group-item">문의하기</a>			
					</div> 
				</div>
		</article> 
	</div> 
	</aside> 
</div>
<!--container end.//-->

<br>
<br>


</body>
<%@ include file="../include/footer.jsp" %>