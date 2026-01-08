<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<fmt:setBundle basename="i18n.messages" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><fmt:message key="app.title" /></title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
	          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	          
	          
	       
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
	          

<link rel="stylesheet"

	href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>

	<c:set var="ctx" value="${pageContext.request.contextPath}" />
	
		<!--  thêm header -->
	<jsp:include page="../includes/header.jsp"></jsp:include>
	
	
 <section id="page-header" class="blog-header">
        <h2><fmt:message key="about.header.title" /></h2>
        <p><fmt:message key="about.header.desc" /></p>
    </section>
	<section id="about-app" class="section-p1">
		<h1>
			<fmt:message key="about.download.title" /> <a href="#"><fmt:message key="about.download.app" /></a>
		</h1>
		<div class="video">
			<video autoplay muted loop src="${ctx }/assert/img/about/1.mp4"></video>
		</div>
	</section>

	<section id="feature" class="section-p1">
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f1.png" alt="">
			<h6><fmt:message key="feature.freeShipping" /></h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f2.png" alt="">
			<h6><fmt:message key="feature.onlineOrder" /></h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f3.png" alt="">
			<h6><fmt:message key="feature.saveMoney" /></h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f4.png" alt="">
			<h6><fmt:message key="feature.promotions" /></h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f5.png" alt="">
			<h6><fmt:message key="feature.happySell" /></h6>
		</div>
		<div class="fe-box">
			<img src="${ctx }/assert/img/features/f6.png" alt="">
			<h6><fmt:message key="feature.support" /></h6>
		</div>
	</section>

	<section id="newsletter" class="section-p1 section-m1">
		<div class="newstext">
			<h4><fmt:message key="newsletter.title" /></h4>
			<p>
				<fmt:message key="newsletter.desc" /> <span><fmt:message key="newsletter.specialOffers" /></span>
			</p>
		</div>
		<div class="form">
			<input type="text" placeholder="<fmt:message key='newsletter.emailPlaceholder' />">
			<button class="normal"><fmt:message key="newsletter.signup" /></button>
		</div>
	</section>





	<%@ include file="../includes/footer.jsp"%>

	<script
		src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
</body>

</html>
