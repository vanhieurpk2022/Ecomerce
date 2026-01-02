<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style_admin.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>

    <title>Admin Dashboard</title>

</head>

<body>
	 <c:set var="ctx" value="${pageContext.request.contextPath}"/>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Admin Panel</h2>
            <p>Quản trị hệ thống</p>
        </div>
        <nav class="sidebar-menu">
            <a href="./adminindex.html" class="menu-item active">
                <i class="icon-dashboard"></i>
                <span>Dashboard</span>
            </a>
            <a href="./adminuser.html" class="menu-item">
                <i class="icon-users"></i>
                <span>User</span>
            </a>
            <a href="adminproducts.html" class="menu-item">
                <i class="icon-products"></i>
                <span>Products</span>
            </a>
            <a href="adminorder.html" class="menu-item">
                <i class="icon-orders"></i>
                <span>Order</span>
            </a>
            <a href="index.html" class="menu-item">
                <i class="icon-analytics"></i>
                <span>Website</span>
            </a>
            <a href="#" class="menu-item">
                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                <span>Sign out</span>
            </a>
        </nav>
    </div>

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
                    <h3>Tổng người dùng</h3>
                    <p>2,543</p>
                </div>
                <div class="stat-icon">👥</div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Doanh thu</h3>
                    <p>₫45.2M</p>
                </div>
                <div class="stat-icon">💰</div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Đơn hàng</h3>
                    <p>1,234</p>
                </div>
                <div class="stat-icon">🛒</div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Sản phẩm</h3>
                    <p>856</p>
                </div>
                <div class="stat-icon">📦</div>
            </div>
        </div>

        <!-- Main Grid -->
        <div class="main-grid divide">
            <!-- Recent Orders -->
            <div class="card">
                <div class="card-header">
                    <h3>Đơn hàng gần đây</h3>
                    <a href="#" class="view-all">Xem tất cả →</a>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Khách hàng</th>
                            <th>Sản phẩm</th>
                            <th>Giá trị</th>
                            <th>Số Lượng</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#ORD-001</td>
                            <td>Nguyễn Văn A</td>
                            <td>iPhone 15 Pro</td>
                            <td>₫29.990.000</td>
                            <td>0</td>
                            <td><span class="badge success">Hoàn thành</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-002</td>
                            <td>Trần Thị B</td>
                            <td>MacBook Air M2</td>
                            <td>₫24.990.000</td>
                            <td>0</td>
                            <td><span class="badge pending">Đang xử lý</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-003</td>
                            <td>Lê Văn C</td>
                            <td>AirPods Pro</td>
                            <td>₫5.990.000</td>
                            <td>0</td>
                            <td><span class="badge success">Hoàn thành</span></td>
                        </tr>

                        <tr>
                            <td>#ORD-004</td>
                            <td>Phạm Thị D</td>
                            <td>iPad Pro 12.9"</td>
                            <td>₫26.990.000</td>
                            <td>0</td>
                            <td><span class="badge cancelled">Đã hủy</span></td>
                        </tr>
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
    </div>
    <script src="javascript.js" defer></script>
</body>

</html>