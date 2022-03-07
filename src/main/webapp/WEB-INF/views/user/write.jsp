<%--
  Created by IntelliJ IDEA.
  User: rayjaelee
  Date: 3/2/22
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글쓰기 | Glo Stock</title>
    
    <style>
    .box{
    width:600px;
    
    margin:0 auto;
    }
    
    .text_height_40{
    height:40px;
    }
    
    .text_height_10{
    height:10px;
    }
    
     body {
      background: linear-gradient(to bottom right, #54E6DE, pink);
	}
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<header>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/user/feed">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/feed">My Feed</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/follow">My Following</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/service">My Service</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/portfolio">My Portfolio</a>
                        </li>
                    </ul>
                    <a class="btn btn-sm btn-outline-secondary" href="#">My Account</a>
                </div>
            </div>
        </nav>
    </div>
</header>
<main>
<div class="box">
<div class="container">

<div class="row">
  <div class="text_height_40"></div>
  <div class="col-lg-12">
    <h3 class="pb-2 fst-italic border-bottom">Feed Register</h3>
  </div>
  <!-- /.col-lg-12 -->
  
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-light bg-dark"><strong>Board Register</strong></div>
      <div class="card-body">



        <form role="form" action="register" method="post" id="regform">
          <div class="form-group">
            <label>Title</label>
            <input class="form-control" name="title" id="title">
          </div>
          <div class="text_height_10"></div>
          
          <div class="form-group">
            <label>Source</label>
            <input class="form-control" name="title" id="source">
          </div>
          <div class="text_height_10"></div>
          
          <div class="form-group">
            <label>Tag</label>
            <input class="form-control" name="title" id="tag">
          </div>
          <div class="text_height_10"></div>
          
          <div class="form-group">
            <label>Upload</label>
 			<input type="file" class="form-control" id="inputGroupFile">
		  </div>
		  <div class="text_height_10"></div>
		  
          <div class="form-group">
            <label>Content</label>
            <textarea class="form-control" style="height:300px;" name="content" id="content"></textarea>
          </div>
          <div class="text_height_10"></div>

          <div class="form-group">
            <label>writer</label>
            <input class="form-control" name="writer" id="writer">
          </div>
          <div class="text_height_10"></div>
          <button type="submit" class="btn btn-outline-dark btn-sm">등록</button>
          <button type="button" class="btn btn-outline-dark btn-sm">취소</button>
        </form>
<!-- 
등록 클릭시 title, content, writer값을 검증 처리하는 스크립트
취소시 cri.pageNum과 cri.count값을 전달하여 처리하기
$("#아이디") HTML 속성에 한번에 접근...val() => 해당 아이디의 값에 접근하는 함수
 -->


      </div>
      <!--  end card-body -->
    </div>
    <!--  end card-body -->
  </div>
  <!-- end card -->
</div>
<!-- /.row -->
</div>
</div>
</main>
<div class="text_height_40"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
