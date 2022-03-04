<%@page import="java.util.Map"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="yahoofinance.YahooFinance"%>
<%@page import="yahoofinance.Stock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>API테스트</h2>

<% 



Stock TSLA = YahooFinance.get("TSLA"); //티커심볼가져오기

System.out.println(TSLA.getQuote().getPrice()); //현재가
System.out.println(TSLA.getQuote().getPreviousClose()); //전일종가
System.out.println(TSLA.getQuote().getChangeInPercent()); //일봉퍼센티지


%>








</body>
</html>