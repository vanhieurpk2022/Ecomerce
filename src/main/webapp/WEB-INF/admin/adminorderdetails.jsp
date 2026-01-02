<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    <title>Admin Dashboard</title>

</head>

<body>
    <!-- Sidebar -->
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
                <a href="#" onclick="history.back();" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left"></i> Quay lại
                </a>
                <div>
                    <button class="btn btn-primary me-2"><i class="bi bi-printer"></i> In hóa đơn</button>
                    <button class="btn btn-success">Cập nhật đơn hàng</button>
                </div>
            </div>

            <div class="row">
                <!-- Cột bên trái: Danh sách sản phẩm -->
                <div class="col-lg-8">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0">Sản phẩm (3)</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table align-middle">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Đơn giá</th>
                                            <th>Số lượng</th>
                                            <th class="text-end">Tổng cộng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Dòng sản phẩm 1 -->
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://via.placeholder.com/60" class="product-img me-3" alt="product">
                                                    <div>
                                                        <h6 class="mb-0">iPhone 15 Pro Max</h6>
                                                        <small class="text-muted">Màu: Titan Tự Nhiên</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>29,000,000đ</td>
                                            <td>1</td>
                                            <td class="text-end fw-bold">29,000,000đ</td>
                                        </tr>
                                        <!-- Dòng sản phẩm 2 -->
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://via.placeholder.com/60" class="product-img me-3" alt="product">
                                                    <div>
                                                        <h6 class="mb-0">Ốp lưng MagSafe</h6>
                                                        <small class="text-muted">Loại: Silicon</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>1,500,000đ</td>
                                            <td>2</td>
                                            <td class="text-end fw-bold">3,000,000đ</td>
                                        </tr>
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
                                    <p class="text-muted mb-0">Thanh toán khi nhận hàng (COD)</p>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="fw-bold"><i class="bi bi-truck me-2"></i>Phương thức vận chuyển</h6>
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
                            <h6 class="text-muted mb-3">Trạng thái hiện tại</h6>
                            <span class="badge bg-info text-dark fs-6 py-2 px-4 mb-3">Đang giao hàng</span>
                            <select class="form-select form-select-sm mt-2">
                                       <option value="pending" selected>⏳ Chờ xử lý</option>
                        <option value="shipping">🚚 Đang giao</option>
                        <option value="completed">✅ Hoàn thành</option>
                        <option value="cancelled">❌ Đã hủy</option>
                            </select>
                        </div>
                    </div>

                    <!-- Khách hàng -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white">
                            <h6 class="mb-0">Khách hàng</h6>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 40px; height: 40px;">
                                    NV
                                </div>
                                <div>
                                    <p class="mb-0 fw-bold">Nguyễn Văn A</p>
                                    <small class="text-muted">Khách hàng thành viên</small>
                                </div>
                            </div>
                            <p class="mb-1"><i class="bi bi-envelope me-2"></i>anguyen@gmail.com</p>
                            <p class="mb-1"><i class="bi bi-phone me-2"></i>0987 654 321</p>
                            <hr>
                            <h6 class="fw-bold small">Địa chỉ nhận hàng</h6>
                            <p class="text-muted mb-0 small">
                                123 Đường ABC, Phường 4, Quận 10,<br>
                                Thành phố Hồ Chí Minh.
                            </p>
                        </div>
                    </div>

                    <!-- Tổng cộng -->
                    <div class="card shadow-sm order-summary-card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Tạm tính:</span>
                                <span>32,000,000đ</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Phí vận chuyển:</span>
                                <span>30,000đ</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2 text-danger">
                                <span>Giảm giá:</span>
                                <span>-0đ</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h5 class="fw-bold">Tổng cộng:</h5>
                                <h5 class="fw-bold text-primary">32,030,000đ</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
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