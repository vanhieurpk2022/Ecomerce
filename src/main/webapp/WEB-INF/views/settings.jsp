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
                        <form class="form-grid">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" value="${sessionScope.user.username }" placeholder="Enter username" disabled>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" value="${sessionScope.user.email }" placeholder="Enter email" disabled>
                            </div>
                            <div class="form-group">
                                <label for="firstname">First Name</label>
                                <input type="text" id="firstname" value="${sessionScope.user.firstName }" placeholder="Enter first name">
                            </div>
                            <div class="form-group">
                                <label for="lastname">Last Name</label>
                                <input type="text" id="lastname" value="${sessionScope.user.lastName }" placeholder="Enter last name">
                            </div>
                            <div class="form-group">
                                <label for="birthday">Birthday</label>
                                <input type="date" id="birthday">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="tel" id="phone" placeholder="Enter phone number">
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select id="gender">
                                    <option value="">Select gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                               <div class="btn-group">
                            <button class="btn btn-primary"><i class="fas fa-save"></i> Update</button>
                            <button class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</button>
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