<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support | Cara Clothes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
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
    <jsp:include page="/header.jsp"></jsp:include>

    <div class="help-container">
        <div class="help-header">
            <h1><i class="bi bi-question-circle"></i> Help & Support</h1>
            <p>
                We're here to help! Browse our most frequently asked questions or contact our support team below.
            </p>
        </div>
        <!-- FAQ Section -->
        <section class="faq-section">
            <div class="faq-title"><i class="fa-solid fa-circle-question"></i> Frequently Asked Questions</div>
            <ul class="faq-list">
                <li>
                    <span class="faq-q">How do I reset my password?</span><br>
                    Go to <b>Sign In</b> &rarr; <b>Forgot Password</b>, enter your email, and follow the instructions to reset your password via email.
                </li>
                <li>
                    <span class="faq-q">How can I track my order?</span><br>
                    After logging in, visit <b>My Account</b> &rarr; <b>Track My Order</b> to see your recent orders and shipment status.
                </li>
                <li>
                    <span class="faq-q">Can I return or exchange a product?</span><br>
                    Yes! Simply go to <b>My Orders</b>, choose your product, and click <b>Return/Exchange</b>. Follow on-screen instructions.
                </li>
                <li>
                    <span class="faq-q">How can I contact Cara Clothes?</span><br>
                    Use one of the contact methods below, or send us a message using the website contact form.
                </li>
            </ul>
        </section>
        <!-- Contact Support Section -->
        <div class="contact-support">
            <h2>Contact Support</h2>
            <div class="support-methods">
                <div class="support-item">
                    <i class="fa-solid fa-envelope"></i>
                    Email: <a href="mailto:support@caraclothes.com">support@caraclothes.com</a>
                </div>
                <div class="support-item">
                    <i class="fa-solid fa-phone"></i>
                    Hotline: +84 1234 56789 (8:00 - 18:00, Mon - Sat)
                </div>
                <div class="support-item">
                    <i class="fa-brands fa-facebook-messenger"></i>
                    Messenger: <a href="#">Cara Clothes Messenger</a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
</body>
</html>