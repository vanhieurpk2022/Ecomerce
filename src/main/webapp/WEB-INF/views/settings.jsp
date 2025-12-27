<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>
   <jsp:include page="../includes/header.jsp"></jsp:include>
			<c:set var="ctx" value="${pageContext.request.contextPath}" />

     <div class="container-fluid">
        <!-- Main Content -->

        <div class="container">
            <h1 class="page-title"><i class="fas fa-cog"></i> Settings</h1>

            <div class="settings-wrapper">
                <!-- Sidebar -->
                   <jsp:include page="../includes/_SidebarSetting.jsp"></jsp:include>


                <!-- Content Area -->
                <div class="content-area">
                    <!-- Account Section -->
                    <section class="section" id="account">
                        <h2 class="section-title"><i class="fas fa-user-circle"></i> Account Information</h2>
                        <form class="form-grid" method="POST" action="${ctx }/user/updateAccountInfo">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" value="${requestScope.getProfile.username }" placeholder="Enter username" disabled>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" value="${requestScope.getProfile.email }" placeholder="Enter email" disabled>
                            </div>
                            <div class="form-group">
                                <label for="firstname">First Name</label>
                                <input type="text" id="firstname" value="${sessionScope.user.firstname }" placeholder="Enter first name" name="firstname">
                            </div>
                            <div class="form-group">
                                <label for="lastname">Last Name</label>
                                <input type="text" id="lastname" value="${sessionScope.user.lastname }" placeholder="Enter last name" name="lastname">
                            </div>
                            <div class="form-group">
                                <label for="birthday">Birthday</label>
                                <input type="date" id="birthday" name="birthday" value="${requestScope.getProfile.birthday }">
                            </div>
                           
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select id="gender" name ="gender">
                                    <option value="-1" ${requestScope.getProfile.gender ==-1 ?"selected":""}>Select gender</option>
                                    <option value="0" ${requestScope.getProfile.gender ==0 ?"selected":""}>Male</option>
                                    <option value="1" ${requestScope.getProfile.gender ==1 ?"selected":""}>Female</option>
                                    <option value="2" ${requestScope.getProfile.gender ==2 ?"selected":""}>Other</option>
                                </select>
                            </div>
                            
                             <div class="form-group full-width mb-0">
                           							 <!-- Thông báo lỗi -->
                            	<c:choose>
								    <c:when test="${msg_type == 'sus' }"> <!-- Sửa tyence -> type -->
								        <div class="text-center"> <span style="color: green;">${msg}</span></div>
								    </c:when>
								    <c:when test="${msg_type == 'error' }"> <!-- Sửa tye -> type -->
								        <div class="text-center"> <span  style="color: red;">${msg}</span></div>
								    </c:when>
								</c:choose>
               				   
                            </div>
                            
                               <div class="btn-group">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Update</button>
                            <button type="reset" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</button>
                        </div>
                        </form>
                     
                    </section>

                   
                </div>
            </div>
        </div>
    </div>



   	<%@ include file="../includes/footer.jsp" %>

         <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>

    <script>
    showHiddenPassword("new-password", "icon_show");
    showHiddenPassword("confirm-password", "icon_show_0");
        </script>
        
                <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
    
</body>

</html>