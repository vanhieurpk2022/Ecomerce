<%@page import="util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<fmt:setBundle basename="i18n.messages" />

<section id="header">
    <a href="${ctx}/home" class="${active=='index'?'active':''}">
        <img src="${ctx}/assert/img/logo.png" class="logo" alt="">
    </a>

    <div>
        <ul id="navbar" class="m-0">
            <li>
                <a href="${ctx}/home" class="${active=='index'?'active':''}">
                    <fmt:message key="nav.home" />
                </a>
            </li>

            <li>
                <a href="${ctx}/shop?action=showCard&page=0" class="${active=='shop'?'active':''}">
                    <fmt:message key="nav.shop" />
                </a>
            </li>

            <li>
                <a href="${ctx}/blog" class="${active=='blog'?'active':''}">
                    <fmt:message key="nav.blog" />
                </a>
            </li>

            <li>
                <a href="${ctx}/about" class="${active=='about'?'active':''}">
                    <fmt:message key="nav.about" />
                </a>
            </li>

            <li>
                <a href="${ctx}/contact" class="${active=='contact'?'active':''}">
                    <fmt:message key="nav.contact" />
                </a>
            </li>

            <li id="lg-bag">
                <a href="${ctx}/cart" class="${active=='cart'?'active':''}">
                    <i class="bi bi-cart"></i>
                </a>
                <span id="cart_count">
                    ${sessionScope.Cart != null ? sessionScope.Cart.size : 0}
                </span>
            </li>

            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <li class="user-menu">
                        <div class="avatar">
                            <img src="${ctx}/assert/img/avatar.jpg" alt="">
                            <span class="overflow-x-hidden">
                                ${sessionScope.user.firstname} ${sessionScope.user.lastname}
                            </span>
                        </div>

                        <ul class="dropdown">
                            <li>
                                <a href="${ctx}/user/orders_his">
                                    <i class="bi bi-cart"></i> <fmt:message key="nav.orders" />
                                </a>
                            </li>

                            <li>
                                <a href="${ctx}/user/settings">
                                    <i class="bi bi-gear"></i> <fmt:message key="nav.settings" />
                                </a>
                            </li>

                            <c:if test="${sessionScope.user.role == 0}">
                                <li>
                                    <a href="${ctx}/admin" class="d-flex">
                                        <i class="bi bi-menu-button-wide"></i> <fmt:message key="nav.admin" />
                                    </a>
                                </li>
                            </c:if>

                            <li>
                                <a href="${ctx}/user/help">
                                    <i class="bi bi-question-circle"></i> <fmt:message key="nav.help" />
                                </a>
                            </li>

                            <li>
                                <a href="${ctx}/login/logout">
                                    <i class="bi bi-box-arrow-right"></i> <fmt:message key="nav.logout" />
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:when>

                <c:otherwise>
                    <li>
                        <a href="${ctx}/login/signup" class="signup">
                            <fmt:message key="nav.signup" />
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>

           <li>
  <div class="ms-2">
    <c:choose>
      <c:when test="${active == 'index'}">
        <c:url var="viUrl" value="/home"><c:param name="lang" value="vi"/></c:url>
        <c:url var="enUrl" value="/home"><c:param name="lang" value="en"/></c:url>
      </c:when>

      <c:when test="${active == 'shop'}">
        <c:url var="viUrl" value="/shop">
          <c:param name="action" value="${empty param.action ? 'showCard' : param.action}" />
          <c:param name="page" value="${empty param.page ? '0' : param.page}" />
          <c:param name="lang" value="vi" />
        </c:url>

        <c:url var="enUrl" value="/shop">
          <c:param name="action" value="${empty param.action ? 'showCard' : param.action}" />
          <c:param name="page" value="${empty param.page ? '0' : param.page}" />
          <c:param name="lang" value="en" />
        </c:url>
      </c:when>

      <c:when test="${active == 'blog'}">
        <c:url var="viUrl" value="/blog"><c:param name="lang" value="vi"/></c:url>
        <c:url var="enUrl" value="/blog"><c:param name="lang" value="en"/></c:url>
      </c:when>

      <c:when test="${active == 'about'}">
        <c:url var="viUrl" value="/about"><c:param name="lang" value="vi"/></c:url>
        <c:url var="enUrl" value="/about"><c:param name="lang" value="en"/></c:url>
      </c:when>

      <c:when test="${active == 'contact'}">
        <c:url var="viUrl" value="/contact"><c:param name="lang" value="vi"/></c:url>
        <c:url var="enUrl" value="/contact"><c:param name="lang" value="en"/></c:url>
      </c:when>

      <c:when test="${active == 'cart'}">
        <c:url var="viUrl" value="/cart"><c:param name="lang" value="vi"/></c:url>
        <c:url var="enUrl" value="/cart"><c:param name="lang" value="en"/></c:url>
      </c:when>

      <c:otherwise>
        <!-- fallback an toàn: về home -->
        <c:url var="viUrl" value="/home"><c:param name="lang" value="vi"/></c:url>
        <c:url var="enUrl" value="/home"><c:param name="lang" value="en"/></c:url>
      </c:otherwise>
    </c:choose>

    <!-- c:url đã tự thêm contextPath nên KHÔNG nối ${ctx} -->
    <a href="${viUrl}">VI</a> | <a href="${enUrl}">EN</a>
  </div>
</li>


            <li>
                <a href="#" id="close"><i class="bi bi-x-lg"></i></a>
            </li>
        </ul>
    </div>

    <div id="mobile">
        <a href="${ctx}/cart" class="${active=='cart'?'active':''}" data-page="cart">
            <i class="bi bi-cart"></i>
        </a>
        <i id="bar" class="fas fa-outdent"></i>
        <span id="cart_count_mobile">
            ${sessionScope.Cart != null ? sessionScope.Cart.size : 0}
        </span>
    </div>
</section>
