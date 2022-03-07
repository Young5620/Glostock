<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<form action="#" method="post">
	<h6>Portfolio&nbsp;&nbsp;
		<select class="btn btn-outline-dark btn-sm">
			<option selected>Create New portfolio</option>
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
    <tr>
      <th style="text-align:right;" scope="row">1</th>
      <td style="font-weight: bold;">TSLA</td>
      <td>Tesla,Inc.</td>
      <td class="text-danger">839.29</td>
      <c:choose>
      <c:when test="${change.charAt[0]=='+'}">
      <td class="text-primary" style="text-align:right;">+0.12%</td>
      </c:when>
      <c:otherwise>
      <td class="text-danger" style="text-align:right;">-0.12%</td>
      </c:otherwise>
      </c:choose>
      <td>22,287,340</td>
      <td>buy</td>
      <td>03-07-22</td>
      <td style="text-align:right;">119</td>
      <td>839.29</td>
      <td style="text-align:right;">1000000.03</td>
      <td style="text-align:right;">0.00</td>
      <td style="text-align:right;">0.00%</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+119.29</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-119.29</td>
      	</c:otherwise>
      </c:choose>
      
    </tr>
    <tr>
      <th style="text-align:right;" scope="row">2</th>
      <td style="font-weight: bold;">AAPL</td>
      <td>Apple Inc.</td>
      <td class="text-danger">163.17</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+1.84%</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-1.84%</td>
      	</c:otherwise>
      </c:choose>
      
      <td>83,654,856</td>
      <td>buy</td>
      <td>03-07-22</td>
      <td style="text-align:right;">110</td>
      <td>163.17</td>
      <td style="text-align:right;">17948.70</td>
      <td style="text-align:right;">0.00</td>
      <td style="text-align:right;">0.00%</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+336.60</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-336.60</td>
      	</c:otherwise>
      </c:choose>
    </tr>
    <tr>
      <th style="text-align:right;" scope="row">3</th>
      <td style="font-weight: bold;">MSFT</td>
      <td>Microsft Corporation</td>
      <td class="text-danger">289.86</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+1.84%</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-2.05%</td>
      	</c:otherwise>
      </c:choose>
      
      <td>83,654,856</td>
      <td>buy</td>
      <td>03-07-22</td>
      <td style="text-align:right;">110</td>
      <td>163.17</td>
      <td style="text-align:right;">17948.70</td>
      <td style="text-align:right;">0.00</td>
      <td style="text-align:right;">0.00%</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+336.60</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-336.60</td>
      	</c:otherwise>
      </c:choose>
    </tr>
    <tr>
      <th style="text-align:right;" scope="row">4</th>
      <td style="font-weight: bold;">AMZN</td>
      <td>Amazon.com, Inc</td>
      <td class="text-danger">2912.82</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+1.84%</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-1.53%</td>
      	</c:otherwise>
      </c:choose>
      
      <td>83,654,856</td>
      <td>buy</td>
      <td>03-07-22</td>
      <td style="text-align:right;">110</td>
      <td>163.17</td>
      <td style="text-align:right;">17948.70</td>
      <td style="text-align:right;">0.00</td>
      <td style="text-align:right;">0.00%</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+336.60</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-336.60</td>
      	</c:otherwise>
      </c:choose>
    </tr>
    <tr>
      <th style="text-align:right;" scope="row">5</th>
      <td style="font-weight: bold;">FB</td>
      <td>Meta Platforms, Inc</td>
      <td class="text-danger">200.06</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+1.84%</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-1.43%</td>
      	</c:otherwise>
      </c:choose>
      
      <td>83,654,856</td>
      <td>buy</td>
      <td>03-07-22</td>
      <td style="text-align:right;">110</td>
      <td>163.17</td>
      <td style="text-align:right;">17948.70</td>
      <td style="text-align:right;">0.00</td>
      <td style="text-align:right;">0.00%</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+336.60</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-336.60</td>
      	</c:otherwise>
      </c:choose>
    </tr>
    <tr>
      <th style="text-align:right;" scope="row">6</th>
      <td style="font-weight: bold;">ADS.DE</td>
      <td>adidas AG</td>
      <td class="text-danger">€187.0</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+1.84%</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-6.64%</td>
      	</c:otherwise>
      </c:choose>
      
      <td>83,654,856</td>
      <td>buy</td>
      <td>03-07-22</td>
      <td style="text-align:right;">110</td>
      <td>163.17</td>
      <td style="text-align:right;">17948.70</td>
      <td style="text-align:right;">0.00</td>
      <td style="text-align:right;">0.00%</td>
      <c:choose>
      	<c:when test="${change.charAt[0]=='+'}">
      		<td class="text-primary" style="text-align:right;">+336.60</td>
      	</c:when>
      	<c:otherwise>
      		<td class="text-danger" style="text-align:right;">-336.60</td>
      	</c:otherwise>
      </c:choose>
    </tr>
  </tbody>
  <tfoot>
  <tr>
  <td colspan="2" style="text-align:center; font-weight: bold;">Total</td>
  
  <td colspan="2" style="font-weight: bold;">6 Stocks</td>
  <c:choose>
      <c:when test="${change.charAt[0]=='+'}">
      <td class="text-primary" style="font-weight: bold; text-align: right;">+%</td>
      </c:when>
      <c:otherwise>
      <td class="text-danger" style="font-weight: bold; text-align: right;">-0.39%</td>
      </c:otherwise>
  </c:choose>
  
  <td colspan="5"></td>
  
  <td style="text-align:right;">117948.73</td>
  <td style="text-align:right;">0.00</td>
  <td style="text-align:right;">0.00</td>
  <c:choose>
      <c:when test="${change.charAt[0]=='+'}">
      <td class="text-primary" style="text-align:right;">+</td>
      </c:when>
      <c:otherwise>
      <td class="text-danger" style="text-align:right; font-weight: bold;">-455.89</td>
      </c:otherwise>
  </c:choose>
  
  </tr>
  </tfoot>
</table>
</form>
<div align="right">
<button class="btn btn-outline-dark" onclick="location.href='portfolio'">Back</button>
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

