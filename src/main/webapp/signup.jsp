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
    <!-- delete-->

    <section id="signup">
        <form action="">
            <div class="signup_Header">
                <h1> Cara Clothes</h1>
                <h2>Sign up</h2>
            </div>
            <div class="signup_Main">
                <div class="signup_main_div">
                    <input type="text" placeholder="First name">
                    <input type="text" placeholder="Last name">
                </div>
                <input type="text" placeholder="User name">
                <input type="text" placeholder="Email">
                <input type="text" name="" placeholder="Password" id="">
                <input type="text" name="" placeholder="Confirm password" id="">

            </div>
            <span class="visible"></span>
            <label>
                <input type="checkbox" required>
                I agree to the <a href="#">Terms of Service</a> & <a href="#">Privacy Policy</a>
            </label>
            <button>Sign up</button>
            <hr>
            <p>Have account ? <a href="#">Sign in</a></p>
        </form>

    </section>




        <%@ include file="/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
</body>

</html>