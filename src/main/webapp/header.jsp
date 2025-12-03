<%@page import="util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <section id=header>
        <a href="${pageContext.request.contextPath}/home" class="${active=='index'?'active':'' }" > <img src="${ pageContext.request.contextPath}/assert/img/logo.png" class="logo" alt=""></a>
    
	
        <div>
            <ul id="navbar">
                <li><a href="${pageContext.request.contextPath}/home" class="${active=='index'?'active':'' }" >Home</a></li>
                <li><a href="${pageContext.request.contextPath}/shop?action=showCard&page=0" class="${active=='shop'?'active':'' }" >Shop</a></li>
                <li><a href="${pageContext.request.contextPath}/blog" class="${active=='blog'?'active':'' }" >Blog</a></li>
                <li><a href="${pageContext.request.contextPath}/about" class="${active=='about'?'active':'' }" >About</a></li>
                <li><a href="${pageContext.request.contextPath}/contact" class="${active=='contact'?'active':'' }" >Contact</a></li>
                <li id="lg-bag"><a href="${pageContext.request.contextPath}/cart"  class="${active=='cart'?'active':'' }"><i class="bi bi-cart"></i></a>
                <c:choose>
    				<c:when test="${sessionScope.Cart != null}">
                              <span id="cart_count">${sessionScope.Cart.size }</span>
    					</c:when>
    				<c:otherwise>
                                      <span id="cart_count">0</span>

   						 </c:otherwise>
						</c:choose>
                </li> <!-- login succsess -->
                <c:choose>
                <c:when test="${sessionScope.user !=null }">
                <li class="user-menu">
                    <div class="avatar">
                        <img src="" alt="">
                        <span>${sessionScope.user.firstName} ${ sessionScope.user.lastName }</span>
                    </div> 
                <!-- Dropdown menu -->
                 <ul class="dropdown">
                    <li><a href="settings.jsp"> <i class="bi bi-gear"></i> Settings & Privacy</a></li>
                    <li><a href="#"> <i class="bi bi-question-circle"></i> Help & Support </a></li>
                    <li><a href="controller?action=logout"> <i class="bi bi-box-arrow-right"></i> Logout</a></li>
                </ul>
                </li> 
                </c:when>
                <c:otherwise>
                                <li><a href="signup.jsp" class="signup">Sign Up</a></li>
                
                </c:otherwise>
                </c:choose>
               
                <a href="#" id="close"> <i class="bi bi-x-lg"></i></a>
            </ul>

        </div>
        <div id="mobile">
            <a href="cart.jsp" data-page="cart" ><i class="bi bi-bag"></i></a>
            <i id="bar" class="fas fa-outdent"></i>

        </div>
    </section>

