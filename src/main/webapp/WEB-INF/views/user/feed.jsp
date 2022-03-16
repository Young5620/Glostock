<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="yahoofinance.YahooFinance"%>
<%@page import="yahoofinance.Stock"%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
  Stock TSLA = YahooFinance.get("TSLA");
  Stock AAPL = YahooFinance.get("AAPL");
  Stock MSFT = YahooFinance.get("MSFT");
  Stock AMZN = YahooFinance.get("AMZN");
  Stock FB = YahooFinance.get("FB");
  Stock ADS = YahooFinance.get("ADS.DE");

  ArrayList<Stock> stockFollowList = new ArrayList<>();
  stockFollowList.add(TSLA);
  stockFollowList.add(AAPL);
  stockFollowList.add(MSFT);
  stockFollowList.add(AMZN);
  stockFollowList.add(FB);
  stockFollowList.add(ADS);
%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <title>My Feed | Glo Stock</title>

  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <meta name="theme-color" content="#7952b3">

  <style>
    .blog-post {
      -webkit-box-shadow: 0 10px 6px -6px #777;
      -moz-box-shadow: 0 10px 6px -6px #777;
      box-shadow: 0 5px 15px -6px #777;
      border: #E5E5E5 1px solid;
      padding: 25px;
      border-radius: 20px;
      background-color: white;
    }

    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
    body {
      background: linear-gradient(to bottom right, #54E6DE, pink);
	}

    .main-banner {
      background-image: url("/resources/img/main-feed-img.jpg");
      background-position: center;
    }

    .card {
      margin-bottom: 5px;
      flex-direction: row !important;
    }

    .card-header {
      margin: auto !important;
      background-color: white !important;
      border: 0 !important;
      width: 40% !important;
      text-align: center;
    }

    .card-body {
      text-align: center;
    }

  </style>


  <!-- Custom styles for this template -->
  <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
  
  <!-- Custom styles for this template -->
  <link href="/resources/css/feed.css" rel="stylesheet">
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
            <a class="nav-link" href="/">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/user/feed">Feed</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/follow">My Following</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/crypto">Cryptocurrency</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/service">My Tools</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/user/portfolio">My Portfolio</a>
          </li>
        </ul>
         &nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-sm btn-outline-secondary" href="/user/mypage">My Account</a>
      </div>
    </div>
  </nav>
  </div>
</header>

  


<main class="container">
  <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark main-banner">
    <div class="col-md-6 px-0">
      <h1 class="display-4">글로스탁 유저멘션 TOP 10</h1>
      <p class="lead my-3">요즘 뭐가 대세인지 모르겠다고요? <br> 그래서 준비했습니다!</p>
      <p class="lead mb-0"><a href="#" class="text-white fw-bold">더보기</a></p>
    </div>
  </div>

  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static bg-white">
          <strong class="d-inline-block mb-2 text-primary">Global</strong>
          <h3 class="mb-0">월드 리포드 Vol. 3</h3>
          <div class="mb-1 text-muted">Mar 7</div>
          <p class="card-text mb-auto">러시아와 우크라이나의 전쟁이 계속되는 가운데.. <br>
          전쟁 장기화와 더불어 거시경제 영향까지 글로스탁이 다뤄봤습니다.</p>
          <a href="#" class="stretched-link">이번주 월드 리포드 보기</a>
        </div>
        <div class="col-auto d-none d-lg-block">
<%--          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>--%>
          <img src="/resources/img/world-report-thumbnail2.jpg" width="200" height="250">
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static bg-white">
          <strong class="d-inline-block mb-2 text-success">Weekly</strong>
          <h3 class="mb-0">위클리 리포트</h3>
          <div class="mb-1 text-muted">Mar 3</div>
          <p class="mb-auto">금리인상, 인플레이션, 러시아발전쟁.. 계속되는 악재에 투자자의 
          마음만 복잡해져갑니다. 반복되는 주식시장 악재, 어떻게 해석해야할까요? <br>글로스탁에서 다뤄보았습니다.<br>
            </p>
          <a href="#" class="stretched-link">더 읽기</a>
        </div>
        <div class="col-auto d-none d-lg-block">
<%--          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>--%>
          <img src="/resources/img/inflation.jpg" width="200" height="250">

        </div>
      </div>
    </div>
  </div>

  <div class="row g-5">
    <div class="col-md-8">
      <div style="float:right;">
      <a class="btn btn-outline-light" href="write" style="color: #000;"><strong>글쓰기</strong></a>
      </div>
      <h3 class="pb-4 mb-4 fst-italic border-bottom">
        My Feed
      </h3>

	<c:forEach var="good" items="${feed}" >
      <article class="blog-post">
        <h2 class="blog-post-title">${good.title}</h2>
        <p class="blog-post-meta">${good.regdate} by ${good.nickname}</p>
       
        <p class="blog-post-meta">티커심볼:<a href="">${good.ticker}</a></p>

        <p> ${good.content}</p>
      
     
      
      
      </article>
	</c:forEach>





      <nav class="blog-pagination" aria-label="Pagination">
        <a class="btn btn-outline-primary" href="#">위로</a>
        <a class="btn btn-outline-secondary">더보기</a>
      </nav>

    </div>

    <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
<%--        <div class="p-4 mb-3 bg-light rounded">--%>
<%--          <h4 class="fst-italic">My Tab</h4>--%>
<%--          <p class="mb-0">Customize this section to tell your visitors a little bit about your publication, writers, content, or something else entirely. Totally up to you.</p>--%>
<%--        </div>--%>

        <div class="p-4">
          <h4>My Following</h4>
          <ol class="list-unstyled mb-0">
              <%
                  for (Stock s : stockFollowList) {
                    String currency = "";
                    if (s.getCurrency().equals("USD")) {
                      currency = "$";
                    } else if (s.getCurrency().equals("EUR")) {
                      currency = "€";
                    } else if (s.getCurrency().equals("GBP")) {
                      currency = "£";
                    }
              %>
                <li>
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title"><a href="/company/show?ticker=<%=s.getSymbol()%>"><%=currency%><%=s.getSymbol()%></a></h5>
                      <p class="card-text"><%=s.getName()%></p>
                    </div>
                    <div class="card-body">
                      <div class="card-top">
                        <%
                          if(s.getQuote().getPrice().compareTo(s.getQuote().getPreviousClose()) > 0) {
                        %>
                        <p class="card-text" style="font-size:17px; color:red;"><b><%=currency%><%=s.getQuote().getPrice().subtract(s.getQuote().getPreviousClose())%> (<%=s.getQuote().getChangeInPercent()%>%)</b></p>
                        <%
                        } else if (s.getQuote().getPrice().compareTo(s.getQuote().getPreviousClose()) < 0) {
                        %>
                        <p class="card-text" style="font-size:17px; color:blue;"><b>-<%=currency%><%=s.getQuote().getPrice().subtract(s.getQuote().getPreviousClose()).abs()%> (<%=s.getQuote().getChangeInPercent()%>%)</b></p>
                        <%
                          }
                        %>
                      </div>
                      <div class="card-bottom">
                        <p class="card-text"><b><%=currency%><%=s.getQuote().getPrice()%></b></p>
                      </div>
                    </div>
                  </div>
                </li>
              <%
                }
              %>
                <p>출처: <a href="https://finance.yahoo.com/">Yahoo Finance</a></p>

     
      </div>
    </div>
  </div>
  </div>
</main>
<%@ include file="../include/footer.jsp" %>

</body>
</html>

