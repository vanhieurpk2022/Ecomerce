<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tech2etc Ecommerce Tutorial</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>

	<c:set var="ctx" value="${pageContext.request.contextPath}" />
	
		<!--  thêm header -->
	<jsp:include page="/header.jsp"></jsp:include>
	
	
 <section id="page-header" class="blog-header">
        <h2>#readmore</h2>
        <p>Read all case studies about our products!</p>
    </section>
	<section id="about-app" class="section-p1">
		<h1>
			Download Our <a href="#">App</a>
		</h1>
		<div class="video">
			<video autoplay muted loop src="${ctx }/assert/img/about/1.mp4"></video>
		</div>
	</section>

	<section id="feature" class="section-p1">
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f1.png" alt="">
			<h6>Free Shipping</h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f2.png" alt="">
			<h6>Online Order</h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f3.png" alt="">
			<h6>Save Money</h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f4.png" alt="">
			<h6>Promotions</h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f5.png" alt="">
			<h6>Happy Sell</h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f6.png" alt="">
			<h6>F24/7 Support</h6>
		</div>
	</section>

	<section id="newsletter" class="section-p1 section-m1">
		<div class="newstext">
			<h4>Sign Up For Newsletters</h4>
			<p>
				Get E-mail updates about our latest shop and <span>special
					offers.</span>
			</p>
		</div>
		<div class="form">
			<input type="text" placeholder=" Your email address">
			<button class="normal">Sign Up</button>
		</div>
	</section>





	<%@ include file="/footer.jsp"%>

	<script
		src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
</body>

</html>