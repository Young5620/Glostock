<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="yahoofinance.YahooFinance"%>
<%@page import="yahoofinance.Stock"%>
<%@ page import="java.util.ArrayList" %>
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
			<option selected>${pName.pfname}</option>
		</select>
	</h6>
	<table class="table border border-light border-3">
  <thead class="table-success">
    <tr>
      <th scope="col">No.</th>
      <th scope="col">Ticker</th>
      <th scope="col">Company</th>
      <th scope="col">Price</th>
      <th scope="col">Change(%)</th>
      <th scope="col">Volume</th>
      <th scope="col">Transaction</th>
      <th scope="col">Date</th>
      <th scope="col">Shares</th>
      <th scope="col">Cost</th>
      <th scope="col">Market Value</th>
      <th scope="col">Gain($)</th>
      <th scope="col">Gain(%)</th>
      <th scope="col">Change(%)</th>
    </tr>
  </thead>
  <tbody> 
  <%--   
    <% int no = 1; %>    
    <tr> 
    <th style="text-align:right;" scope="row">${port. }</th>
    <td style="font-weight: bold;">${port.ticker}</td>
     
    <%
    String ticker = request.getParameter("ticker");
    if(ticker.contains("TSLA")){
    	String currency="$";    	
    %>
    <td><%=TSLA.getName()%></td>
    <td class="text-danger"><%=currency%><%=TSLA.getQuote().getPrice()%></td>
      <% if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getChangeInPercent()%></td>
      <% } else if (TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td><%=TSLA.getQuote().getVolume() %></td>
    <td>buy</td>
    <td>03-07-22</td>
    <td style="text-align:right;">${port.shares}</td>
    <td><%=TSLA.getQuote().getPrice()%></td>
    <td style="text-align:right;"><%=TSLA.getQuote().getDayHigh() %></td> 
      <% if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getChange())%></td>
      <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getChange())%></td>
      <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose()).abs()%></td>
      <%} %>
    <%} else if(ticker.contains("AAPL")){
    	String currency="$";
    %>
    <td><%=AAPL.getName()%></td>
    <td class="text-danger"><%=currency%><%=AAPL.getQuote().getPrice()%></td>
      <% if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getChangeInPercent()%></td>
      <% } else if (AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td><%=AAPL.getQuote().getVolume() %></td>
    <td>buy</td>
    <td>03-07-22</td>
    <td style="text-align:right;">${port.shares}</td>
    <td><%=AAPL.getQuote().getPrice()%></td>
    <td style="text-align:right;"><%=AAPL.getQuote().getDayHigh() %></td> 
      <% if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getChange())%></td>
      <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getChange())%></td>
      <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose()).abs()%></td>
      <%} %>
    <%} else if(ticker.contains("MSFT")){
    	String currency="$";
     %>
    <td><%=MSFT.getName()%></td>
    <td class="text-danger"><%=currency%><%=MSFT.getQuote().getPrice()%></td>
      <% if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getChangeInPercent()%></td>
      <% } else if (MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td><%=MSFT.getQuote().getVolume() %></td>
    <td>buy</td>
    <td>03-07-22</td>
    <td style="text-align:right;">${port.shares}</td>
    <td><%=MSFT.getQuote().getPrice()%></td>
    <td style="text-align:right;"><%=MSFT.getQuote().getDayHigh() %></td> 
      <% if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getChange())%></td>
      <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getChange())%></td>
      <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose()).abs()%></td>
      <%} %>	
    <%} else if(ticker.contains("AMZN")){
    	String currency="$";
    %>
    <td><%=AMZN.getName()%></td>
    <td class="text-danger"><%=currency%><%=AMZN.getQuote().getPrice()%></td>
      <% if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getChangeInPercent()%></td>
      <% } else if (AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td><%=AMZN.getQuote().getVolume() %></td>
    <td>buy</td>
    <td>03-07-22</td>
    <td style="text-align:right;">${port.shares}</td>
    <td><%=AMZN.getQuote().getPrice()%></td>
    <td style="text-align:right;"><%=AMZN.getQuote().getDayHigh() %></td> 
      <% if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getChange())%></td>
      <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getChange())%></td>
      <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose()).abs()%></td>
      <%} %>	
    <%}else if(ticker.contains("FB")){
    	String currency="$";
    %>
    <td><%=FB.getName()%></td>
    <td class="text-danger"><%=currency%><%=FB.getQuote().getPrice()%></td>
      <% if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getChangeInPercent()%></td>
      <% } else if (AMZN.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td><%=FB.getQuote().getVolume() %></td>
    <td>buy</td>
    <td>03-07-22</td>
    <td style="text-align:right;">${port.shares}</td>
    <td><%=FB.getQuote().getPrice()%></td>
    <td style="text-align:right;"><%=FB.getQuote().getDayHigh() %></td> 
      <% if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getChange())%></td>
      <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getChange())%></td>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose()).abs()%></td>
      <%} %>
    <%} else if(ticker.contains("ADS.DE")){
    	String currency="€";
    %>
    <td><%=ADS.getName()%></td>
    <td class="text-danger"><%=currency%><%=ADS.getQuote().getPrice()%></td>
      <% if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getChangeInPercent()%></td>
      <% } else if (ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=ADS.getQuote().getChangeInPercent()%></td>
      <% } %>
    <td><%=ADS.getQuote().getVolume() %></td>
    <td>buy</td>
    <td>03-07-22</td>
    <td style="text-align:right;">${port.shares}</td>
    <td><%=ADS.getQuote().getPrice()%></td>
    <td style="text-align:right;"><%=ADS.getQuote().getDayHigh() %></td> 
      <% if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getChange())%></td>
      <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(ADS.getQuote().getChange())%></td>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose()).abs()%></td>
      <%} %>
    <% no++;}%>
    </tr> --%>
    <c:forEach var="vo" items="${port }">
	<tr>
	<th>${vo.pfnum} </th>
	<td>${vo.ticker}</td>
	<td>${vo.transaction}</td>
	<td>${vo.shares}</td>
	</tr>
	</c:forEach>
  </tbody>
  <tfoot>
  <tr>
  <td colspan="2" style="text-align:center; font-weight: bold;">Total</td>
  
  <td colspan="2" style="font-weight: bold;">Stocks</td>
  
  <td class="text-danger" style="font-weight: bold; text-align: right;">
  +0.00%
  </td>
  <td colspan="5"></td>
  
  <td style="text-align:right;">117948.73</td>
  <td style="text-align:right;">0.00</td>
  <td style="text-align:right;">0.00</td>
  <!-- 
  <c:choose>
      <c:when test="${change.charAt[0]=='+'}">
      <td class="text-primary" style="text-align:right;">+</td>
      </c:when>
      <c:otherwise>
      <td class="text-danger" style="text-align:right; font-weight: bold;">-455.89</td>
      </c:otherwise>
  </c:choose>
   -->
   <td class="text-danger" style="text-align:right; font-weight: bold;">-455.89</td>
  </tr>
  
  </tfoot>
</table>

<div align="right">
<button class="btn btn-outline-dark" onclick="location.href='portfolio'">Back</button>
<button class="btn btn-outline-dark" onclick="location.href='delete?pfname=${pName.pfname}'">Delete</button>
<button class="btn btn-outline-dark" onclick="location.href='feed'">My Feed</button>
<button class="btn btn-outline-dark" onclick="location.href='service'">My Service</button>
</div>
	</div>
<section class="margin_height"></section>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<%@include file="../include/footer.jsp"%>

</body>
</html>

