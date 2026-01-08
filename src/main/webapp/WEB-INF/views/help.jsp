<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<fmt:setBundle basename="i18n.messages" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="help.title" /> | <fmt:message key="brand.name" /></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	         
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
	          
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
    <style>
        .help-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .help-header {
            text-align: center;
            margin-bottom: 35px;
        }
        .help-header h1 {
            font-size: 36px;
            font-weight: bold;
            color: #222;
            margin-bottom: 8px;
        }
        .help-header p {
            color: #465b52;
            font-size: 18px;
        }
        .faq-section {
            margin-bottom: 40px;
        }
        .faq-title {
            font-size: 24px;
            color: #555;
            margin-bottom: 18px;
            font-weight: 600;
            border-bottom: 2px solid #eee;
            padding-bottom: 5px;
        }
        .faq-list {
            list-style: none;
            padding: 0;
        }
        .faq-list li {
            margin-bottom: 15px;
            padding: 16px 22px;
            background-color: #f8f9fc;
            border-radius: 10px;
            border-left: 4px solid #667eea;
        }
        .faq-q {
            font-weight: bold;
            color: #333;
        }
        .contact-support {
            background: #e3e6f3;
            border-radius: 10px;
            padding: 1.5rem 2rem;
            text-align: left;
            margin-top: 30px;
        }
        .contact-support h2 {
            font-size: 20px;
            color: #2d2e33;
            margin-bottom: 8px;
        }
        .support-methods {
            display: flex;
            gap: 35px;
            margin-top: 16px;
            flex-wrap: wrap;
        }
        .support-item {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(102,126,234,0.08);
            padding: 16px 22px;
            flex: 1;
            min-width: 220px;
        }
        .support-item i {
            color: #667eea;
            font-size: 23px;
            margin-right: 8px;
        }
        @media (max-width: 600px){
            .help-header h1 {font-size: 1.8rem;}
            .help-header p {font-size: 1rem;}
            .faq-title {font-size: 1.1rem;}
            .faq-list li {font-size: 15px;}
            .support-methods {flex-direction: column; gap: 15px;}
        }
    </style>
</head>
<body>
    <jsp:include page="../includes/header.jsp"></jsp:include>

    <div class="help-container">
        <div class="help-header">
            <h1><i class="bi bi-question-circle"></i> <fmt:message key="help.title" /></h1>
            <p>
                <fmt:message key="help.subtitle" />
            </p>
        </div>
        <!-- FAQ Section -->
        <section class="faq-section">
            <div class="faq-title"><i class="fa-solid fa-circle-question"></i> <fmt:message key="help.faq.title" /></div>
            <ul class="faq-list">
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q1" /></span><br>
                    <fmt:message key="help.faq.a1" />
                </li>
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q2" /></span><br>
                    <fmt:message key="help.faq.a2" />
                </li>
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q3" /></span><br>
                    <fmt:message key="help.faq.a3" />
                </li>
                <li>
                    <span class="faq-q"><fmt:message key="help.faq.q4" /></span><br>
                    <fmt:message key="help.faq.a4" />
                </li>
            </ul>
        </section>
        <!-- Contact Support Section -->
        <div class="contact-support">
            <h2><fmt:message key="help.contact.title" /></h2>
            <div class="support-methods">
                <div class="support-item">
                    <i class="fa-solid fa-envelope"></i>
                    <fmt:message key="help.contact.emailLabel" />: <a href="mailto:support@caraclothes.com">support@caraclothes.com</a>
                </div>
                <div class="support-item">
                    <i class="fa-solid fa-phone"></i>
                    <fmt:message key="help.contact.hotlineLabel" />: <fmt:message key="help.contact.hotlineValue" />
                </div>
                <div class="support-item">
                    <i class="fa-brands fa-facebook-messenger"></i>
                    <fmt:message key="help.contact.messengerLabel" />: <a href="#"><fmt:message key="help.contact.messengerValue" /></a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../includes/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
</body>
</html>
