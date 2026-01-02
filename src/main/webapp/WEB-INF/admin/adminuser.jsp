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
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
        
    <title>Admin Dashboard</title>

</head>

<body>
    <!-- Sidebar -->
   	<jsp:include page="/WEB-INF/includes/_SidebarAdmin.jsp"></jsp:include>
	 <c:set var="ctx" value="${pageContext.request.contextPath}"/>

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
                </div>
        </section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>

</body>

</html>