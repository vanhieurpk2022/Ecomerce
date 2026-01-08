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
<title><fmt:message key="app.title" /> | <fmt:message key="policy.title" /></title>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

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
/* Nhẹ nhàng thêm vài style để section chính sách nhìn giống “blog/about” */
.policy-wrap{
    max-width: 980px;
    margin: 0 auto;
}
.policy-card{
    background: #fff;
    border: 1px solid #e9ecef;
    border-radius: 14px;
    padding: 18px 18px;
    margin-bottom: 16px;
    box-shadow: 0 6px 20px rgba(0,0,0,.04);
}
.policy-card h3{
    font-size: 18px;
    margin-bottom: 10px;
}
.policy-card p, .policy-card li{
    line-height: 1.75;
    color: #334155;
}
.policy-card ul{ margin-bottom: 0; }
.policy-note{
    border-left: 4px solid #088178; /* xanh “Cara” */
    background: #f0fbfa;
}
.policy-grid{
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
}
@media (max-width: 768px){
    .policy-grid{ grid-template-columns: 1fr; }
}
.anchor-links a{
    display:inline-block;
    margin: 0 10px 10px 0;
    padding: 8px 12px;
    border: 1px solid #dbe3ea;
    border-radius: 999px;
    font-weight: 600;
    color: #0f172a;
    background: #fff;
}
.anchor-links a:hover{
    border-color:#088178;
    color:#088178;
}
</style>
</head>

<body>

    <c:set var="ctx" value="${pageContext.request.contextPath}" />

    <!-- thêm header -->
    <jsp:include page="../includes/header.jsp"></jsp:include>

    <!-- Page Header giống About/Blog -->
    <section id="page-header" class="blog-header">
        <h2><fmt:message key="policy.header.title" /></h2>
        <p><fmt:message key="policy.header.desc" /></p>
    </section>

    <!-- Nội dung chính sách -->
    <section id="policy-content" class="section-p1">
        <div class="policy-wrap">

            <!-- Quick anchors -->
            <div class="anchor-links" style="margin-bottom:14px;">
                <a href="#purchase"><i class="fa-solid fa-bag-shopping"></i> <fmt:message key="policy.anchors.purchase"/></a>
                <a href="#shipping"><i class="fa-solid fa-truck-fast"></i> <fmt:message key="policy.anchors.shipping"/></a>
                <a href="#returns"><i class="fa-solid fa-rotate-left"></i> <fmt:message key="policy.anchors.returns"/></a>
                <a href="#payment"><i class="fa-solid fa-credit-card"></i> <fmt:message key="policy.anchors.payment"/></a>
                <a href="#privacy"><i class="fa-solid fa-user-shield"></i> <fmt:message key="policy.anchors.privacy"/></a>
                <a href="#cookies"><i class="fa-solid fa-cookie-bite"></i> <fmt:message key="policy.anchors.cookies"/></a>
            </div>

            <div class="policy-card policy-note">
                <h3><i class="fa-solid fa-circle-info"></i> <fmt:message key="policy.note.title"/></h3>
                <p style="margin:0;">
                    <fmt:message key="policy.note.desc"/>
                </p>
            </div>

            <div id="purchase" class="policy-card">
                <h3><i class="fa-solid fa-bag-shopping"></i> <fmt:message key="policy.purchase.title"/></h3>
                <p><fmt:message key="policy.purchase.desc"/></p>
                <ul>
                    <li><fmt:message key="policy.purchase.li1"/></li>
                    <li><fmt:message key="policy.purchase.li2"/></li>
                    <li><fmt:message key="policy.purchase.li3"/></li>
                    <li><fmt:message key="policy.purchase.li4"/></li>
                </ul>
            </div>

            <div id="shipping" class="policy-card">
                <h3><i class="fa-solid fa-truck-fast"></i> <fmt:message key="policy.shipping.title"/></h3>
                <div class="policy-grid">
                    <div>
                        <p><b><fmt:message key="policy.shipping.sub1"/></b></p>
                        <ul>
                            <li><fmt:message key="policy.shipping.li1"/></li>
                            <li><fmt:message key="policy.shipping.li2"/></li>
                            <li><fmt:message key="policy.shipping.li3"/></li>
                        </ul>
                    </div>
                    <div>
                        <p><b><fmt:message key="policy.shipping.sub2"/></b></p>
                        <ul>
                            <li><fmt:message key="policy.shipping.li4"/></li>
                            <li><fmt:message key="policy.shipping.li5"/></li>
                            <li><fmt:message key="policy.shipping.li6"/></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div id="returns" class="policy-card">
                <h3><i class="fa-solid fa-rotate-left"></i> <fmt:message key="policy.returns.title"/></h3>
                <p><fmt:message key="policy.returns.desc"/></p>
                <ul>
                    <li><fmt:message key="policy.returns.li1"/></li>
                    <li><fmt:message key="policy.returns.li2"/></li>
                    <li><fmt:message key="policy.returns.li3"/></li>
                    <li><fmt:message key="policy.returns.li4"/></li>
                </ul>

                <div class="policy-card policy-note" style="margin-top:14px; margin-bottom:0;">
                    <h3 style="margin-bottom:8px;"><i class="fa-solid fa-shirt"></i> <fmt:message key="policy.sizeGuide.title"/></h3>
                    <p style="margin:0;"><fmt:message key="policy.sizeGuide.desc"/></p>
                </div>
            </div>

            <div id="payment" class="policy-card">
                <h3><i class="fa-solid fa-credit-card"></i> <fmt:message key="policy.payment.title"/></h3>
                <p><fmt:message key="policy.payment.desc"/></p>
                <ul>
                    <li><fmt:message key="policy.payment.li1"/></li>
                    <li><fmt:message key="policy.payment.li2"/></li>
                    <li><fmt:message key="policy.payment.li3"/></li>
                    <li><fmt:message key="policy.payment.li4"/></li>
                </ul>
            </div>

            <div id="privacy" class="policy-card">
                <h3><i class="fa-solid fa-user-shield"></i> <fmt:message key="policy.privacy.title"/></h3>
                <p><fmt:message key="policy.privacy.desc"/></p>
                <ul>
                    <li><fmt:message key="policy.privacy.li1"/></li>
                    <li><fmt:message key="policy.privacy.li2"/></li>
                    <li><fmt:message key="policy.privacy.li3"/></li>
                    <li><fmt:message key="policy.privacy.li4"/></li>
                </ul>

                <div class="policy-grid" style="margin-top:12px;">
                    <div class="policy-card" style="margin:0;">
                        <h3 style="margin-bottom:8px;"><i class="fa-solid fa-database"></i> <fmt:message key="policy.data.title"/></h3>
                        <p style="margin:0;"><fmt:message key="policy.data.desc"/></p>
                    </div>
                    <div class="policy-card" style="margin:0;">
                        <h3 style="margin-bottom:8px;"><i class="fa-solid fa-shield-halved"></i> <fmt:message key="policy.security.title"/></h3>
                        <p style="margin:0;"><fmt:message key="policy.security.desc"/></p>
                    </div>
                </div>
            </div>

            <div id="cookies" class="policy-card">
                <h3><i class="fa-solid fa-cookie-bite"></i> <fmt:message key="policy.cookies.title"/></h3>
                <p><fmt:message key="policy.cookies.desc"/></p>
                <ul>
                    <li><fmt:message key="policy.cookies.li1"/></li>
                    <li><fmt:message key="policy.cookies.li2"/></li>
                    <li><fmt:message key="policy.cookies.li3"/></li>
                </ul>
            </div>

            <div class="policy-card">
                <h3><i class="fa-solid fa-headset"></i> <fmt:message key="policy.contact.title"/></h3>
                <p style="margin-bottom:10px;"><fmt:message key="policy.contact.desc"/></p>
                <ul>
                    <li><b>Email:</b> support@cara-store.com</li>
                    <li><b><fmt:message key="policy.contact.hotlineLabel"/></b> 1900 0000 (08:00 - 20:00)</li>
                    <li><b><fmt:message key="policy.contact.addressLabel"/></b> 123 Fashion Street, District 1, HCM</li>
                </ul>
            </div>

        </div>
    </section>

    <!-- Giữ lại các section “feature + newsletter” giống các trang khác để đồng bộ website -->
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
