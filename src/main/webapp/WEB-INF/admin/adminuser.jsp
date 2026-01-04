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
      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon_ad/apple-touch-icon.png">
      <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-16x16.png">
      <link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon_ad/site.webmanifest">
      <title>Admin User</title>
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
                  <table  class="  text-center align-middle">
                     <thead>
                        <tr>
                           <th>Customer ID</th>
                           <th>Customer</th>
                           <th>Email</th>
                           <th>Phone</th>
                           <th>Purchased the order quantity</th>
                           <th>Create at</th>
                           <th>Status</th>
                           <th>Feature</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="u" items="${userList}">
                           <tr>
                              <td>#User-${u.idUser}</td>
                              <td>${u.firstName } ${u.lastName }</td>
                              <td>${u.email}</td>
                              <td>
                                 <c:choose>
                                    <c:when test="${empty u.phone }">  <span class="badge text-danger">Not Yet</span> </c:when>
                                    <c:otherwise>${u.phone}</c:otherwise>
                                 </c:choose>
                              </td>
                              <td>${u.puchasedOrders}</td>
                              <td>${u.createdAt}</td>
                              <td>
                                 <c:choose>
                                    <c:when test="${u.status ==1 }"> <span class="badge text-bg-success">Normal</span> </c:when>
                                    <c:when test="${u.status ==0 }"> <span class="badge text-bg-danger">Banned</span> </c:when>
                                    <c:when test="${u.status ==2 }">  <span class="badge text-bg-warning">temporarily banned</span> </c:when>
                                 </c:choose>
                              </td>
                              <td>
                                 <div>
                                    <a href="${ctx }/admin/delete?id=${u.idUser}" class="btn btn-warning">Delete</a>
                                    <a href="${ctx }/admin/ban?id=${u.idUser}" class="btn btn-danger">Ban</a>
                                    <a href="${ctx }/admin/unBan?id=${u.idUser}" class="btn btn-danger">unBan</a>
                                    
                                    <a href="${ctx }/admin/resetpassword?id=${u.idUser}" class="btn btn-secondary">Reset password</a>
                                 </div>
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
   </body>
</html>