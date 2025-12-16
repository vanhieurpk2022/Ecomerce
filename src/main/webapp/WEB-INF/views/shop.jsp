<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
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
		<c:set var="ctx" value="${pageContext.request.contextPath }"/>

    <jsp:include page="../includes/header.jsp"></jsp:include>


    <section id="page-header">
        <h2>#stayhome</h2>
        <p>Save more with coupons & up to 70% off!</p>
    </section>

    <section id="filter">
        <div class="filter_main">
            <div class="sort">
                <span>Sắp xếp theo</span>
                <button class="recent">Phổ biến</button>
                <button>Mới nhất</button>
            </div>

            <div class="category">
                <span>Danh mục</span>
                <select name="category">
                    <option value="all">Tất cả</option>
                    <option value="pants">Quần</option>
                    <option value="shirt">Áo</option>
                </select>
            </div>

            <div class="price">
                <select name="price">
                    <option value="default">Giá</option>
                    <option value="asc">Giá từ thấp đến cao</option>
                    <option value="desc">Giá từ cao đến thấp</option>
                </select>
            </div>
        </div>
    </section>

    <section id="product1" class="section-p1">

		
		
        <div class="pro-container">
        <c:forEach var="p" items="${ListProducts}">

            <div class="pro" >
                <img src="${ctx}${p.img}" alt="">
                <div class="des">
                    <span>adidas</span>
                    <h5>${p.productName }</h5>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <fmt:setLocale value="vi_VN"/>
                    <h4><fmt:formatNumber value="${p.price }" pattern="#,##0 VNĐ"/></h4>
                </div>
                <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${p.productID}&type=${p.categoryID}" ><i class="bi bi-cart cart"></i></a>
            </div>
        </c:forEach>
        </div>
    </section>

    <section id="pagination" class="section-p1">
            <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
      <a href="${pageContext.request.contextPath}/shop?action=showCard&page=0">0</a>
        <a href="${pageContext.request.contextPath}/shop?action=showCard&page=1">1</a>
        <a href="${pageContext.request.contextPath}/shop?action=showCard&page=2">2</a>
        
      <a href="${pageContext.request.contextPath}/shop?action=showCard&page=${currentPage + 1}">
    <i class="fa-solid fa-arrow-right"></i>
</a>

    </section>

    <section id="newsletter" class="section-p1 section-m1">
        <div class="newstext">
            <h4>Sign Up For Newsletters</h4>
            <p>Get E-mail updates about our latest shop and <span>special offers.</span></p>
        </div>
        <div class="form">
            <input type="text" placeholder=" Your email address">
            <button class="normal">Sign Up</button>
        </div>
    </section>


    <%@ include file="../includes/footer.jsp" %>

   
       <script src="${ctx}/assert/javascript/script.js"></script>

</body>

</html>