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
			<option selected>${port.pf_name}</option>
			<option value="1">test</option>
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
  <%
    int num = 1;
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
    <tr>
      <th style="text-align:right;" scope="row"><%=num %></th>
      
      <td style="font-weight: bold;"><%=currency%><%=s.getSymbol()%></td>
      
      <td><%=s.getName()%></td>
      
      <td class="text-danger"><%=currency%><%=s.getQuote().getPrice()%></td>
      
      <% if(s.getQuote().getPrice().compareTo(s.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=s.getQuote().getChangeInPercent()%></td>
      <% } else if (s.getQuote().getPrice().compareTo(s.getQuote().getPreviousClose()) < 0) {%>
      <td class="text-primary" style="text-align:right;"><%=s.getQuote().getChangeInPercent()%></td>
      <% } %>     
      
      <td><%=s.getQuote().getVolume() %></td>
      
      <td>buy</td>
      
      <td>03-07-22</td>
      
      <td style="text-align:right;">100</td>
      
      <td><%=s.getQuote().getPrice()%></td>
      <td style="text-align:right;"><%=s.getQuote().getDayHigh() %></td>
      
      <% if(s.getQuote().getPrice().compareTo(s.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=s.getQuote().getPrice().subtract(s.getQuote().getChange())%></td>
      <td class="text-danger" style="text-align:right;"><%=s.getQuote().getPrice().subtract(s.getQuote().getPreviousClose())%></td>
      <td class="text-danger" style="text-align:right;"><%=s.getQuote().getPrice().subtract(s.getQuote().getPreviousClose()).abs()%></td>
      <% } else if(s.getQuote().getPrice().compareTo(s.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=s.getQuote().getPrice().subtract(s.getQuote().getChange())%></td>
      <td class="text-primary" style="text-align:right;"><%=s.getQuote().getPrice().subtract(s.getQuote().getPreviousClose())%></td>
      <td class="text-primary" style="text-align:right;"><%=s.getQuote().getPrice().subtract(s.getQuote().getPreviousClose()).abs()%></td>
      <%} %>
    </tr>
    <%num++;}%>
  </tbody>
  <tfoot>
  <tr>
  <td colspan="2" style="text-align:center; font-weight: bold;">Total</td>
  
  <td colspan="2" style="font-weight: bold;"><%=num-1 %> Stocks</td>
  
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
<button class="btn btn-outline-dark" onclick="location.href='delete?pf_name=${port.pf_name}'">Delete</button>
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

