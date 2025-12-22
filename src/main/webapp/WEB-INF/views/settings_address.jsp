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
                   


                    <!-- Address Section -->
                    <section class="section" id="address">
                        <h2 class="section-title"><i class="fas fa-map-marker-alt"></i> Address</h2>
                        <form class="form-grid">
                            <div class="form-group full-width">
                                <label for="address1">Address Line 1</label>
                                <input type="text" id="address1" placeholder="Enter your address">
                            </div>
                            <div class="form-group">
                                <label for="district">District</label>
                                <input type="text" id="district" placeholder="Enter district">
                            </div>
                            <div class="form-group">
                                <label for="city">City / Province</label>
                                <input type="text" id="city" placeholder="Enter city">
                            </div>
                            <div class="form-group">
                                <label for="country">Country</label>
                                <select id="country">
                                    <option value="vn">Việt Nam</option>
                                    <option value="cn">Trung Quốc</option>
                                    <option value="tw">Đài Loan</option>
                                    <option value="kr">Hàn Quốc</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="postal">Postal Code</label>
                                <input type="text" id="postal" placeholder="Enter postal code">
                            </div>
                        </form>

                        <div class="location-display">
                            <i class="fas fa-map-marker-alt"></i>
                            <div>
                                <strong>Current Location</strong>
                                <p style="color: #666; margin-top: 0.5rem;">798A Đ. Nguyễn Thị Minh Khai, Tân Đông Hiệp,
                                    Dĩ
                                    An, Bình Dương, VN.</p>
                            </div>
                        </div>
                        <!-- <div class="location-display">
                            <i class="fas fa-map-marker-alt"></i>
                            <div>
                                <strong>Current Location</strong>
                                <p style="color: #666; margin-top: 0.5rem;">798A Đ. Nguyễn Thị Minh Khai, Tân Đông Hiệp,
                                    Dĩ
                                    An, Bình Dương, VN.</p>
                            </div>
                        </div> -->
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