<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.glostock.apiservice.TranslateText" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    String input_ticker = request.getParameter("ticker");
    System.out.println(input_ticker);

    String company_ticker = "";
    String company_description = "";
    String company_url = "";
    String company_logo_url = "";
    String company_name = "";
    String company_description_ko = "";

    ArrayList<JSONObject> threeRecentNews = new ArrayList<>();

    final String USER_AGENT = "Mozilla/5.0";
    String COMPANY_PROFILE_URL = "https://api.polygon.io/v3/reference/tickers/" + input_ticker + "?apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY";
    String NEWSAPI_URL = "https://api.polygon.io/v2/reference/news?ticker=" + input_ticker + "&apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY";


    URL profile_obj = new URL(COMPANY_PROFILE_URL);
    URL news_obj = new URL(NEWSAPI_URL);

    HttpURLConnection profileURLConnection = (HttpURLConnection) profile_obj.openConnection();
    profileURLConnection.setRequestMethod("GET");
    profileURLConnection.setRequestProperty("User-Agent", USER_AGENT);
    HttpURLConnection newsURLConnection2 = (HttpURLConnection) news_obj.openConnection();
    newsURLConnection2.setRequestMethod("GET");
    newsURLConnection2.setRequestProperty("User-Agent", USER_AGENT);

    int responseCode = profileURLConnection.getResponseCode();
    if (responseCode == HttpURLConnection.HTTP_OK) { // success
        BufferedReader in = new BufferedReader(new InputStreamReader(profileURLConnection.getInputStream()));
        String inputLine;
        StringBuffer polygonresponse = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            polygonresponse.append(inputLine);
        }
        in .close();

        JSONObject jObject = new JSONObject(polygonresponse.toString());

        JSONObject post1Object = jObject.getJSONObject("results");
        company_ticker = post1Object.getString("ticker");
        company_description = post1Object.getString("description");
        company_url = post1Object.getString("homepage_url");
        JSONObject brandingObject = post1Object.getJSONObject("branding");
        company_logo_url = brandingObject.getString("logo_url");
        company_name = post1Object.getString("name");

    } else {
        System.out.println("GET request not worked");
    }

    int responseCode2 = newsURLConnection2.getResponseCode();
    if (responseCode2 == newsURLConnection2.HTTP_OK) { // success
        BufferedReader in = new BufferedReader(new InputStreamReader(newsURLConnection2.getInputStream()));
        String inputLine;
        StringBuffer newsresponse = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            newsresponse.append(inputLine);
        }
        in .close();

        JSONObject jObject = new JSONObject(newsresponse.toString());

        JSONArray newsArray = jObject.getJSONArray("results");
        threeRecentNews = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            threeRecentNews.add(newsArray.getJSONObject(i));
        }

    } else {
        System.out.println("GET request not worked");
    }

    TranslateText translateText = new TranslateText();

    try {
        company_description_ko = translateText.translateENtoKR(company_description);
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title><%= company_ticker%> Profile | Glo Stock</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/">



    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">

    <link rel="stylesheet" href="/resources/css/show.css">


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
        .blog-post {
            -webkit-box-shadow: 0 10px 6px -6px #777;
            -moz-box-shadow: 0 10px 6px -6px #777;
            box-shadow: 0 5px 15px -6px #777;
            border: #E5E5E5 1px solid;
            padding: 25px;
            border-radius: 20px;
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
    </style>


</head>
<body>

<header>
    <div class="container">
        <header class="blog-header py-3">
            <div class="row flex-nowrap justify-content-between align-items-center">
                <div class="col-4 pt-1">
                    <a class="link-secondary" href="#"></a>
                </div>
                <div class="col-4 text-center">
                    <a class="blog-header-logo text-dark" href="#">Glo Stock</a>
                </div>
                <div class="col-4 d-flex justify-content-end align-items-center">
                    <a class="link-secondary" href="#" aria-label="Search">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
                    </a>
                    <a class="btn btn-sm btn-outline-secondary" href="#">My Account</a>
                </div>
            </div>
        </header>

        <div class="nav-scroller py-1 mb-2">
            <nav class="nav d-flex justify-content-between">
                <a class="p-2 link-secondary" href="/user/feed">Home</a>
                <a class="p-2 link-secondary" href="#">My Feed</a>
                <a class="p-2 link-secondary" href="#">My Following</a>
                <a class="p-2 link-secondary" href="#">Europe</a>
                <a class="p-2 link-secondary" href="#">Hong Kong</a>
            </nav>
        </div>
    </div>
</header>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="mx-auto">
                <img src="<%= company_logo_url + "?apiKey=Q2mEmcBtNaeo2pmA5WgKU0h7rVYvFrJY"%>" height="75px" id="company_logo"/>
                <h1 class="fw-light">$<%= company_ticker%> · <%= company_name%></h1>
                <p class="lead text-muted">
                    <%
                        if (company_description_ko == "") {
                            %>
                                <%= company_description %>
                            <%
                        } else {
                            %>
                                <%= company_description_ko%>
                            <%
                        }
                    %>
                </p>
                <%
                    if (company_description_ko == "") {
                %>
                <p style="color: grey"><i>출처: <a href="https://polygon.io/">polygon.io</a></i></p>
                <%
                } else {
                %>
                <p style="color: grey"><i>출처: <a href="https://polygon.io/">polygon.io</a>, 번역: <a href="https://papago.naver.com/">Naver 파파고 번역</a></i></p>
                <%
                    }
                %>
                <p>
                    <a href="<%= company_url%>" class="btn btn-primary my-2">회사 홈페이지로</a>
                    <a href="<%= "https://finance.yahoo.com/quote/" + company_ticker%>" class="btn btn-secondary my-2">야후 파이낸스로</a>
                </p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <h1>관련 뉴스</h1>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                <c:forEach items="<%=threeRecentNews%>" var="recentNews">
                    <div class="col">
                        <div class="card shadow-sm">
                            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false" ><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${recentNews.getJSONObject("publisher").getString("name")}</text></svg>

                            <div class="card-body">
                                <p class="card-text">${recentNews.getString("title")}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-primary" onclick="location.href='${recentNews.getString("article_url")}'">View</button>
                                    </div>
                                    <small class="text-muted">9 mins</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>

    <div class="album py-5 bg-light">
        <div class="container">
            <h1>관련 Glo Stock 포스트</h1>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                        <div class="card-body">
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-muted">9 mins</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</main>

<footer class="text-muted py-5">
    <div class="container">
        <p class="float-end mb-1">
            <a href="#">Back to top</a>
        </p>
        <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
        <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.1/getting-started/introduction/">getting started guide</a>.</p>
    </div>
</footer>


<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>
</html>

