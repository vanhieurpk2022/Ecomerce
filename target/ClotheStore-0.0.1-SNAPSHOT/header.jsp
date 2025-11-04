<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <section id=header>
        <a href="#"> <img src="${ pageContext.request.contextPath}/assert/img/logo.png" class="logo" alt=""></a>

        <div>
            <ul id="navbar">
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="blog.jsp">Blog</a></li>
                <li><a href="about.jsp" >About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li id="lg-bag"><a href="cart.jsp"><i class="bi bi-cart"></i></a>
                    <span id="cart_count">0</span>
                </li> <!-- login succsess -->
                <li><a href="signup.jsp" class="signup">Sign Up</a></li>
                <!-- <li class="user-menu">
                    <div class="avatar">
                        <img src="" alt="">
                        <span>tên tài khoản</span>
                    </div> -->
                <!-- Dropdown menu -->
                <!-- <ul class="dropdown">
                    <li><a href="#"> <i class="bi bi-gear"></i> Settings & Privacy</a></li>
                    <li><a href="#"> <i class="bi bi-question-circle"></i> Help & Support </a></li>
                    <li><a href="#"> <i class="bi bi-box-arrow-right"></i> Logout</a></li>
                </ul>
                </li> -->

                <a href="#" id="close"> <i class="bi bi-x-lg"></i></a>
            </ul>

        </div>
        <div id="mobile">
            <a href="cart.jsp"><i class="bi bi-bag"></i></a>
            <i id="bar" class="fas fa-outdent"></i>

        </div>
    </section>
    <script>
  // Lấy URL hiện tại
  // http://localhost:8080/ClotheStore/shop.jsp
  
  const currentPage = window.location.pathname; // /ClotheStore/shop.jsp
  const navLinks = document.querySelectorAll("#navbar a");

  navLinks.forEach(link => {
	  const href = link.getAttribute("href");
	  
    if(href === "signup.jsp"){
        return;
}
    
    if (currentPage.includes(href)) {
      link.classList.add("active");
    } else { // với các trang khác thì xóa active
      link.classList.remove("active");
    }
  });
</script>