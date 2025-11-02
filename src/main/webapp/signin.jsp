<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">

</head>

<body>
      <jsp:include page="/header.jsp"></jsp:include>


   <section id="signup">
        <form action="">
            <div class="signup_Header">
                <h1> Cara Clothes</h1>
                <h2>Sign in</h2>
            </div>
            <div class="signup_Main">
                <input type="text" placeholder="User name" required>
                <input type="password" name="password_sigin" placeholder="Password" id="pwd" required>
                <span id="icon_show" class="icon_show_signin"><i class="bi bi-eye"></i></span>
                <span id="msg_pwd"></span>
            </div>

            <div class="forgot">
                <label for="remember" class="remember">
                    <input type="checkbox" id="remember">
                    <span>Remember me</span>
                </label>
                <div> <a href="#">Forgot password?</a></div>
            </div>

            <button type="submit">Sign in</button>
            <hr>
            <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
        </form>
    </section>




      <%@ include file="/footer.jsp" %>

       <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
       <script>
        showHiddenPassword("pwd", "icon_show");
    </script>
</body>

</html>