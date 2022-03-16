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
  
<br>
<br> 
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

