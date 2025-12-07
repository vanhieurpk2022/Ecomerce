<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | Cara Clothes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
    <style>
        .signup_Main {
            max-width: 400px;
            margin: auto;
        }
        .verify-row {
            display: flex;
            gap: 16px;
            margin-top: 8px;
            margin-bottom: 18px;
            justify-content: space-between;
            align-items: center;
        }
        .verify-row .cara-btn,
        .verify-row .form-control {
            height: 48px !important;
            font-size: 16px !important;
            border-radius: 14px !important;
            font-family: 'Spartan', sans-serif !important;
            margin: 0 !important;
            box-sizing: border-box !important;
            padding: 0 18px !important;
            outline: none;
        }
        .verify-row .cara-btn {
            background: linear-gradient(90deg,#7c87d0 0%,#5b7f6d 100%);
            color: #fff;
            width: 135px;
            min-width: 115px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            border: none;
            box-shadow: 0 2px 10px rgba(110,132,220,0.10);
        }
        .verify-row .form-control {
            background: #efefef;
            color: #545454;
            width: 210px;
            min-width: 120px;
            border: 1px solid #dedede;
            box-shadow: 0 2px 10px rgba(110,132,220,0.05);
        }
        @media (max-width: 600px){
            .verify-row {flex-direction: column;}
            .verify-row .cara-btn, .verify-row .form-control {width: 100%;}
        }
    </style>
</head>

<body>
    <jsp:include page="/header.jsp"></jsp:include>
    <section id="signup">
        <form id="forgotform" action="controller" method="POST" autocomplete="off">
            <input type="hidden" name="action" value="forgotpassword"/>
            <div class="signup_Header">
                <h1>Cara Clothes</h1>
                <h2>Forgot Password</h2>
            </div>
            <div class="signup_Main">
                <input 
                    type="text"
                    placeholder="Your e-mail address"
                    required
                    id="email_forgot"
                    name="email"
                    class="form-control"
                    autocomplete="off"
                    value="${email != null ? email : ''}"
                    style="margin-bottom:14px">
                <div class="verify-row">
                    <!-- Gửi mã xác thực về email (chỉ gửi email, không gửi code) -->
                    <button type="submit" class="cara-btn" id="btn_sendcode" name="sendcode" value="sendcode" style="width:135px;">Send</button>
                    <input
                        type="text"
                        placeholder="Enter code"
                        id="verify_code_input"
                        name="verifyCode"
                        class="form-control">
                </div>
                <!-- Hiển thị thông báo từ controller -->
                <c:choose>
                    <c:when test="${msgtype == 'sus'}">
                        <span id="msg_js" style="color:green;text-align:center;">${msg}</span>
                    </c:when>
                    <c:when test="${msgtype == 'error'}">
                        <span id="msg_js" style="color:red;text-align:center;">${msg}</span>
                    </c:when>
                </c:choose>
            </div>
            <!-- Kiểm tra mã code nhập vào, nếu đúng sẽ chuyển trang -->
            <button type="submit" class="cara-btn" name="verifycode" value="verifycode" style="margin-top:30px;width:100%;">Reset Password</button>
            <hr>
            <p>Remembered your password? <a href="signin.jsp">Sign in</a></p>
        </form>
    </section>
    <%@ include file="/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>
</html>