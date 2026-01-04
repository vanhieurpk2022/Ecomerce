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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon_ad/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon_ad/site.webmanifest">

    <title>Admin Home</title>

</head>

<body>
	 <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <fmt:setLocale value="vi_VN"/>
  	<jsp:include page="/WEB-INF/includes/_SidebarAdmin.jsp"></jsp:include>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>Dashboard</h1>
            </div>
            <div class="header-right">
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm...">
                </div>
                <div class="user-profile">
                    <div class="user-avatar">AD</div>
                    <span>Admin</span>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Total users</h3>
                    <p>${ttu}</p>
                </div>
                <div class="stat-icon">👥</div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3> revenue</h3>
                    <p><fmt:formatNumber value="${rev }" pattern="#,##0 VNĐ"/></p>
                </div>
                <div class="stat-icon">💰</div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Orders</h3>
                    <p>${tto }</p>
                </div>
                <div class="stat-icon">🛒</div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Products</h3>
                    <p>${ttp }</p>
                </div>
                <div class="stat-icon">📦</div>
            </div>
        </div>

        <!-- Main Grid -->
        <div class="main-grid divide">
            <!-- Recent Orders -->
            <div class="card">
                <div class="card-header">
                    <h3>Orders Recent</h3>
                    <a href="${ctx }/admin/order" class="view-all">Details →</a>
                </div>
                <table class="  text-center align-middle">
                    <thead >
                        <tr >
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Price</th>
                            <th>Payment Method</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var ="o" items="${oor }">
                        <tr>
                            <td>#ORD-${o.orderID }</td>
                            <td>${o.user.firstName }  ${o.user.lastName }</td>
                            <td>${o.createdAt }</td>
                            <td><fmt:formatNumber value="${o.totalAmount }" pattern="#,##0 VNĐ"/></td>
                            <td >${o.paymentMethod }</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${o.status =='SUCCESS' }">   <span class="badge text-bg-success">SUCCESS</span></c:when>
                            		<c:when test="${o.status =='PENDING' }">   <span class="badge text-bg-secondary">PROCESSING</span></c:when>
                            		<c:when test="${o.status =='CANCEL' }">   <span class="badge text-bg-danger">CANCEL</span></c:when>
                            	<c:when test="${o.status =='SHIPPING' }">   <span class="badge text-bg-warning">SHIPPING</span></c:when>
                            		
                            	</c:choose>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Recent Activity -->
            <div class="card">
                <div class="card-header">
                    <h3>Hoạt động gần đây</h3>
                </div>
                <ul class="activity-list">
                    <li class="activity-item">
                        <div class="activity-icon blue">👤</div>
                        <div class="activity-info">
                            <h4>Người dùng mới đăng ký</h4>
                            <p>Nguyễn Văn E vừa đăng ký tài khoản</p>
                            <p>5 phút trước</p>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon green">✓</div>
                        <div class="activity-info">
                            <h4>Đơn hàng hoàn thành</h4>
                            <p>Đơn hàng #ORD-001 đã được giao</p>
                            <p>15 phút trước</p>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon orange">📦</div>
                        <div class="activity-info">
                            <h4>Sản phẩm mới</h4>
                            <p>Đã thêm 5 sản phẩm mới vào kho</p>
                            <p>1 giờ trước</p>
                        </div>
                    </li>
                    <li class="activity-item">
                        <div class="activity-icon blue">💬</div>
                        <div class="activity-info">
                            <h4>Đánh giá mới</h4>
                            <p>Có 3 đánh giá mới từ khách hàng</p>
                            <p>2 giờ trước</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Charts Section -->
        <div class="charts-section">
            <!-- Revenue Chart -->
            <div class="card">
                <div class="card-header">
                    <h3>Doanh thu theo tháng</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>

            <!-- Orders Chart -->
            <div class="card">
                <div class="card-header">
                    <h3>Thống kê đơn hàng</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="ordersChart"></canvas>
                </div>
            </div>

            <!-- Category Distribution -->
            <div class="card">
                <div class="card-header">
                    <h3>Phân bố danh mục sản phẩm</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="categoryChart"></canvas>
                </div>
            </div>

            <!-- User Growth -->
            <div class="card">
                <div class="card-header">
                    <h3>Tăng trưởng người dùng</h3>
                </div>
                <div class="chart-wrapper">
                    <canvas id="userGrowthChart"></canvas>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/assert/javascript/javascript_admin.js" defer ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
    
</body>

</html>