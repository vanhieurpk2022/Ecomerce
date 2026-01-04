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


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon_ad/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon_ad/site.webmanifest">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
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
                <th>Customer</th>
                <th>Date Purchase</th>
                <th>Total Price</th>
                <th>Payment</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="o1" items="${orderList }">
            <tr class="order-row" data-href="${ctx}/admin/details?id=${o1.orderID}" style="cursor: pointer;">
                <td class="fw-bold">#${o1.orderID}</td>
                <td>
                    <div class="d-flex flex-column">
                        <span class="fw-bold">${o1.user.firstName } ${o1.user.lastName }</span>
                        <small class="text-muted">${o1.user.phone }</small>
                    </div>
                </td>
                <td>${o1.createdAt }</td>
                <td class="fw-bold text-primary"> <fmt:formatNumber value="${o1.totalAmount }" pattern="#,##0 VNĐ"/></td>
                <td>
                    <span class="badge border text-dark fw-normal">${o1.paymentMethod }</span>
                </td>
                <td>
                <c:choose>
                	<c:when test="${o1.status == 'PENDING'}"><span class="badge text-bg-secondary"> ${o1.status }</span> </c:when>
                	 <c:when test="${o1.status == 'SHIPPING'}"><span class="badge text-bg-warning"> ${o1.status }</span> </c:when>
                	 <c:when test="${o1.status == 'SUCCESS'}"><span class="badge text-bg-success"> ${o1.status }</span> </c:when>
                	 <c:when test="${o1.status == 'CANCEL'}"><span class="badge text-bg-danger"> ${o1.status }</span> </c:when>
                	 
                </c:choose>
                  
           
                </td>
                 
           
            </tr>
            </c:forEach>
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