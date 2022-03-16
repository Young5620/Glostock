<%@ page import="com.glostock.model.StockVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.glostock.apiservice.PolygonAPIService" %>
<%@ page import="com.glostock.apiservice.FmpAPIService" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="yahoofinance.Stock" %>
<%@ page import="yahoofinance.YahooFinance" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int discoverCounter = 0;

    ArrayList<StockVO> followList = (ArrayList<StockVO>)session.getAttribute("follow_list");

//    ArrayList<StockVO> followList = new ArrayList<>();
//    StockVO TSLA = new StockVO("TSLA", "Tesla, Inc.", 100, 100, 10);
//    followList.add(TSLA);

    ArrayList<StockVO> discoverList = null;
    try {
        discoverList = PolygonAPIService.getDiscoverList();
        discoverCounter += discoverList.size();
    } catch (NullPointerException e) {
        discoverList = new ArrayList<>();
    }

    ArrayList<StockVO> moreDiscoverList = new ArrayList<>();

%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>My Following | Glo Stock</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name="theme-color" content="#7952b3">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700;900&display=swap" rel="stylesheet">



    <style>
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
            text-align: center;
        }

        .card-title {
            border: 0;
        }

        .card-body img {
            height: 30px;
        }

        .card-footer {
            border: 0 !important;
            background-color: white !important;
            margin: auto;
        }

        .discover-card-header {
            width: 25%;
            font-family: Rubik, sans-serif;
            font-weight: bold;
        }

        .discover-card-body-main {
            width: 25%;
            text-align: center;
            margin: auto;
            font-family: Rubik, sans-serif;
        }

        .discover-card-body {
            text-align: center;
            margin: auto;
            font-family: Rubik, sans-serif;
        }

        .discover-card-footer {
            width: 10%;
            font-family: Rubik, sans-serif;
        }

        .discover-title {
            font-family: Rubik, sans-serif;
            font-weight: bold;
        }

        .follow-card-logo {
            margin: auto;
            text-align: center;
        }

        .follow-card-header {
            margin: auto;
        }

        .follow-card-price {
            margin: auto;
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
                            <a class="nav-link active" aria-current="page" href="/user/follow">My Following</a>
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
                <h1 class="fw-light">My Following</h1>
                <p class="lead text-muted">내가 팔로우하는 종목들</p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1">

                <%
                    for (StockVO followVO : followList) {
                %>
                <div class="card follow-card">
                    <div class="card-header follow-card-header">
                        <h5 class="card-title"><%=followVO.getName()%></h5>
                        <h6 class="card-title">$<%=followVO.getTicker()%></h6>
                    </div>
                    <div class="card-body follow-card-logo">
                        <img src="<%=followVO.getLogo_url() + "?apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY"%>" alt="logo">
                    </div>
                    <div class="card-body follow-card-price">
                        <p class="card-text">Curr. Price: $<%=followVO.getCurrent_price()%> · Prev. Close: $<%=followVO.getPrev_close_price()%> · Delta: $<%=followVO.getChange_in_percentage()%></p>
                    </div>
                    <div class="card-footer">
                        <a href="/user/deleteFollow?ticker=TSLA" class="btn btn-outline-danger">Unfollow</a>
                    </div>
                </div>
                <%
                    }
                %>

            </div>
        </div>
    </div>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Discover</h1>
                <p class="lead text-muted">팔로우할 수 있는 종목들을 찾아보세요!</p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1" id="addTarget">

                <div class="card follow-card text-white bg-dark">
                    <div class="card-header discover-card-header text-white bg-dark">
                        <h5 class="card-title discover-title">Tesla, Inc.</h5>
                        <h6 class="card-title discover-title">$TSLA</h6>
                    </div>
                    <div class="card-body discover-card-body">
                        <img src="https://api.polygon.io/v1/reference/company-branding/d3d3LnRlc2xhLmNvbQ/images/2022-01-10_icon.png + "?apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY"%" alt="TESLA logo">
                    </div>
                    <div class="card-body discover-card-body-main">
                        <p class="card-text">Curr. Price: $100 · Prev. Close: $120 · Delta: $20%</p>
                    </div>
                    <div class="card-footer discover-card-footer text-white bg-dark">
                        <a href="/user/addFollow?ticker=TSLA" class="btn btn-outline-success">Follow</a>
                    </div>
                </div>

                <%
                    for (StockVO discoverVO : discoverList) {
                        %>
                            <div class="card follow-card text-white bg-dark">
                                <div class="card-header discover-card-header text-white bg-dark">
                                    <h5 class="card-title discover-title"><%=discoverVO.getName()%></h5>
                                    <h6 class="card-title discover-title">$<%=discoverVO.getTicker()%></h6>
                                </div>
                                <div class="card-body discover-card-body">
                                    <img src="<%=discoverVO.getLogo_url() + "?apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY"%>" alt="<%=discoverVO.getName()%> logo">
                                </div>
                                <div class="card-body discover-card-body-main">
                                    <p class="card-text">Curr. Price: $<%=discoverVO.getCurrent_price()%> · Prev. Close: $<%=discoverVO.getPrev_close_price()%> · Delta: $<%=discoverVO.getChange_in_percentage()%></p>
                                </div>
                                <div class="card-footer discover-card-footer text-white bg-dark">
                                    <a href="/user/addFollow?ticker=TSLA" class="btn btn-outline-success">Follow</a>
                                </div>
                            </div>
                        <%
                    }
                %>

            </div>
            <div class="d-grid gap-2">
                <button class="btn btn-primary" type="button" onclick="discoverMore(<%=discoverCounter%>)">더 보기</button>
            </div>
        </div>
    </div>

</main>

<%@include file="../include/footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js" type="module"></script>
<script type="text/javascript">
    function discoverMore(counter) {
        let moreDiscoverListSize = <%=moreDiscoverList.size()%>;
        if (moreDiscoverListSize == 0) {
            let url = 'https://api.polygon.io/v3/reference/tickers?type=CS&exchange=XNYS&active=true&sort=ticker&order=asc&limit=100';

            let headers = new Headers();

            headers.append('Authorization', 'Bearer Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY');

            let result = fetch(url,
                {method:'GET',
                    headers: headers
                }
            ).then(function(response) { return response.json(); }).then(function(json) {
                console.log(json["results"]);
                console.log(json["results"].length)
                for (let i = <%=discoverCounter%>; i < <%=discoverCounter + 3%>; i++) {
                    console.log(json["results"][i]);

                    const first = document.createElement("div");
                    first.classList.add("card", "follow-card", "text-white", "bg-dark");

                    const secondOne = document.createElement("div");
                    secondOne.classList.add("card-header", "discover-card-header", "text-white", "bg-dark");
                    const thirdOne = document.createElement("h5");
                    thirdOne.classList.add("card-title", "discover-title");
                    thirdOne.innerText = json["results"][i]["name"]
                    const thirdTwo = document.createElement("h6");
                    thirdTwo.classList.add("card-title", "discover-title");
                    thirdTwo.innerText = json["results"][i]["ticker"];
                    secondOne.appendChild(thirdOne);
                    secondOne.appendChild(thirdTwo);

                    const secondTwo = document.createElement("div");
                    secondTwo.classList.add("card-body", "discover-card-body");
                    const thirdThree = document.createElement("img");
                    <%--thirdThree.src = <%=json["result"].getLogo_url() + "?apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY"%>"--%>
                    secondTwo.appendChild(thirdThree);

                    const secondThree = document.createElement("div");
                    secondThree.classList.add("card-body", "discover-card-body-main");
                    const thirdFour = document.createElement("p");
                    thirdFour.innerText = "Curr. Price: $Test · Prev. Close: $Test · Delta: $Test";
                    thirdFour.classList.add("card-text");
                    secondThree.appendChild(thirdFour);

                    const secondFour = document.createElement("div");
                    secondFour.classList.add("card-footer", "discover-card-footer", "text-white", "bg-dark")
                    const thirdFive = document.createElement("a");
                    thirdFive.innerText = "Follow";
                    thirdFive.classList.add("btn", "btn-outline-success");
                    secondFour.appendChild(thirdFive);

                    first.appendChild(secondOne);
                    first.appendChild(secondTwo);
                    first.appendChild(secondThree);
                    first.appendChild(secondFour);

                    document.getElementById("addTarget").appendChild(first);
                }
                <%
                discoverCounter = discoverCounter + 3;
                %>
            })
        } else {

        }



    }
</script>

</body>
</html>

