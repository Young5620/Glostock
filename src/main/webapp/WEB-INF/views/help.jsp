<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.body_top {
    width: 100%;
    height: 290px;
    background: linear-gradient(to bottom right, #54E6DE, pink);	
    background-size: 100% 100%;
}

.body_top_font {
    color: #FFFFFF;
    padding: 75px 0 32px;
    font-size: 40px;
    text-align: center;
    font-family: OpenSans-ExtraBold;
    font-weight: 800;
}

.body_top_search {
    width: 680px;
    margin: 0 auto;
    position: relative;
}

.body_top_search>input {
    color: #2B3240;
    width: 100%;
    height: 60px;
    padding: 0 47px;
    font-size: 16px;
    background: #fff;
    line-height: 22px;
    border-radius: 30px;
}

input{
border: 0 none;
}

.body_top_search_icon {
    top: 18px;
    left: 16px;
    width: 24px;
    height: 24px;
    position: absolute;
    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNjMyNjIzMzQzOTc1IiBjbGFzcz0iaWNvbiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjExOTg5IiB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPkBmb250LWZhY2UgeyBmb250LWZhbWlseTogZWxlbWVudC1pY29uczsgc3JjOiB1cmwoImNocm9tZS1leHRlbnNpb246Ly9tb29tYmVvZGZvbWRwam5wb2NvYmVtb2lhZW1lZG5rZy9mb250cy9lbGVtZW50LWljb25zLndvZmYiKSBmb3JtYXQoIndvZmYiKSwgdXJsKCJjaHJvbWUtZXh0ZW5zaW9uOi8vbW9vbWJlb2Rmb21kcGpucG9jb2JlbW9pYWVtZWRua2cvZm9udHMvZWxlbWVudC1pY29ucy50dGYgIikgZm9ybWF0KCJ0cnVldHlwZSIpOyB9Cjwvc3R5bGU+PC9kZWZzPjxwYXRoIGQ9Ik00NzQuNjY2NjY3IDE4MS4zMzMzMzNhMjkzLjMzMzMzMyAyOTMuMzMzMzMzIDAgMCAxIDIzNS4zMDY2NjYgNDY4LjQ4TDgyOS45OTQ2NjcgNzY4YTQyLjY2NjY2NyA0Mi42NjY2NjcgMCAwIDEtNTYuMzIgNjMuODcybC00LjAxMDY2Ny0zLjU0MTMzMy0xMjAuMDY0LTExOC4xODY2NjdhMjkzLjMzMzMzMyAyOTMuMzMzMzMzIDAgMSAxLTE3NC45MzMzMzMtNTI4LjgxMDY2N3ogbTAgNjRhMjI5LjMzMzMzMyAyMjkuMzMzMzMzIDAgMSAwIDAgNDU4LjY2NjY2NyAyMjkuMzMzMzMzIDIyOS4zMzMzMzMgMCAwIDAgMC00NTguNjY2NjY3eiIgZmlsbD0iIzk3OUJBMSIgcC1pZD0iMTE5OTAiPjwvcGF0aD48L3N2Zz4=) center center no-repeat;
    background-size: 100% 100%;
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
      
.wbus88 {
    width: 36px;
    height: 36px;
    margin-right: 10px;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}
</style>
<link href="features.css" rel="stylesheet">
</head>
<body>
  <%@ include file="include/header.jsp" %>
  
  <!-- body top -->
  <div class="body_top">
    <div class="body_top_font">How can we help?</div>
    <div class="body_top_search">
      <div class="body_top_search_icon"></div>
      <input placeholder="Search">
    </div>
  </div>
  <!-- body top -->
  
  <!-- body main -->
  <div class="container px-4 py-5" id="featured-3">
    <h2 class="pb-2 fst-italic border-bottom">Hot FAQs</h2>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
      <div class="feature col">
        <div class="wbus88"><img src="/resources/img/favicon.png" class="rounded-circle"></div>
        <h2>About Us</h2>
        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
        <a href="#" class="icon-link">
          Call to action
          <svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
        </a>
      </div>
      <div class="feature col">
        <div class="wbus88" style="background-image: url(&quot;https://pub.webull.com/us/suggestion/file/d9826819d94e45af861f68b07409b6d8.png&quot;);"></div>
        <h2>Promotion</h2>
        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
        <a href="#" class="icon-link">
          Call to action
          <svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
        </a>
      </div>
      <div class="feature col">
          <div class="wbus88" style="background-image: url(&quot;https://pub.webull.com/us/suggestion/file/b4659fa74aee4e87a937a693904fa3cb.png&quot;);"></div>     
        <h2>Account</h2>
        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
        <a href="#" class="icon-link">
          Call to action
          <svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
        </a>
      </div>
    </div>
  </div>
  <!-- body main -->
  
  <%@ include file="include/footer.jsp" %>
</body>
</html>
