<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<fmt:setBundle basename="i18n.messages" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><fmt:message key="app.title" /> | <fmt:message key="tc.title" /></title>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="apple-touch-icon" sizes="180x180"
    href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
    href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
    href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest"
    href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assert/css/style.css">

<style>
.tc-wrap{ max-width:980px; margin:0 auto; }
.tc-card{
    background:#fff;
    border:1px solid #e9ecef;
    border-radius:14px;
    padding:18px;
    margin-bottom:16px;
    box-shadow:0 6px 20px rgba(0,0,0,.04);
}
.tc-card h3{ font-size:18px; margin-bottom:10px; }
.tc-card p, .tc-card li{ line-height:1.75; color:#334155; }
.tc-card ul{ margin: 8px 0 0 18px; }
.tc-note{
    border-left:4px solid #088178;
    background:#f0fbfa;
}
.tc-links a{
    display:inline-block;
    margin:0 10px 10px 0;
    padding:8px 12px;
    border:1px solid #dbe3ea;
    border-radius:999px;
    font-weight:600;
    color:#0f172a;
    background:#fff;
}
.tc-links a:hover{ border-color:#088178; color:#088178; }
</style>
</head>

<body>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />

    <!-- header -->
    <jsp:include page="../includes/header.jsp"></jsp:include>

    <!-- page header giống About -->
    <section id="page-header" class="blog-header">
        <h2><fmt:message key="tc.header.title" /></h2>
        <p><fmt:message key="tc.header.desc" /></p>
    </section>

    <section id="terms" class="section-p1">
        <div class="tc-wrap">

            <!-- quick links -->
            <div class="tc-links" style="margin-bottom:14px;">
                <a href="#accept"><i class="fa-solid fa-check"></i> <fmt:message key="tc.anchors.accept"/></a>
                <a href="#account"><i class="fa-solid fa-user"></i> <fmt:message key="tc.anchors.account"/></a>
                <a href="#orders"><i class="fa-solid fa-bag-shopping"></i> <fmt:message key="tc.anchors.orders"/></a>
                <a href="#pricing"><i class="fa-solid fa-tag"></i> <fmt:message key="tc.anchors.pricing"/></a>
                <a href="#shipping"><i class="fa-solid fa-truck-fast"></i> <fmt:message key="tc.anchors.shipping"/></a>
                <a href="#returns"><i class="fa-solid fa-rotate-left"></i> <fmt:message key="tc.anchors.returns"/></a>
                <a href="#ip"><i class="fa-solid fa-copyright"></i> <fmt:message key="tc.anchors.ip"/></a>
                <a href="#limits"><i class="fa-solid fa-shield"></i> <fmt:message key="tc.anchors.limits"/></a>
            </div>

            <div class="tc-card tc-note">
                <h3><i class="fa-solid fa-circle-info"></i> <fmt:message key="tc.note.title"/></h3>
                <p style="margin:0;"><fmt:message key="tc.note.desc"/></p>
            </div>

            <div id="accept" class="tc-card">
                <h3><i class="fa-solid fa-check"></i> <fmt:message key="tc.accept.title"/></h3>
                <p><fmt:message key="tc.accept.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.accept.li1"/></li>
                    <li><fmt:message key="tc.accept.li2"/></li>
                    <li><fmt:message key="tc.accept.li3"/></li>
                </ul>
            </div>

            <div id="account" class="tc-card">
                <h3><i class="fa-solid fa-user"></i> <fmt:message key="tc.account.title"/></h3>
                <p><fmt:message key="tc.account.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.account.li1"/></li>
                    <li><fmt:message key="tc.account.li2"/></li>
                    <li><fmt:message key="tc.account.li3"/></li>
                </ul>
            </div>

            <div id="orders" class="tc-card">
                <h3><i class="fa-solid fa-bag-shopping"></i> <fmt:message key="tc.orders.title"/></h3>
                <p><fmt:message key="tc.orders.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.orders.li1"/></li>
                    <li><fmt:message key="tc.orders.li2"/></li>
                    <li><fmt:message key="tc.orders.li3"/></li>
                </ul>
            </div>

            <div id="pricing" class="tc-card">
                <h3><i class="fa-solid fa-tag"></i> <fmt:message key="tc.pricing.title"/></h3>
                <p><fmt:message key="tc.pricing.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.pricing.li1"/></li>
                    <li><fmt:message key="tc.pricing.li2"/></li>
                    <li><fmt:message key="tc.pricing.li3"/></li>
                </ul>
            </div>

            <div id="shipping" class="tc-card">
                <h3><i class="fa-solid fa-truck-fast"></i> <fmt:message key="tc.shipping.title"/></h3>
                <p><fmt:message key="tc.shipping.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.shipping.li1"/></li>
                    <li><fmt:message key="tc.shipping.li2"/></li>
                    <li><fmt:message key="tc.shipping.li3"/></li>
                </ul>
            </div>

            <div id="returns" class="tc-card">
                <h3><i class="fa-solid fa-rotate-left"></i> <fmt:message key="tc.returns.title"/></h3>
                <p><fmt:message key="tc.returns.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.returns.li1"/></li>
                    <li><fmt:message key="tc.returns.li2"/></li>
                    <li><fmt:message key="tc.returns.li3"/></li>
                </ul>
            </div>

            <div id="ip" class="tc-card">
                <h3><i class="fa-solid fa-copyright"></i> <fmt:message key="tc.ip.title"/></h3>
                <p><fmt:message key="tc.ip.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.ip.li1"/></li>
                    <li><fmt:message key="tc.ip.li2"/></li>
                </ul>
            </div>

            <div id="limits" class="tc-card">
                <h3><i class="fa-solid fa-shield"></i> <fmt:message key="tc.limits.title"/></h3>
                <p><fmt:message key="tc.limits.desc"/></p>
                <ul>
                    <li><fmt:message key="tc.limits.li1"/></li>
                    <li><fmt:message key="tc.limits.li2"/></li>
                    <li><fmt:message key="tc.limits.li3"/></li>
                </ul>
            </div>

            <div class="tc-card">
                <h3><i class="fa-solid fa-headset"></i> <fmt:message key="tc.contact.title"/></h3>
                <p style="margin-bottom:10px;"><fmt:message key="tc.contact.desc"/></p>
                <ul>
                    <li><b>Email:</b> support@cara-store.com</li>
                    <li><b><fmt:message key="tc.contact.hotlineLabel"/></b> 1900 0000 (08:00 - 20:00)</li>
                    <li><b><fmt:message key="tc.contact.addressLabel"/></b> 123 Fashion Street, District 1, HCM</li>
                </ul>
            </div>

        </div>
    </section>

    <!-- giữ feature + newsletter để đồng bộ giao diện -->
    <section id="feature" class="section-p1">
        <div class="fe-box">
            <img src="${ctx }/assert/img/features/f1.png" alt="">
            <h6><fmt:message key="feature.freeShipping" /></h6>
        </div>
        <div class="fe-box">
            <img src="${ctx }/assert/img/features/f2.png" alt="">
            <h6><fmt:message key="feature.onlineOrder" /></h6>
        </div>
        <div class="fe-box">
            <img src="${ctx }/assert/img/features/f3.png" alt="">
            <h6><fmt:message key="feature.saveMoney" /></h6>
        </div>
        <div class="fe-box">
            <img src="${ctx }/assert/img/features/f4.png" alt="">
            <h6><fmt:message key="feature.promotions" /></h6>
        </div>
        <div class="fe-box">
            <img src="${ctx }/assert/img/features/f5.png" alt="">
            <h6><fmt:message key="feature.happySell" /></h6>
        </div>
        <div class="fe-box">
            <img src="${ctx }/assert/img/features/f6.png" alt="">
            <h6><fmt:message key="feature.support" /></h6>
        </div>
    </section>

    <section id="newsletter" class="section-p1 section-m1">
        <div class="newstext">
            <h4><fmt:message key="newsletter.title" /></h4>
            <p>
                <fmt:message key="newsletter.desc" />
                <span><fmt:message key="newsletter.specialOffers" /></span>
            </p>
        </div>
        <div class="form">
            <input type="text" placeholder="<fmt:message key='newsletter.emailPlaceholder' />">
            <button class="normal"><fmt:message key="newsletter.signup" /></button>
        </div>
    </section>

    <%@ include file="../includes/footer.jsp"%>

    <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
</body>
</html>
