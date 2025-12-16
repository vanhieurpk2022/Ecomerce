<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="ctx" value="${pageContext.request.contextPath }"/>


    <footer class="section-p1">
        <div class=" col">
            <img class="logo" src="${ctx }/assert/img/logo.png" alt="">
            <h4>Contact</h4>
            <p><Strong>Address:</Strong> 562 Wellington Rood. Street 32. San Francisco</p>
            <p><Strong>Phone:</Strong> +01 2222 365 /(+91) 01 2345 6789</p>
            <p><Strong>Hours:</Strong> 10:00 - 18:00, Mon - Sa</p>

            <div class="follow">
                <h4>Follow us</h4>
                <div class="icon">
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-twitter"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-pinterest-p"></i>
                    <i class="fab fa-youtube"></i>
                </div>
            </div>
        </div>

        <div class="col">
            <h4>About</h4>
            <a href="#"> About us</a>
            <a href="#"> Delivery Information</a>
            <a href="#"> Privacy Policy</a>
            <a href="#"> Terms & Conditions</a>
            <a href="#"> Contact Us</a>
        </div>
        <div class="col">
            <h4>My Account</h4>
            <a href="#"> Sign In</a>
            <a href="#"> View Cart</a>
            <a href="#"> My Wishlist</a>
            <a href="#"> Track My Order</a>
            <a href="#"> Help</a>
        </div>

        <div class="col install">
            <h4>Install App</h4>
            <p>Form App Store or Google Play</p>
            <div class="row">
                <img src="${ctx }/assert/img/pay/app.jpg" alt="">
                <img src="${ctx }/assert/img/pay/play.jpg" alt="">

            </div>
            <p>Secured Payment Gateways</p>
            <img src="${ctx }/assert/img/pay/pay.png" alt="">

        </div>

        <!--  tôn trọng tác giả -->
        <div class="copyright">
            <p>© 2021, Tech2 etc - HTML CSS Ecommerce Template</p>
        </div>
    </footer>

