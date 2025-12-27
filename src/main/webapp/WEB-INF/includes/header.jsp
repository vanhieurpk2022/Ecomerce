<%@page import="util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<c:set var="ctx" value="${pageContext.request.contextPath}" />
			
        <section id=header>
        <a href="${ctx}/home" class="${active=='index'?'active':'' }" > <img src="${ctx}/assert/img/logo.png" class="logo" alt=""></a>
    	
	
        <div>
            <ul id="navbar" class="m-0">
                <li><a href="${ctx}/home" class="${active=='index'?'active':'' }" >Home</a></li>
                <li><a href="${ctx}/shop?action=showCard&page=0" class="${active=='shop'?'active':'' }" >Shop</a></li>
                <li><a href="${ctx}/blog" class="${active=='blog'?'active':'' }" >Blog</a></li>
                <li><a href="${ctx}/about" class="${active=='about'?'active':'' }" >About</a></li>
                <li><a href="${ctx}/contact" class="${active=='contact'?'active':'' }" >Contact</a></li>
                <li id="lg-bag"><a href="${ctx}/cart"  class="${active=='cart'?'active':'' }"><i class="bi bi-cart"></i></a>
                              <span id="cart_count"    >${sessionScope.Cart != null ? sessionScope.Cart.size : 0}</span>
						
                </li> <!-- login succsess -->
                <c:choose>
                
                <c:when test="${sessionScope.user !=null }">
                <li class="user-menu">
                    <div class="avatar">
                        <img src="${ctx }/assert/img/avatar.jpg" alt="">
                        <span class="overflow-x-hidden">${sessionScope.user.firstname} ${sessionScope.user.lastname}</span>
                    </div> 
                <!-- Dropdown menu -->
                 <ul class="dropdown">
                   <li><a href="${ctx }/user/orders_his"> <i class="bi bi-cart"></i> Order History</a></li>
                    <li><a href="${ctx }/user/settings"> <i class="bi bi-gear"></i> Settings & Privacy</a></li>
                    <li><a href="${ctx }/user/help"> <i class="bi bi-question-circle"></i> Help & Support </a></li>

                    <li><a href="${ctx }/login/logout"> <i class="bi bi-box-arrow-right"></i> Logout</a></li>
                </ul>
                </li> 
                </c:when>
                <c:otherwise>
                                <li><a href="${ctx}/login/signup" class="signup">Sign Up</a></li>
                
                </c:otherwise>
                </c:choose>
               
                <a href="#" id="close"> <i class="bi bi-x-lg"></i></a>
            </ul>

        </div>
        <div id="mobile">
            <a href="${ctx}/cart" class="${active=='cart'?'active':'' }" data-page="cart" ><i class="bi bi-cart"></i></a>
            <i id="bar" class="fas fa-outdent"></i>
                             <span id="cart_count_mobile"    >${sessionScope.Cart != null ? sessionScope.Cart.size : 0}</span>
						

        </div>
    </section>

