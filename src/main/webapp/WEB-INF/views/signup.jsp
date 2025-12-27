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
      
    <!-- delete-->

    <section id="signup">
        <form id="register" action="${ctx }/login/register" method="POST">
			<input type="hidden" value="register" name="action"/>
            <div class="signup_Header">
                <h1> Cara Clothes</h1>
                <h2>Sign up</h2>
            </div>
            <div class="signup_Main">
                <div class="signup_main_div">
                    <input type="text" placeholder="First name" required name="firstname" value="${firstname}"> 
                    <input type="text" placeholder="Last name" required name="lastname" value="${lastname}">
                </div>
                <input type="text" placeholder="User name" required name="username" value="${username}">
                <input type="text" placeholder="Email" id="email_signup" required name="email">
                <div class="verify">
					
                    <button type="button" id="btn_verify" onclick="sendData();">Send</button>
                    <input type="text" placeholder="Enter code" required name="verifyCode">
                 
                </div>
                 <div class="input-wrapper">
                <input type="password"  placeholder="Password" required id="pwd" name="password">
                <span id="icon_show" class="icon_show"><i class="bi bi-eye"></i></span>
					</div>
					
					<div class="input-wrapper">
                <input type="password" placeholder="Confirm password" required id="pwd_confirm"  name="password_confirm">
                <span id="icon_show_confirm" class="icon_show"><i class="bi bi-eye"></i></span>
                </div>
 				<c:choose>
                <c:when test ="${msgtype eq'sus' }">
                <span id="msg_pwd" style="Color:green;text-align:center;">${msg }</span>
                </c:when>
                  <c:when test ="${msgtype eq 'error' }">
                <span id="msg_pwd" style="Color:red;text-align:center;">${msg }</span>
                </c:when>
                </c:choose>
                <span id="msg_js"></span>
            </div>
            <span class="visible"></span>
            <label>
                <input type="checkbox" required>
                I agree to the <a href="#">Terms of Service</a> & <a href="#">Privacy Policy</a>
            </label>
            <button id="signup_btn">Sign up</button>
            <hr>
            <p>Have account ? <a href="${ctx }/login/signin">Sign in</a></p>
        </form>

    </section>


        <%@ include file="../includes/footer.jsp" %>
        
   
    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
         <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
  
    <script>
        showHiddenPassword("pwd", "icon_show");
        showHiddenPassword("pwd_confirm", "icon_show_confirm");

        checkPasswordRealtime("pwd", "pwd_confirm", "msg_js", "signup_btn");

    </script>

    	
</body>

</html>