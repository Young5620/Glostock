<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="yahoofinance.Stock" %>
<%@ page import="yahoofinance.YahooFinance" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.glostock.apiservice.CryptoAPIService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Stock> cryptoList = new ArrayList<>();
    cryptoList.add(YahooFinance.get("BTC-USD"));
    cryptoList.add(YahooFinance.get("ETH-USD"));
    cryptoList.add(YahooFinance.get("BNB-USD"));
    cryptoList.add(YahooFinance.get("SOL-USD"));
    cryptoList.add(YahooFinance.get("DOGE-USD"));
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Cryptocurrency | Glo Stock</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="theme-color" content="#7952b3">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700;900&display=swap" rel="stylesheet">

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

        .crypto-price {
            font-family: 'Rubik', sans-serif;
            font-weight: 700;
        }

        .crypto-name {
            font-family: 'Rubik', sans-serif;
            font-weight: 500;
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
                            <a class="nav-link" href="/user/feed">Feed</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/follow">My Following</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/user/crypto">Cryptocurrency</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/service">My Tools</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/portfolio">My Portfolio</a>
                        </li>
                    </ul>
                    <a class="btn btn-sm btn-outline-secondary" href="/user/mypage">My Account</a>
                </div>
            </div>
        </nav>
    </div>
</header>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Cryptocurrency</h1>
                <p class="lead text-muted">가상화폐 현재가</p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1">
                <div class="card follow-card text-white bg-secondary">
                    <div class="card-header bg-secondary" style="width: 25%; margin: auto;">
                        <h5 class="card-title crypto-name" style="margin: auto; text-align: center;">Cryptocurrency Symbol</h5>
                    </div>
                    <div class="card-body" style="width: 25%; margin: auto; text-align: center;">
                        <p class="card-text">Cryptocurrency Name</p>
                    </div>
                    <div class="card-body" style="width: 25%; margin: auto; text-align: center;">
                        <h5 class="card-title crypto-price" style="margin: auto;">Current Price ($)</h5>
                    </div>
                    <div class="card-footer bg-secondary" style="width: 25%; margin: auto; text-align: center;">
                        <p class="card-text">Change In Percentage (%)</p>
                    </div>
                </div>
                <%
                    for (Stock crypto : cryptoList) {
                        String[] cryptoSymbol = crypto.getSymbol().split("-USD");
                        %>
                            <div class="card follow-card">
                                <div class="card-header" style="width: 25%; display: flex; flex-direction: row;">
                                    <h5 class="card-title crypto-name" style="margin-top: auto; margin-bottom: auto;"><%=crypto.getSymbol()%></h5>
                                    <img src="<%=CryptoAPIService.getLogoURL(cryptoSymbol[0])%>" style="margin: auto;">
                                </div>
                                <div class="card-body" style="width: 25%; margin: auto; text-align: center;">
                                    <p class="card-text"><%=crypto.getName()%></p>
                                </div>
                                <div class="card-body" style="width: 25%; margin: auto; text-align: center;">
                                    <h5 class="card-title crypto-price" style="margin: auto;">$<%=crypto.getQuote().getPrice()%></h5>
                                </div>
                                <div class="card-footer" style="width: 25%; margin: auto; text-align: center;">
                                    <%
                                        if (crypto.getQuote().getChangeInPercent().compareTo(BigDecimal.ZERO) == -1) {
                                            %>
                                            <p class="card-text" style="color: blue;"><%=crypto.getQuote().getChangeInPercent() + "%"%></p>
                                            <%
                                        } else if (crypto.getQuote().getChangeInPercent().compareTo(BigDecimal.ZERO) == 1) {
                                            %>
                                            <p class="card-text" style="color: red;"><%=crypto.getQuote().getChangeInPercent() + "%"%></p>
                                            <%
                                        } else {
                                            %>
                                            <p class="card-text"><%=crypto.getQuote().getChangeInPercent() + "%"%></p>
                                            <%
                                        }
                                    %>
                                </div>
                            </div>
                        <%
                    }
                %>
            </div>
            <h2 style="text-align: center;">More coming...</h2>
        </div>
    </div>

</main>

<%@include file="../include/footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>