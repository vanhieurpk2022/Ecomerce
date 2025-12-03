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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>
		<c:set var="ctx" value="${pageContext.request.contextPath }"/>
		<!--  thêm header -->
     <jsp:include page="/header.jsp"></jsp:include>



    <section id="prodetails" class="section-p1">
        <div class="single-pro-image">
            <img src="${ctx }${sproduct.img}" width="100%" id="MainImg" alt="">

            <div class="small-img-group">
                <div class="small-img-col">
                    <img src="${ctx }${sproduct.img}" width="100%" class="small-img" alt="">
                </div>
                <div class="small-img-col">
                    <img src="${ctx }${sproduct.img}" width="100%" class="small-img" alt="">
                </div>
                <div class="small-img-col">
                    <img src="${ctx }${sproduct.img}" width="100%" class="small-img" alt="">
                </div>
                <div class="small-img-col">
                    <img src="${ctx }${sproduct.img}" width="100%" class="small-img" alt="">
                </div>
            </div>

        </div>
        <div class="sing-pro-details">
            <h6>Home / T-Shirt</h6>
            <h4>${sproduct.productName }</h4>
            <h2>${sproduct.price }</h2>
            <select>
                <option>Select Size</option>
                <option>XL</option>
                <option>XXL</option>
                <option>Small</option>
                <option>Large</option>
            </select>
            <input style="margin-top:15px;" id="quanity" type="number" value="1">
            <button class="normal" id="btn_AddToCart" onclick="sendDataCart(${sproduct.productID},document.getElementById('quanity').value);">Add To Cart</button>
    
            
            <h4> <p style="opacity=50%;">Remain:  ${sproduct.stock } </p><br>
            products Details</h4>
            <span>${sproduct.description}</span>
        </div>
    </section>
    

    <section id="product1" class="section-p1">
        <h2>Featured Products</h2>
        <p>Summer Collection New Morden Design</p>
        <div class="pro-container">
        <c:forEach var="rq" items="${TypeClothe }">
        	
            <div class="pro">
                <img src="${ctx }${rq.img}" alt="">
                <div class="des">
                    <span>adidas</span>
                    <h5>${rq.productName }</h5>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h4>${rq.price }</h4>
                </div>
                <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${rq.productID}&type=${rq.categoryID}"><i class="bi bi-cart cart"></i></a>
            </div>
           </c:forEach>
          
            

        </div>
    </section>

    <section id="newsletter" class="section-p1 section-m1">
        <div class="newstext">
            <h4>Sign Up For Newsletters</h4>
            <p>Get E-mail updates about our latest shop and <span>special offers.</span></p>
        </div>
        <div class="form">
            <input type="text" placeholder=" Your email address">
            <button class="normal">Sign Up</button>
        </div>
    </section>


    <%@ include file="/footer.jsp" %>

    <script>
        var MainImg = document.getElementById("MainImg");
        var smallimg = document.getElementsByClassName("small-img");

        smallimg[0].onclick = function () {
            MainImg.src = smallimg[0].src;
        }

        smallimg[1].onclick = function () {
            MainImg.src = smallimg[1].src;
        }
        smallimg[2].onclick = function () {
            MainImg.src = smallimg[2].src;
        }
        smallimg[3].onclick = function () {
            MainImg.src = smallimg[3].src;
        }


    </script>

           <script src="${ctx}/assert/javascript/script.js"></script>
               <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                      <script src="${ctx}/assert/javascript/ajaxJquerry.js"></script>
           

</body>

</html>