<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<fmt:setBundle basename="i18n.messages" />

<fmt:message key="auth.brand" var="brandName"/>
<fmt:message key="auth.reset.pageTitle" var="pageTitle"/>
<fmt:message key="auth.reset.title" var="resetTitle"/>
<fmt:message key="auth.newPassword.placeholder" var="phNewPassword"/>
<fmt:message key="auth.confirmPassword.placeholder" var="phConfirmPassword"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle} | ${brandName}</title>

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
    <jsp:include page="../includes/header.jsp"></jsp:include>

    <section id="signup">
        <form action="${ctx}/login/resetpassword" method="POST" autocomplete="off">
            <div class="signup_Header">
                <h1>${brandName}</h1>
                <h2>${resetTitle}</h2>
            </div>

            <div class="signup_Main">
                <div class="input-wrapper">
                    <input type="password"
                           id="pwd_new"
                           placeholder="${phNewPassword}"
                           required
                           name="newPassword">
                    <span id="icon_show_new" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>

                <div class="input-wrapper">
                    <input type="password"
                           id="pwd_confirm_new"
                           placeholder="${phConfirmPassword}"
                           required
                           name="confirmPassword">
                    <span id="icon_show_confirm_new" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>

                <c:choose>
                    <c:when test="${msgtype == 'sus'}">
                        <span id="msg_js" style="color:green;text-align:center;">${msg}</span>
                    </c:when>
                    <c:when test="${msgtype == 'error'}">
                        <span id="msg_js" style="color:red;text-align:center;">${msg}</span>
                    </c:when>
                </c:choose>
            </div>

            <button type="submit" class="cara-btn" style="margin-top:30px;width:100%;">
                <fmt:message key="auth.reset.btn"/>
            </button>

            <hr>

            <p>
                <fmt:message key="auth.forgot.remembered"/>
                <a href="${ctx}/login/signin"><fmt:message key="auth.signin.link"/></a>
            </p>
        </form>
    </section>

    <%@ include file="../includes/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
    <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
    <script>
        showHiddenPassword("pwd_new", "icon_show_new");
        showHiddenPassword("pwd_confirm_new", "icon_show_confirm_new");
        // Nếu bạn muốn check realtime giống signup:
        // checkPasswordRealtime("pwd_new", "pwd_confirm_new", "msg_js", null);
    </script>
</body>
</html>
