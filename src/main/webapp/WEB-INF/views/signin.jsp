<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">

</head>

<body>
      <jsp:include page="../includes/header.jsp"></jsp:include>
				<c:set var="ctx" value="${pageContext.request.contextPath}" />
	

   <section id="signup">
        <form action="${ctx }/login/login" method="POST">
            <div class="signup_Header">
                <h1> Cara Clothes</h1>
                <h2>Sign in</h2>
            </div>
            <div class="signup_Main">
                <input type="text" placeholder="User name" required name="username" value="${AccountCookies.username }">
                <div class="input-wrapper">
                <input type="password"  placeholder="Password" id="pwd" required name="password_sigin" value="${AccountCookies.password }">
                <span id="icon_show" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>
                <c:choose>
                <c:when test ="${msgtype =='sus' }">
                <span id="msg_pwd" style="Color:green;text-align:center;">${msg }</span>
                </c:when>
                  <c:when test ="${msgtype =='error' }">
                <span id="msg_pwd" style="Color:red;text-align:center;">${msg }</span>
                </c:when>
                </c:choose>
            </div>

            <div class="forgot">
                <label for="remember" class="remember">
                    <input type="checkbox" id="remember"  name="checkbox_re" ${not empty AccountCookies.remember ? 'checked' : ''}>
                    <span>Remember me</span>
                </label>
                <div> <a href="${ctx }/login/forgot">Forgot password?</a></div>
            </div>

            <button type="submit">Sign in</button>
            <hr>
            <p>Don't have an account? <a href="${ctx }/login/signup">Sign up</a></p>
        </form>
    </section>




      <%@ include file="../includes/footer.jsp" %>

       <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
       <script>
        showHiddenPassword("pwd", "icon_show");
    </script>
</body>

</html>