<%@page import="java.io.Serializable"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.glostock.model.PortfolioVO"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="yahoofinance.YahooFinance"%>
<%@page import="yahoofinance.Stock"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
  Stock TSLA = YahooFinance.get("TSLA");
  Stock AAPL = YahooFinance.get("AAPL");
  Stock MSFT = YahooFinance.get("MSFT");
  Stock AMZN = YahooFinance.get("AMZN");
  Stock FB = YahooFinance.get("FB");
  Stock ADS = YahooFinance.get("ADS.DE");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>My Portfolio | Glo Stock</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="theme-color" content="#7952b3">


    <style>
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

        .follow-card {
            flex-direction: row !important;
            margin-bottom: 10px;
        }

        .card-header {
            background-color: white !important;
            border-bottom: 0px !important;
            margin: auto;
        }

        .card-title {
            border: 0;
        }

        .card-footer {
            border: 0 !important;
            background-color: white !important;
        }
        body {
      background: linear-gradient(to bottom right, #54E6DE, pink);
      height : 1000px;
	}
		.margin_height{
			height:30px;
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
                            <a class="nav-link" href="/user/feed">Home</a>
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
                            <a class="nav-link active" aria-current="page" href="/user/portfolio">My Portfolio</a>
                        </li>
                    </ul>
                    <a class="btn btn-sm btn-outline-secondary" href="#">My Account</a>
                </div>
            </div>
        </nav>
    </div>
</header>
<br>
<main>

	<div class="container">
	<h6>Portfolio&nbsp;&nbsp;
		<select class="btn btn-outline-dark btn-sm">
			<option selected>Choose Portfolio Name!</option>		
			<option>${sessionScope.pfname}</option>
		</select>
	</h6>
	<table class="table border border-light border-3 table table-striped">
  <thead class="table-success">
    <tr>
      <th scope="col">No.</th>
      <th scope="col" style="text-align:center;">티커심볼</th>
      <th scope="col" style="text-align:center;">회사이름</th>
      <th scope="col" style="text-align:center;">주가</th>
      <th scope="col" style="text-align:center;">등락률(%)</th>
      <th scope="col" style="text-align:center;">주식수</th>
      <th scope="col" style="text-align:center;">주문상태</th>

      <th scope="col" style="text-align:center;">분할</th>
      <th scope="col" style="text-align:center;">평균가(50일)</th>
      <th scope="col" style="text-align:center;">일일 상한가</th>
      <th scope="col" style="text-align:center;">일일 하한가</th>
      <th scope="col" style="text-align:center;">손익율(%)</th>
      <th scope="col" style="text-align:center;">손익율(abs)</th>
    </tr>
  </thead>
  <tbody> 

	
	<%
	ArrayList<PortfolioVO> list = (ArrayList<PortfolioVO>)request.getAttribute("port");
	int no=1;
	for(PortfolioVO str : list){
		
		String ticker = str.getTicker();
    	
    	if(ticker.contains("TSLA")){
    		String currency="$";    	
    %>
    <tr>
	<th><%=no%></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=TSLA.getName()%></td>
    <td class="text-danger"><%=currency%><%=TSLA.getQuote().getPrice()%></td>
      		<% if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getChangeInPercent()%></td>
      		<% } else if (TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getChangeInPercent()%></td>
      		<% } %>
    <td style="text-align:center;"><%=TSLA.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=TSLA.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=TSLA.getQuote().getDayHigh() %></td>
    <td style="text-align:right;"><%=TSLA.getQuote().getDayLow() %></td>  
      <% if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose()).abs()%></td>
      <%} %>
    </tr>
    <%} else if(ticker.contains("AAPL")){
    	String currency="$";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=AAPL.getName()%></td>
    <td class="text-danger"><%=currency%><%=AAPL.getQuote().getPrice()%></td>
      <% if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getChangeInPercent()%></td>
      <% } else if (AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td style="text-align:center;"><%=AAPL.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=AAPL.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=AAPL.getQuote().getDayHigh() %></td>
    <td style="text-align:right;"><%=AAPL.getQuote().getDayLow() %></td>  
      <% if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose()).abs()%></td>
      <%} %>
    </tr>
    <%} else if(ticker.contains("MSFT")){
    	String currency="$";
     %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=MSFT.getName()%></td>
    <td class="text-danger"><%=currency%><%=MSFT.getQuote().getPrice()%></td>
      <% if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getChangeInPercent()%></td>
      <% } else if (MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td style="text-align:center;"><%=MSFT.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=MSFT.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=MSFT.getQuote().getDayHigh() %></td>
    <td style="text-align:right;"><%=MSFT.getQuote().getDayLow() %></td> 
      <% if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose()).abs()%></td>
     
      <%} %>	
    </tr>
    <%} else if(ticker.contains("AMZN")){
    	String currency="$";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=AMZN.getName()%></td>
    <td class="text-danger"><%=currency%><%=AMZN.getQuote().getPrice()%></td>
      <% if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getChangeInPercent()%></td>
      <% } else if (AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td style="text-align:center;"><%=AMZN.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=AMZN.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=AMZN.getQuote().getDayHigh() %></td> 
    <td style="text-align:right;"><%=AMZN.getQuote().getDayLow() %></td> 
      <% if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose()).abs()%></td>
    
      <%} %>
    </tr>	
    <%}else if(ticker.contains("FB")){
    	String currency="$";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=FB.getName()%></td>
    <td class="text-danger"><%=currency%><%=FB.getQuote().getPrice()%></td>
      <% if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getChangeInPercent()%></td>
      <% } else if (FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td style="text-align:center;"><%=FB.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=FB.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=FB.getQuote().getDayHigh() %></td> 
    <td style="text-align:right;"><%=FB.getQuote().getDayLow() %></td>
      <% if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose()).abs()%></td>
    
      <%} %>
    </tr>
    <%} else if(ticker.contains("ADS")){
    	String currency="€";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=ADS.getName()%></td>
    <td class="text-danger"><%=currency%><%=ADS.getQuote().getPrice()%></td>
      <% if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getChangeInPercent()%></td>
      <% } else if (ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=ADS.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td style="text-align:center;"><%=ADS.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=ADS.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=ADS.getQuote().getDayHigh() %></td> 
    <td style="text-align:right;"><%=ADS.getQuote().getDayLow() %></td>
      <% if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose()).abs()%></td>
    
      <%} %>
    </tr>
    <%}%>
  <%no++;}%>
	

  </tbody>
  <tfoot>
  <tr class="table-success">
  <th colspan="2" style="text-align:center;">합계</th>
  <th colspan="2">내가 산 주식수</th>
  <th class="text-danger" style="font-weight: bold; text-align: right;">등락률 계</th>
  <th colspan="4">
  <th colspan="2" style="text-align:center;">Some</th>
  <th style="text-align:center;">Some</th>
  <th class="text-danger" style="text-align:center;" font-weight: bold;">Some</th>
  </tr>
  <tr>
  <td colspan="2"></td>
  
  <td colspan="2" style="font-weight: bold;"><%=(no-1)%>&nbsp;Stocks</td>
  
  <td class="text-danger" style="font-weight: bold; text-align: right;">
  +0.00%
  </td>
  <td colspan="4"></td>
  
  <td colspan="2" style="text-align:center;">117948.73</td>
  <td style="text-align:center;">0.00</td>
   <td class="text-danger" style="text-align:right; font-weight: bold;">-455.89</td>
  </tr>
  
  </tfoot>
</table>

<div align="right">
<button class="btn btn-outline-dark" onclick="location.href='portfolio'">Back</button>
<button class="btn btn-outline-dark" onclick="location.href='portfolio_delete'">Delete</button>
<button class="btn btn-outline-dark" onclick="location.href='feed'">My Feed</button>
<button class="btn btn-outline-dark" onclick="location.href='service'">My Service</button>
</div>
	</div>
<section class="margin_height"></section>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"></script>

<%@include file="../include/footer.jsp"%>

</body>
</html>

