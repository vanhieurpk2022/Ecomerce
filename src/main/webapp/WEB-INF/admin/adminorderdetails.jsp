<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style_admin.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" />
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon_ad/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon_ad/site.webmanifest">
    <title>Admin Dashboard</title>

</head>

<body>
    <!-- Sidebar -->
          <fmt:setLocale value="vi_VN"/>
    
      	<jsp:include page="/WEB-INF/includes/_SidebarAdmin.jsp"></jsp:include>
	 <c:set var="ctx" value="${pageContext.request.contextPath}"/>


     <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>Chi tiết đơn hàng</h1>
            </div>
            <div class="header-right">
                <div class="user-profile">
                    <div class="user-avatar">AD</div>
                    <span>Admin</span>
                </div>
            </div>
        </div>

        <div class="container-fluid p-4">
            <!-- Nút quay lại và hành động -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <a href="${ctx }/admin/order"  class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
                <div>
                    <button class="btn btn-primary me-2"><i class="bi bi-printer"></i> In hóa đơn</button>
                    <button class="btn btn-success" onclick="getPriceShipping('${ctx}')">Cập nhật đơn hàng</button>
                </div>
            </div>

            <div class="row">
                <!-- Cột bên trái: Danh sách sản phẩm -->
                <div class="col-lg-8">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0">Products</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class=" text-center align-middle">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Products</th>
                                            <th>Quantity</th>
                                            <th class="text-end">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Dòng sản phẩm 1 -->
                                        <c:forEach var="odd" items="${odList }">
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="${ctx }${odd.product.img}" class="product-img me-3" height="80" width="80" alt="product">
                                                    <div>
                                                        <h6 class="mb-0">${odd.product.productName }</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${odd.quantity}</td>
                                            <td class="text-end fw-bold"> <fmt:formatNumber value="${odd.price }" pattern="#,##0 VNĐ"/></td>
                                        </tr>
                                     </c:forEach>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Thông tin thanh toán -->
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <h6 class="fw-bold"><i class="bi bi-credit-card me-2"></i>Phương thức thanh toán</h6>
                                    <c:choose>
                                    	<c:when test="${o2.paymentMethod =='COD' }">  <p class="text-muted mb-0">Thanh toán khi nhận hàng (COD)</p></c:when>
                                    	<c:when test="${o2.paymentMethod =='MOMO' }">  <p class="text-muted mb-0">Thanh Toán Chuyển khoản MOMO</p></c:when>
                                    	<c:when test="${o2.paymentMethod =='BANK' }">  <p class="text-muted mb-0">Thanh Toán Chuyển khoản BANK</p></c:when>
                                    	<c:when test="${o2.paymentMethod =='CARD' }">  <p class="text-muted mb-0">Thanh Toán  CARD</p></c:when>
                                    	
                                    </c:choose>
                                   
                                </div>
                                <div class="col-md-6">
                                    <h6 class="fw-bold"><i class="bi bi-truck me-2"></i>Transport method</h6>
                                    <p class="text-muted mb-0">Giao hàng nhanh (GHN)</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Cột bên phải: Thông tin khách hàng & Tổng tiền -->
                <div class="col-lg-4">
                    <!-- Trạng thái đơn hàng -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-body text-center">
                            <h6 class="text-muted mb-3">Current status</h6>
                            <span class="badge bg-info text-dark fs-6 py-2 px-4 mb-3">${o2.status}</span>
                            <select class="form-select form-select-sm mt-2" id="stausOrders">
                                       <option value="pending" ${o2.status=='PENDING'?'selected':'' }>Pending</option>
                        <option value="shipping" ${o2.status=='SHIPPING'?'selected':'' }>Shipping</option>
                        <option value="success" ${o2.status=='SUCCESS'?'selected':'' }>Success</option>
                        <option value="cancel" ${o2.status=='CANCEL'?'selected':'' }>Cancel</option>
                            </select>
							<input type="hidden" value="${o2.orderID }" id="orderId"/>
                        </div>
                    </div>

                    <!-- Khách hàng -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white">
                            <h6 class="mb-0">Customer</h6>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 40px; height: 40px;">
                                    NV
                                </div>
                                <div>
                                    <p class="mb-0 fw-bold">${o2.user.firstName } ${o2.user.lastName}</p>
                                    <small class="text-muted">Khách hàng thành viên</small>
                                </div>
                            </div>
                            <p class="mb-1"><i class="bi bi-envelope me-2"></i>${o2.user.email}</p>
                            <p class="mb-1"><i class="bi bi-phone me-2"></i>${o2.user.phone}</p>
                            <hr>
                            <h6 class="fw-bold small">Address Receive</h6>
                            <p class="text-muted mb-0 small">
                                ${o2.address.fullAddress},${o2.address.ward},<br>
                               ${o2.address.cityName}
                            </p>
                        </div>
                    </div>

                    <!-- Tổng cộng -->
                    <div class="card shadow-sm order-summary-card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Subtotal:</span>
                                <span> <fmt:formatNumber value="${o2.subtotal}" pattern="#,##0 VNĐ"/></span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Shipping fee:</span>
                                <span><fmt:formatNumber value="${o2.shipping_fee }" pattern="#,##0 VNĐ"/></span>
                            </div>
                            <div class="d-flex justify-content-between mb-2 text-danger">
                                <span>Discount:</span>
                                <span><fmt:formatNumber value="${o2.discountAmount}" pattern="#,##0 VNĐ"/></span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h5 class="fw-bold">Total:</h5>
                                <h5 class="fw-bold text-primary"><fmt:formatNumber value="${o2.totalAmount }" pattern="#,##0 VNĐ"/></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
	               <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	                     <script src="${pageContext.request.contextPath}/assert/javascript/adminAjax.js"></script>
	               
	
	<script>

	document.querySelectorAll(".order-row").forEach(row => {
	    row.addEventListener("click", function () {
	        window.location.href = this.dataset.href;
	    });
	});
	
	document.querySelectorAll(".order-status").forEach(select => {
	    select.addEventListener("click", function (e) {
	        e.stopPropagation(); // 🚫 không cho click lan lên <tr>
	    });
	});
	</script>
</body>

</html>