<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Admin Dashboard</title>

</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Admin Panel</h2>
            <p>Quản trị hệ thống</p>
        </div>
        <nav class="sidebar-menu">
            <a href="adminindex.html" class="menu-item ">
                <i class="icon-dashboard"></i>
                <span>Dashboard</span>
            </a>
            <a href="adminuser.html" class="menu-item active">
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
                <h1>User</h1>
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
                    <h3>List user</h3>
                    <div class="search-box">
                        <input type="text" placeholder="Tìm kiếm...">
                    </div>
                </div>
                <div class="table_wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Mã khách hàng</th>
                                <th>Khách hàng</th>
                                <th>Email</th>
                                <th>SĐT</th>
                                <th>Số đơn hàng đã mua</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#User-001</td>
                                <td>Nguyễn Văn A</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-002</td>
                                <td>Trần Thị B</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-003</td>
                                <td>Lê Văn C</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>#User-004</td>
                                <td>Phạm Thị D</td>
                                <td>example@gmail.com</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- Chức năng Admin với User -->
        <section id="toolUser">
            <div class="toolUser_btn">
                <!-- Header -->
                <div class="header">
                    <button>Xóa tài khoản</button>
                    <button>cấm tài khoản</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                </div>
        </section>


        <script src="javascript.js" defer></script>

</body>

</html>