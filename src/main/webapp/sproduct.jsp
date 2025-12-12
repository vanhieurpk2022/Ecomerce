<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tech2etc Ecommerce Tutorial</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>
	<c:set var="ctx" value="${pageContext.request.contextPath }" />
	<!--  thêm header -->
	<jsp:include page="/header.jsp"></jsp:include>



	<section id="prodetails" class="section-p1">
		<div class="single-pro-image">
			<img src="${ctx }${sproduct.img}" width="100%" id="MainImg" alt="">

			<div class="small-img-group">
				<div class="small-img-col">
					<img src="${ctx }${sproduct.img}" width="100%" class="small-img"
						alt="">
				</div>
				<div class="small-img-col">
					<img src="${ctx }${sproduct.img}" width="100%" class="small-img"
						alt="">
				</div>
				<div class="small-img-col">
					<img src="${ctx }${sproduct.img}" width="100%" class="small-img"
						alt="">
				</div>
				<div class="small-img-col">
					<img src="${ctx }${sproduct.img}" width="100%" class="small-img"
						alt="">
				</div>
			</div>

		</div>
		<div class="sing-pro-details">
		
			<h6>Home / T-Shirt</h6>
			<h4>${sproduct.productName }</h4>
			<fmt:setLocale value="vi_VN"/>
			
			<h2 id="displayPrice"><fmt:formatNumber value="${sproduct.price }" pattern="#,##0 VNĐ"/></h2>
			
			<select id="selectTagSize"  >
				<c:forEach var="v" items="${getVariants}">
				    <option value="${v.size}" data-variantid="${v.variantID}" data-stock="${v.stock }" data-final-price = "${v.priceAdjustment + sproduct.price}" <c:if test="${v.stock <= 0}">disabled</c:if>>${v.size}</option>
				</c:forEach>

				
			</select>
            <input style="margin-top:15px;" id="quanity" type="number" value="1" min ="1">
			<button class="normal" id="btn_AddToCart" onclick="addToCart()">Add To Cart</button>
    
            
            <h4> <p style="opacity=50%;">Remain: <span id="remainSpan"></span>  </p><br>
            products Details</h4>
            <span>${sproduct.description}</span>
        </div>
    </section>
    <!-- Đánh giá và thông tin mở rộng -->
    <section>
        <div class="rating-flex">
            <!-- Bên trái: Đánh giá sản phẩm (DỮ LIỆU MẶC ĐỊNH) -->
            <div class="rating-panel">
                <div class="rating-title">Đánh giá</div>
                <div class="rating-summary">
                    <div>
                        <span class="rating-summary-score">5</span>
                        <span class="rating-summary-out">/5</span>
                    </div>
                    <div style="display:flex;flex-direction:column;">
                        <span class="rating-summary-label">615 khách hài lòng</span>
                        <span class="rating-summary-count">Dựa trên 615 đánh giá</span>
                    </div>
                </div>
                <div>
                    <div class="rating-row">
                        <span class="rating-bar-label">5</span>
                        <span class="rating-bar-star"><i class="fa-solid fa-star"></i></span>
                        <span class="rating-bar-body"><span class="rating-bar-active" style="width:100%;"></span></span>
                        <span class="rating-bar-percent">100%</span>
                    </div>
                    <div class="rating-row">
                        <span class="rating-bar-label">4</span>
                        <span class="rating-bar-star"><i class="fa-solid fa-star"></i></span>
                        <span class="rating-bar-body"><span class="rating-bar-active" style="width:0%;"></span></span>
                        <span class="rating-bar-percent">0%</span>
                    </div>
                    <div class="rating-row">
                        <span class="rating-bar-label">3</span>
                        <span class="rating-bar-star"><i class="fa-solid fa-star"></i></span>
                        <span class="rating-bar-body"><span class="rating-bar-active" style="width:0%;"></span></span>
                        <span class="rating-bar-percent">0%</span>
                    </div>
                    <div class="rating-row">
                        <span class="rating-bar-label">2</span>
                        <span class="rating-bar-star"><i class="fa-solid fa-star"></i></span>
                        <span class="rating-bar-body"><span class="rating-bar-active" style="width:0%;"></span></span>
                        <span class="rating-bar-percent">0%</span>
                    </div>
                    <div class="rating-row">
                        <span class="rating-bar-label">1</span>
                        <span class="rating-bar-star"><i class="fa-solid fa-star"></i></span>
                        <span class="rating-bar-body"><span class="rating-bar-active" style="width:0%;"></span></span>
                        <span class="rating-bar-percent">0%</span>
                    </div>
                </div>
                <button class="blue-btn" onclick="alert('Chức năng viết đánh giá sẽ sớm có!')">Viết đánh giá</button>
            </div>
            <!-- Bên phải: Mở rộng thông tin sản phẩm -->
            <div class="product-info-extend">
                <div class="product-info-title">Thông tin sản phẩm</div>
                <ul class="product-info-list">
                    <li><span class="product-info-label info-material"><i class="fa-solid fa-shirt"></i> Chất liệu:</span> <span class="product-info-value">100% Cotton</span></li>
                    <li><span class="product-info-label info-weight"><i class="fa-solid fa-weight-hanging"></i> Định lượng vải:</span> <span class="product-info-value">180gsm</span></li>
                    <li><span class="product-info-label info-color"><i class="fa-solid fa-palette"></i> Màu sắc:</span> <span class="product-info-value">Nhiều màu </span></li>
                    <li><span class="product-info-label info-style"><i class="fa-solid fa-tag"></i> Kiểu dáng:</span> <span class="product-info-value">Regular fit / Unisex</span></li>
                    <li><span class="product-info-label info-care"><i class="fa-solid fa-box-archive"></i> Bảo quản:</span> <span class="product-info-value">Giặt nhiệt độ thấp, không tẩy, hạn chế sấy</span></li>
                </ul>
            </div>
        </div>
    </section>
    <!-- End Đánh giá & Mở rộng -->
    <section id="product1" class="section-p1">
        <h2>Featured Products</h2>
        <p>Summer Collection New Morden Design</p>
        <div class="pro-container">
        <c:forEach var="rq" items="${TypeClothe }">
            <div class="pro">
                <img src="${ctx }${rq.img}" alt="">
                <div class="des">
                    <span>adidas</span>
                    <h5>${rq.productName }</h5>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h4>${rq.price }</h4>
                </div>
                <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${rq.productID}&type=${rq.categoryID}"><i class="bi bi-cart cart"></i></a>
            </div>
           </c:forEach>
        </div>
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
    <%@ include file="/footer.jsp" %>
	  <script src="${ctx}/assert/javascript/script.js"></script>
               <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                      <script src="${ctx}/assert/javascript/ajaxJquerry.js"></script>
    <script>
        var MainImg = document.getElementById("MainImg");
        var smallimg = document.getElementsByClassName("small-img");
        smallimg[0].onclick = function () { MainImg.src = smallimg[0].src; }
        smallimg[1].onclick = function () { MainImg.src = smallimg[1].src; }
        smallimg[2].onclick = function () { MainImg.src = smallimg[2].src; }
        smallimg[3].onclick = function () { MainImg.src = smallimg[3].src; }
    </script>

</body>
</html>