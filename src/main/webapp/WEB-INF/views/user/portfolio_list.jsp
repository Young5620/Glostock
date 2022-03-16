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
  String nickname = (String)session.getAttribute("nickname");
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

	<div class="container" align="center">
	<div class="table_header" align="left">
	<h4>Nickname&nbsp;&nbsp;
		<select class="btn btn-outline-dark btn-sm">
			<option selected>${nickname}</option>
		</select>
	</h4>
	</div>
	<table class="table border border-light border-3 table table-striped"">
  <thead class="table-success" style="text-align:center;">
    <tr>
      <th scope="col">No.</th>
      <th scope="col">Portfolio Name</th>
      <th></th>
    </tr>
  </thead>
  <tbody style="text-align:center;"> 
	<%
	ArrayList<PortfolioVO> list = (ArrayList<PortfolioVO>)request.getAttribute("list");
	int no=1;
	for(PortfolioVO str : list){
	%>
	<tr>
	<th><%=no %></th>
	<td><a href="/user/portfolio_result?pfname=<%=str.getPfname()%>"><strong><%=str.getPfname() %></strong></a></td>
	<td><input type="checkbox"></td>
	</tr>
	<% no++;}%>
	

  </tbody>
  <tfoot>
  
  
  </tfoot>
</table>
<div align="right">
<button class="btn btn-outline-dark" onclick="location.href='portfolio'">뒤로가기</button>
<button class="btn btn-outline-dark" onclick="location.href='portfolio_delete'">삭제하기</button>
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

