<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style_admin.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
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
                <h1>Orders</h1>
            </div>
            <div class="header-right">

                <div class="user-profile">
                    <div class="user-avatar">AD</div>
                    <span>Admin</span>
                </div>
            </div>
        </div>


        <!-- Main Grid -->
        <div class="main-grid">
            <!-- Recent Orders -->
            <div class="card">
                <div class="card-header">
                    <h3>List Orders</h3>
                    <div class="search-box">
                        <input type="text" placeholder="Tìm kiếm...">
                    </div>
                </div>
                <div class="table_wrapper">
    <table class="table table-hover align-middle"> <!-- Thêm class table-hover của bootstrap -->
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Khách hàng</th>
                <th>Ngày đặt</th>
                <th>Tổng tiền</th>
                <th>Thanh toán</th>
                <th>Trạng thái</th>
                <th class="text-center">Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <tr class="order-row" data-href="${ctx}/admin/details" style="cursor: pointer;">
                <td class="fw-bold">#1024</td>
                <td>
                    <div class="d-flex flex-column">
                        <span class="fw-bold">Nguyễn Văn A</span>
                        <small class="text-muted">0987.654.321</small>
                    </div>
                </td>
                <td>20/05/2024 10:30</td>
                <td class="fw-bold text-primary">1.250.000đ</td>
                <td>
                    <span class="badge border text-dark fw-normal">Chuyển khoản</span>
                </td>
                <td>
                    <!-- Dùng select nhỏ gọn hoặc Badge -->
                       ⏳ Chờ xử lý
           
                </td>
           
            </tr>
            <!-- Thêm các dòng khác tương tự -->
        </tbody>
    </table>
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
	
	
	</script>
</body>

</html>