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

    <section id="settings">
        <div class="settings_header">
            <h1>Settings</h1>

            <div class="setting_header_nav">
                <ul class="settings_nav">
                    <li><a id="tab_account" href="#account" class="settings_active">Account</a></li>
                    <li><a id="tab_security" href="#settings_security">Security</a></li>
                    <li><a id="tab_address" href="#settings_address">Address</a></li>
                </ul>
                <!-- account -->
                <div id="settings_account">
                    <div class="account_content_header">
                        <div class="avatar"></div>
                        <span>Tên người dùng</span>
                        <hr>
                    </div>
                    <div class="account_content_main">
                        <div>
                            <label for="person_firstname ">First name</label>
                            <input type="text" name="person_firstname " id="person_firstname">
                            <label>Last name</label>
                            <input type="text" name="person_lastname" id="person_lastname">
                        </div>
                        <div>


                            <label for="person_birthday ">Birthday</label>
                            <input type="date" name="person_birthday" id="person_birthday">
                            <label for="person_phone">Phone</label>
                            <input type="text" name="person_phone" id="person_phone">
                        </div>
                        <div>

                            <label for="person_email">Email</label>
                            <input type="text" name="person_email" id="person_email">

                            <label for="">Gender</label>
                            <input type="text" name="" id="" value="Female" disabled>
                        </div>


                    </div>
                    <div class="account_content_footer">
                        <button class="normal footer_button">Update</button>
                        <button class="normal footer_button">Cancel</button>

                    </div>
                </div>

                <!-- Securtiry -->
                <div class="security" id="settings_security">
                    <h3>Change Password</h3>
                    <div class="settings_security_manage">
                        <div>
                            <label for="person_password ">Password current</label>
                            <input type="password" name="person_password " id="person_password">
                        </div>
                        <div class="password">
                            <label for="person_newPassword">New Password</label>
                            <input type="password" name="person_newPassword" id="person_newPassword">
                            <span id="icon_show_up_0" class="icon_show"><i class="bi bi-eye"></i></span>

                        </div>

                        <div class="password">
                            <label for="person_confirm">Confirm Password</label>
                            <input type="password" name="person_confirm" id="person_confirm">
                            <span id="icon_show_up_1" class="icon_show"><i class="bi bi-eye"></i></span>
                        </div>
                        <span id="msg_pwd_security"></span>
                        <div>
                            <label>
                                <input type="checkbox" id="twofa"> Enable 2FA (Two-Factor Authentication)
                            </label>
                            <div class="twofa-options" style="display:none;">
                                <p>Select verification method:</p>
                                <select>
                                    <option>Email verification</option>
                                    <option>Authenticator app (Google Authenticator)</option>
                                    <option>SMS verification</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <h3>Recent login activity</h3>

                    <div class="login-activity">
                        <ul>
                            <li>Chrome - Windows 10 - 2 hours ago</li>
                            <li>Edge - Android - Yesterday</li>
                        </ul>
                    </div>
                    <div class="account_content_footer">
                        <button class="normal footer_button" id="update_security">Update</button>
                        <button class="normal footer_button">Cancel</button>

                    </div>

                </div>

                <!-- end Security -->


                <!--Address Start -->
                <div id="settings_address" class="address">
                    <h3>Address</h3>
                    <div class="address_info">
                        <div>
                            <label for="address1">Address Line 1</label>
                            <input type="text" id="address1">
                            <label for="district">District</label>
                            <input type="text" id="district">
                        </div>

                        <div>
                            <label for="city">City / Province</label>
                            <input type="text" id="city">
                            <label for="country">Country</label>
                            <select name="" id="">
                                <option value="0">Việt nam</option>
                                <option value="1">Trung quốc</option>
                                <option value="2">Đài loan</option>
                                <option value="3">Hàn</option>

                            </select>
                        </div>

                        <div>
                            <label for="postal">Postal Code</label>
                            <input type="text" id="postal">
                        </div>
                        <div>

                        </div>
                    </div>
                    <h3> Location current</h3>
                    <div class="address_main">
                        <div>
                            <h4><i class="bi bi-geo-alt-fill"></i> </h4>
                            <select name="" id="">
                                <option value="0">798A Đ. Nguyễn Thị Minh Khai, Tân Đông Hiệp, Dĩ An, Bình Dương, VN.
                                </option>
                                <option value="1">798A Đ. Nguyễn Thị Minh Khai, Tân Đông Hiệp, Dĩ An, Bình Dương, VN.
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="account_content_footer">
                        <button class="normal footer_button">Update</button>
                        <button class="normal footer_button">Cancel</button>

                    </div>
                </div>
                <!-- Address End -->
            </div>

        </div>

    </section>



   	<%@ include file="/footer.jsp" %>

         <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>

    <script>
        showHiddenPassword("person_newPassword", "icon_show_up_0");
        showHiddenPassword("person_confirm", "icon_show_up_1");
        </script>
        
    <script src="${pageContext.request.contextPath}/assert/javascript/swarpTabInSettings.js"></script>
                <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
    
</body>

</html>