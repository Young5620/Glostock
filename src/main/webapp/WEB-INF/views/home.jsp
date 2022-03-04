<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Glo Stock | 글로 스탁</title>
    <style>
        body {
            background: linear-gradient(to bottom right, #54E6DE, pink) !important;
        }
    </style>
</head>
<body>
<div id="body-container">
	<%@include file="include/header.jsp"%>
	<main>
		
		<div class="main-banner">
			<div class="container col-xxl-8 px-4 py-5">
				<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
					<div class="col-10 col-sm-8 col-lg-6">
						<img src="../../resources/img/main-banner-img.png" class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes" width="700" height="500" loading="lazy">
					</div>
					<div class="col-lg-6">
						<h1 class="display-5 fw-bold lh-1 mb-3">금융 소식 여기 모여라</h1>
						<p class="lead">많고 많은 금융 소식을 한곳에 글로 스탁에서! 종목별로! 업종별로!</p>
						<div class="d-grid gap-2 d-md-flex justify-content-md-start">
							<button type="button" class="btn btn-primary btn-lg px-4 me-md-2" onclick="location.href='user/login'">로그인</button>
							<button type="button" class="btn btn-outline-secondary btn-lg px-4" onclick="location.href='user/join'">회원가입</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="second-main-banner">
			<div class="px-4 pt-5 my-5 text-center border-bottom">
				<h1 class="display-4 fw-bold words">$TSLA 소식이 궁금해?</h1>
				<div class="col-lg-6 mx-auto">
					<p class="lead mb-4">Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit, featuring Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful JavaScript plugins.</p>
					<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
						<button type="button" class="btn btn-primary btn-lg px-4 me-sm-3">로그인</button>
						<button type="button" class="btn btn-outline-secondary btn-lg px-4">회원가입</button>
					</div>
				</div>
				<div class="overflow-hidden" style="max-height: 30vh;">
					<div class="container px-5">
						<img src="/resources/img/home-banner2.png" class="img-fluid border rounded-3 shadow-lg mb-4" alt="Example image" width="700" height="500" loading="lazy">
					</div>
				</div>
			</div>
		</div>
		<div class="third-main-banner">
			<div class="container px-4 py-5" id="featured-3">
				<h2 class="pb-2 border-bottom">소식만 모아주는거 아니야? 응~ 아니야~</h2>
				<div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
					<div class="feature col">
						<div class="feature-icon bg-primary bg-gradient">
							<svg class="bi" width="1em" height="1em"><use xlink:href="#collection"/></svg>
						</div>
						<h2>Featured title</h2>
						<p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
						<a href="#" class="icon-link">
							Call to action
							<svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
						</a>
					</div>
					<div class="feature col">
						<div class="feature-icon bg-primary bg-gradient">
							<svg class="bi" width="1em" height="1em"><use xlink:href="#people-circle"/></svg>
						</div>
						<h2>Featured title</h2>
						<p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
						<a href="#" class="icon-link">
							Call to action
							<svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
						</a>
					</div>
					<div class="feature col">
						<div class="feature-icon bg-primary bg-gradient">
							<svg class="bi" width="1em" height="1em"><use xlink:href="#toggles2"/></svg>
						</div>
						<h2>Featured title</h2>
						<p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
						<a href="#" class="icon-link">
							Call to action
							<svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
						</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</div>
<%@include file="include/footer.jsp"%>
</body>

</html>
