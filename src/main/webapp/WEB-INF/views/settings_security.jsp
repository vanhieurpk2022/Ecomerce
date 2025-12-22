<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

     <div class="container-fluid">
        <!-- Main Content -->

        <div class="container">
            <h1 class="page-title"><i class="fas fa-cog"></i> Settings</h1>

            <div class="settings-wrapper">
                <!-- Sidebar -->
                  <jsp:include page="../includes/_SidebarSetting.jsp"></jsp:include>


                <!-- Content Area -->
                <div class="content-area">
                  

                    <!-- Security Section -->
                    <section class="section" id="security">
                        <h2 class="section-title"><i class="fas fa-shield-alt"></i> Security</h2>

                        <h3 style="margin-bottom: 1rem; color: #555;">Change Password</h3>
                        <form class="form-grid">
                            <div class="form-group full-width">
                                <label for="current-password">Current Password</label>
                                <input type="password" id="current-password" placeholder="Enter current password"
                                    disabled>
                            </div>
                            <div class="form-group">
                                <label for="new-password">New Password</label>
                                <div class="input-wrapper">
                                    <input type="password" id="new-password" placeholder="Enter new password">
                                    <span id="icon_show" class="icon_show"><i class="bi bi-eye"></i></span>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm-password">Confirm Password</label>
                                <div class="input-wrapper">
                                    <input type="password" id="confirm-password" placeholder="Confirm new password">
                                    <span id="icon_show_0" class="icon_show"><i class="bi bi-eye"></i></span>

                                </div>
                            </div>
                        </form>


                        <div style="margin-top: 2rem;">
                            <h3 style="margin-bottom: 1rem; color: #555;">Recent Login Activity</h3>
                            <ul class="activity-list">
                                <li class="activity-item">
                                    <div class="activity-icon">
                                        <i class="fab fa-chrome"></i>
                                    </div>
                                    <div class="activity-info">
                                        <strong>Chrome - Windows 10</strong>
                                        <span>2 hours ago</span>
                                    </div>
                                </li>
                                <li class="activity-item">
                                    <div class="activity-icon">
                                        <i class="fab fa-edge"></i>
                                    </div>
                                    <div class="activity-info">
                                        <strong>Edge - Android</strong>
                                        <span>Yesterday</span>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="btn-group">
                            <button class="btn btn-primary"><i class="fas fa-save"></i> Update</button>
                            <button class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</button>
                        </div>
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