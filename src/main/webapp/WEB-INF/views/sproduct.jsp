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
 <style>
        .rating-flex {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: stretch;
            margin: 22px 0 46px 0;
            flex-wrap: wrap;
            gap: 48px;
            min-height: 340px;
        }
        .rating-panel {
            background: #fafbfc;
            border-radius: 16px;
            box-shadow: 0 2px 38px rgba(110,132,220,0.09);
            padding: 36px 30px 36px 30px;
            font-family: inherit;
            min-width: 350px;
            flex: 1;
            max-width: 600px;
            display: flex;
            flex-direction: column;
            justify-content: stretch;
        }
        .rating-title {
            font-weight: 700;
            font-size: 1.18em;
            color: #232a36;
            margin-bottom: 15px;
        }
        .rating-row { display: flex; align-items: center; margin-bottom: 7px; }
        .rating-bar-label { width: 22px; text-align: right; font-size: 1em; color: #666a86;}
        .rating-bar-star { color: #febe3c; font-size: 1.13em; margin: 0 5px;}
        .rating-bar-body {
            flex: 1;
            height: 8px;
            background: #e7e9f0;
            border-radius: 12px;
            overflow: hidden;
            margin-right: 16px;
            margin-left: 7px;
            position: relative;
        }
        .rating-bar-active {
            display: block;
            height: 100%;
            background: linear-gradient(90deg,#16b6c7,#febe3c);
            border-radius: 12px;
            position: absolute; left: 0; top: 0;
        }
        .rating-bar-percent {
            min-width: 28px;
            color: #7d8ab8;
            font-size: .98em;
        }
        .rating-summary {
            display: flex;
            gap: 12px;
            align-items: center;
            margin-bottom: 16px;
        }
        .rating-summary-score { font-size: 2.19em; color: #ff982c; font-weight: bold; margin-right: 2px; }
        .rating-summary-out { font-size: 1.08em; color: #666; }
        .rating-summary-label { font-size: 0.98em; color: #4a4a69; margin-bottom: 1px;}
        .rating-summary-count { font-size: 0.98em; color: #3d4c79; opacity: .78; margin-left: 2px;}
        .rating-panel .blue-btn {
            padding: 14px 0;
            border: none;
            border-radius: 7px;
            background: linear-gradient(90deg,#3790f7 0%,#37b3e1 100%);
            color: #fff;
            font-weight: 600;
            font-size: 1.06em;
            display: block;
            width: 100%;
            cursor: pointer;
            margin-top: 16px;
            margin-bottom:4px;
            box-shadow: 0 2px 12px #8ac6f539;
            transition: background .13s;
        }
        .rating-panel .blue-btn:hover { background: #2f7ce4; }

        .product-info-extend {
            background: #f7f8fc;
            border-radius: 16px;
            box-shadow: 0 2px 9px rgba(130,160,230,.09);
            padding: 36px 30px 36px 30px;
            font-size: 1.09em;
            width: 100%;
            min-width: 350px;
            max-width: 600px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: stretch;
        }
        .product-info-title {
            font-size: 1.17em;
            font-weight: 600;
            color: #283757;
            margin-bottom: 18px;
        }
        .product-info-list {
            list-style: none;
            padding: 0;
            margin-bottom: 0;
        }
        .product-info-list li {
            margin-bottom: 15px;
        }
        .product-info-label {
            font-weight: 500;
            margin-right: 4px;
        }
        .info-material { color: #4a9f97; }
        .info-weight { color: #4895a8; }
        .info-color { color: #3845b5; }
        .info-style { color: #81828a; }
        .info-care { color: #cb6c3c; }
        .product-info-value {
            color: #313b4e;
        }
        @media (max-width:1200px) {
            .rating-flex {
                gap: 24px;
            }
            .rating-panel, .product-info-extend {
                max-width: 500px;
                min-width: 250px;
                padding: 28px 12px;
            }
        }
        @media (max-width:900px){
            .rating-flex {flex-direction:column; gap:24px;}
            .rating-panel, .product-info-extend {max-width:100%;min-width:180px;}
        }
        @media (max-width:600px){
            .rating-panel, .product-info-extend {padding:13px 2vw;}
            .product-info-title {font-size:1em;}
            .rating-title{font-size:1em;}
        }
        @media(max-width:480px){
            .rating-summary-score{font-size:1.15em;}
            .rating-panel, .product-info-extend {padding:8px 1vw;}
            .rating-flex{gap:11px;}
        }
    </style>
<body>
	<c:set var="ctx" value="${pageContext.request.contextPath }" />
	<!--  thêm header -->
	<jsp:include page="../includes/header.jsp"></jsp:include>



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
    <%@ include file="../includes/footer.jsp" %>
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