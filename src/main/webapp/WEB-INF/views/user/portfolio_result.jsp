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
<html lang="ko">
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
	<h5>Portfolio&nbsp;&nbsp; <button class="btn btn-outline-dark btn-sm" value="">${sessionScope.pfname}</button>
	</h5>
	<table class="table border border-light border-3 table table-striped">
  <thead class="table-success">
    <tr>
      <th scope="col">No.</th>
      <th scope="col" style="text-align:center;">티커심볼</th>
      <th scope="col" style="text-align:center;">회사이름</th>
      <th scope="col" style="text-align:center;">현재 주가</th>
      <th scope="col" style="text-align:center;">입력한 주가</th>
      <th scope="col" style="text-align:center;">등락률(%)</th>
      <th scope="col" style="text-align:center;">주식수</th>
      <th scope="col" style="text-align:center;">주문상태</th>

      <th scope="col" style="text-align:center;">거래량</th>
      <th scope="col" style="text-align:center;">평균가(50일)</th>
      <th scope="col" style="text-align:center;">일일 상한가</th>
      <th scope="col" style="text-align:center;">일일 하한가</th>
      <th scope="col" style="text-align:center;">전일 종가 기준 손익률</th>
    </tr>
  </thead>
  <tbody id="portfolio"> 
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
    <td class="text-danger" style="text-align:right;"><%=currency%><%=TSLA.getQuote().getPrice()%></td>
    <td class="text-danger" style="text-align:right;"><%=currency%><%=str.getPrice()%></td>
      		<% if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getChangeInPercent()%> %</td>
      		<% } else if (TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getChangeInPercent()%> %</td>
      		<% } %>
    <td style="text-align:center;"><%=str.getShares()%></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=TSLA.getQuote().getVolume()%></td>
    <td style="text-align:center;"><%=TSLA.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=TSLA.getQuote().getDayHigh() %></td>
    <td style="text-align:right;"><%=TSLA.getQuote().getDayLow() %></td>  
      <% if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose())%> %</td>
      <% } else if(TSLA.getQuote().getPrice().compareTo(TSLA.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=TSLA.getQuote().getPrice().subtract(TSLA.getQuote().getPreviousClose())%> %</td>
      <%} %>
    </tr>
    <%} else if(ticker.contains("AAPL")){
    	String currency="$";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=AAPL.getName()%></td>
    <td class="text-danger" style="text-align:right;"><%=currency%><%=AAPL.getQuote().getPrice()%></td>
    <td class="text-danger" style="text-align:right;"><%=currency%><%=str.getPrice()%></td>
      <% if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getChangeInPercent()%> %</td>
      <% } else if (AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getChangeInPercent()%> %</td>
      <% } %>
    <td style="text-align:center;"><%=str.getShares()%></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=AAPL.getQuote().getVolume()%></td>
    <td style="text-align:center;"><%=AAPL.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=AAPL.getQuote().getDayHigh() %></td>
    <td style="text-align:right;"><%=AAPL.getQuote().getDayLow() %></td>  
      <% if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose())%> %</td>
      <% } else if(AAPL.getQuote().getPrice().compareTo(AAPL.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=AAPL.getQuote().getPrice().subtract(AAPL.getQuote().getPreviousClose())%> %</td>
      <%} %>
    </tr>
    <%} else if(ticker.contains("MSFT")){
    	String currency="$";
     %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;" style="text-align:right;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;" style="text-align:right;"><%=MSFT.getName()%></td>
    <td class="text-danger"><%=currency%><%=MSFT.getQuote().getPrice()%></td>
    <td class="text-danger"><%=currency%><%=str.getPrice()%></td>
      <% if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getChangeInPercent()%> %</td>
      <% } else if (MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getChangeInPercent()%> %</td>
      <% } %>
    <td style="text-align:center;"><%=str.getShares()%></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=MSFT.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=MSFT.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=MSFT.getQuote().getDayHigh() %></td>
    <td style="text-align:right;"><%=MSFT.getQuote().getDayLow() %></td> 
      <% if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose())%> %</td>
      <% } else if(MSFT.getQuote().getPrice().compareTo(MSFT.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=MSFT.getQuote().getPrice().subtract(MSFT.getQuote().getPreviousClose())%> %</td>   
      <%} %>	
    </tr>
    <%} else if(ticker.contains("AMZN")){
    	String currency="$";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=AMZN.getName()%></td>
    <td class="text-danger" style="text-align:right;"><%=currency%><%=AMZN.getQuote().getPrice()%></td>
    <td class="text-danger" style="text-align:right;"><%=currency%><%=str.getPrice()%></td>
      <% if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getChangeInPercent()%> %</td>
      <% } else if (AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getChangeInPercent()%> %</td>
      <% } %>
    <td style="text-align:center;"><%=str.getShares()%></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=AMZN.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=AMZN.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=AMZN.getQuote().getDayHigh() %></td> 
    <td style="text-align:right;"><%=AMZN.getQuote().getDayLow() %></td> 
      <% if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose())%> %</td>
      <% } else if(AMZN.getQuote().getPrice().compareTo(AMZN.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=AMZN.getQuote().getPrice().subtract(AMZN.getQuote().getPreviousClose())%> %</td>    
      <%} %>
    </tr>	
    <%}else if(ticker.contains("FB")){
    	String currency="$";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=FB.getName()%></td>
    <td class="text-danger"  style="text-align:right;"><%=currency%><%=FB.getQuote().getPrice()%></td>
    <td class="text-danger"  style="text-align:right;"><%=currency%><%=str.getPrice()%></td>
      <% if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getChangeInPercent()%> %</td>
      <% } else if (FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getChangeInPercent()%> %</td>
      <% } %>
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=FB.getQuote().getVolume() %></td>
    <td style="text-align:center;"><%=FB.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=FB.getQuote().getDayHigh() %></td> 
    <td style="text-align:right;"><%=FB.getQuote().getDayLow() %></td>
      <% if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose())%> %</td>
      <% } else if(FB.getQuote().getPrice().compareTo(FB.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=FB.getQuote().getPrice().subtract(FB.getQuote().getPreviousClose())%> %</td>
    
      <%} %>
    </tr>
    <%} else if(ticker.contains("ADS")){
    	String currency="€";
    %>
    <tr>
	<th><%=no %></th>
	<td style="text-align:center;"><strong><%=str.getTicker() %></strong></td>
    <td style="text-align:center;"><%=ADS.getName()%></td>
    <td class="text-danger" style="text-align:right;"><%=currency%><%=ADS.getQuote().getPrice()%></td>
    <td class="text-danger" style="text-align:right;"><%=currency%><%=str.getPrice()%></td>
      <% if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) > 0) { %>
    <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getChangeInPercent()%> %</td>
      <% } else if (ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) < 0) {%>
    <td class="text-primary" style="text-align:right;"><%=ADS.getQuote().getChangeInPercent()%> %</td>
      <% } %>
    <td style="text-align:center;"><%=str.getShares() %></td>
    <td style="text-align:center;"><%=str.getTransaction() %></td>
    
    <td style="text-align:center;"><%=ADS.getQuote().getVolume()%></td>
    <td style="text-align:center;"><%=ADS.getQuote().getPriceAvg50()%></td>
    <td style="text-align:right;"><%=ADS.getQuote().getDayHigh() %></td> 
    <td style="text-align:right;"><%=ADS.getQuote().getDayLow() %></td>
      <% if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) > 0) { %>
      <td class="text-danger" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose())%> %</td>
      <% } else if(ADS.getQuote().getPrice().compareTo(ADS.getQuote().getPreviousClose()) < 0) { %>
      <td class="text-primary" style="text-align:right;"><%=ADS.getQuote().getPrice().subtract(ADS.getQuote().getPreviousClose())%> %</td>    
      <%} %>
    </tr>
    <%}%>
  <%no++;}%>
	

  </tbody>
  <tfoot>
  <%
  int total_price = 0;
  String currency = "";
  int total_count = 0;
  for (PortfolioVO price : list){
	  total_price += Float.parseFloat(price.getPrice()) * Float.parseFloat(price.getShares());
	  total_count += Integer.parseInt(price.getShares());
	  if(price.getTicker() =="ADS") {
		  currency = "€";
	  } else {
		  currency = "$";
	  }
  }
  %>
  <tr class="table-success">
  <th colspan="2" style="text-align:center;">합계</th>
  <th colspan="2">구매한 총 주식수</th>
  <th class="text-danger" style="font-weight: bold; text-align: right;">총 투자금액</th>
  <th colspan="4">
  <th colspan="4" style="text-align:right;">전일 대비 예상 손익금</th>
  </tr>
  <tr>
  <td colspan="2"></td>
  
  <td colspan="2" style="font-weight: bold;"><%=total_count%>&nbsp;Stocks</td>
  
  <td style="font-weight: bold; text-align: right;">
  <%=currency%><%=total_price %>
  </td>
  <td colspan="4"></td>
  
  <td colspan="4" style="text-align:right; font-weight: bold;" id="predict"></td>
  </tr>
  
  </tfoot>
</table>

<div align="right">
<button class="btn btn-outline-dark" onclick="location.href='portfolio'">Back</button>
<button class="btn btn-outline-dark" onclick="location.href='portfolio_delete'">Delete</button>
<button class="btn btn-outline-dark" onclick="location.href='feed'">My Feed</button>
<button class="btn btn-outline-dark" onclick="location.href='portfolio_list'">Portfolio List</button>
<button class="btn btn-outline-dark" onclick="location.href='service'">My Service</button>
</div>
	</div>
<section class="margin_height"></section>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"></script>

<%@include file="../include/footer.jsp"%>

</body>
<script type="text/javascript">
var tbody = document.getElementById('portfolio');
var tr = tbody.children;
var predict_plus = new Array();
var predict_minus = new Array();
for(var i=0;i<tr.length;i++){
	if(tr[i].children[12].textContent.substr(0,1)=="+"){
		predict_plus.push(Math.round(parseFloat(tr[i].children[12].textContent.substr(1))*0.01*parseFloat(tr[i].children[4].textContent.substr(1))));
	} else {
		predict_minus.push(Math.round(parseFloat(tr[i].children[12].textContent.substr(1))*0.01*parseFloat(tr[i].children[4].textContent.substr(1))));
	}
		
}
console.log(predict_plus);
console.log(predict_minus);
var predict_plus_sum = 0;
var predict_minus_sum = 0;
if(predict_plus.length==0){
	predict_plus_sum = 0;
} else {
	predict_plus_sum = predict_plus.reduce((a,b) => (a+b));
}

if(predict_minus.length==0) {
	predict_minus_sum = 0;	
} else {
	predict_minus_sum = predict_minus.reduce((a,b) => (a+b));
}
var predict_total = predict_plus_sum - predict_minus_sum;
var predict_td = document.getElementById("predict");
if(String(predict_total).substr(0,1)=="-"){
	predict_td.textContent = predict_total;
	predict_td.className = "text-primary";
} else {
	predict_td.textContent = predict_total;
	predict_td.className = "text-danger";
}
console.log(predict_total);
</script>
</html>

