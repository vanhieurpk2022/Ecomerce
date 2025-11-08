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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>
   <jsp:include page="/header.jsp"></jsp:include>

     <div class="container-fluid">
        <!-- Main Content -->

        <div class="container">
            <h1 class="page-title"><i class="fas fa-cog"></i> Settings</h1>

            <div class="settings-wrapper">
                <!-- Sidebar -->
                <aside class="sidebar">
                    <h3>Settings</h3>
                    <ul class="sidebar-menu">
                        <li><a href="#account" class="active"><i class="fas fa-user-circle"></i> Account</a></li>
                        <li><a href="#security"><i class="fas fa-shield-alt"></i> Security</a></li>
                        <li><a href="#address"><i class="fas fa-map-marker-alt"></i> Address</a></li>
                    </ul>
                </aside>

                <!-- Content Area -->
                <div class="content-area">
                    <!-- Account Section -->
                    <section class="section" id="account">
                        <h2 class="section-title"><i class="fas fa-user-circle"></i> Account Information</h2>
                        <form class="form-grid">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" placeholder="Enter username">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="firstname">First Name</label>
                                <input type="text" id="firstname" placeholder="Enter first name">
                            </div>
                            <div class="form-group">
                                <label for="lastname">Last Name</label>
                                <input type="text" id="lastname" placeholder="Enter last name">
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
                        </form>
                        <div class="btn-group">
                            <button class="btn btn-primary"><i class="fas fa-save"></i> Update</button>
                            <button class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</button>
                        </div>
                    </section>

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
                            <h3 style="margin-bottom: 1rem; color: #555;">Two-Factor Authentication</h3>
                            <div class="twofa-toggle">
                                <label class="toggle-switch">
                                    <input type="checkbox" id="2fa-toggle">
                                    <span class="slider"></span>
                                </label>
                                <span><strong>Enable 2FA</strong> for enhanced security</span>
                            </div>

                            <p style="color: #666; margin-bottom: 1rem;">Select verification method:</p>
                            <div class="verification-methods">
                                <div class="method-card selected">
                                    <i class="fas fa-envelope"></i>
                                    <p>Email</p>
                                </div>
                                <div class="method-card">
                                    <i class="fas fa-mobile-alt"></i>
                                    <p>Authenticator</p>
                                </div>
                                <div class="method-card">
                                    <i class="fas fa-sms"></i>
                                    <p>SMS</p>
                                </div>
                            </div>
                        </div>

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



   	<%@ include file="/footer.jsp" %>

         <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>

    <script>
    showHiddenPassword("new-password", "icon_show");
    showHiddenPassword("confirm-password", "icon_show_0");
        </script>
        
    <script src="${pageContext.request.contextPath}/assert/javascript/swarpTabInSettings.js"></script>
                <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
    
</body>

</html>