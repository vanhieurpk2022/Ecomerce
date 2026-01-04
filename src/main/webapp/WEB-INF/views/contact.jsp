<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    	        
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>
		<c:set var="ctx" value="${pageContext.request.contextPath }"/>

     <jsp:include page="../includes/header.jsp"></jsp:include>

    <section id="page-header" class="about-header">
        <h2>#let's_talk</h2>
        <p>LEAVE A MESSENGE. We love to hear from you!</p>
    </section>

    <section id="contact-details" class="section-p1">
        <div class="details">
            <span>GET IN TOUCH</span>
            <h2>Visit one of our agency locations or contact us today</h2>
            <h3>Head Office</h3>
            <div>
                <li>
                    <i class="bi bi-map"></i>
                    <p>56 Glassford Street Glassgow G1 1UL New York</p>
                </li>

                <li>
                    <i class="bi bi-envelope"></i>
                    <p>contact@example.com</p>
                </li>

                <li>
                    <i class="bi bi-telephone"></i>
                    <p>contact@example.com</p>
                </li>

                <li>
                    <i class="bi bi-clock"></i>
                    <p>Monday to Satuday - 9.00 am to 16 pm</p>
                </li>

            </div>
        </div>

        <div class="map">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2084632156307!2d106.78738242593356!3d10.871743239282905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1757518376149!5m2!1svi!2s"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </section>

    <section id="form-details">
        <form action="">
            <span>LEAVE A MESSENGE</span>
            <h2>We love to hear from you</h2>
            <input type="text" placeholder="YourName">
            <input type="text" placeholder="E-mail">
            <input type="text" placeholder="Subject">
            <textarea name="" id="" cols="30" rows="10" placeholder="Your Messenge"></textarea>
            <button class="normal">submit</button>
        </form>

        <div class="people">
            <div>
                <img src="${ctx }/assert/img/people/1.png" alt="">
                <p><span>John Doe </span> Senior Marketing Manager <br> Phone: + 000 123 444889 <br> Email:
                    contact@example.com</p>
            </div>

            <div>
                <img src="${ctx }/assert/img/people/2.png" alt="">
                <p><span>John Doe </span> Senior Marketing Manager <br> Phone: + 000 123 444889 <br> Email:
                    contact@example.com</p>
            </div>

            <div>
                <img src="${ctx }/assert/img/people/3.png" alt="">
                <p><span>John Doe </span> Senior Marketing Manager <br> Phone: + 000 123 444889 <br> Email:
                    contact@example.com</p>
            </div>

        </div>
    </section>

    <section id="newsletter" class="section-p1 section-m1">
        <div class="newstext">
            <h4>Sign Up For Newsletters</h4>
            <p>Get E-mail updates about our latest shop and <span>special offers.</span></p>
        </div>
        <div class="form">
            <input type="text" placeholder=" Your email address">
            <button class="normal">Sign Up</button>
        </div>
    </section>

  	<%@ include file="../includes/footer.jsp" %>

    <script src="${ctx}/assert/javascript/script.js"></script>
</body>

</html>