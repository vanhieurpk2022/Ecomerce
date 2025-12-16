<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


		<c:set var = "ctx" value="${pageContext.request.contextPath}"/>

   <jsp:include page="../includes/header.jsp"></jsp:include>

    <section id="page-header" class="about-header">
        <h2>#let's_talk</h2>
        <p>LEAVE A MESSENGE. We love to hear from you!</p>
    </section>

    <section id="cart" class="section-p1">
        <table width="100%">
            <thead>
                <tr>
                    <td>Remove</td>
                    <td>Image</td>
                    <td>Product</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Subtotal</td>
                </tr>

            </thead>
            <tbody>
            <c:if test="${sessionScope.Cart.items !=null}">  
            <c:forEach var ="items" items="${sessionScope.Cart.items}">
                <tr>
				
                    <td> <a href="${ctx}/cart?action=RemoveProducts&id=${items.variant.variantID}"><i class="bi bi-x-circle"></i></a></td>
                    <td><img src="${ctx }${items.products.img }" alt=""></td>
                    <td>${items.products.productName } - <strong>${items.variant.size}</strong>  - <strong>${items.variant.color}</strong> </td>
                    <td>${items.products.price }</td>
                    <td><input type="number" value="${items.quanity}" onchange="changeQuanity(${items.variant.variantID},this)"></td>
                    <td>${items.subtotal}</td>
                </tr>
                  </c:forEach>
                  </c:if>
            </tbody>
        </table>
    </section>

    <section id="cart-add" class="section-p1">
        <div id="coupon">
            <h3>Apply Coupon</h3>
            <div>
                <input type="text" placeholder="Enter Your Coupon">
                <button class="normal">Apply</button>
            </div>
        </div>

        <div id="subtotal">
            <h3>Cart Totals</h3>
            <table>
                <tr>
                    <td>Cart Subtotal</td>
                    <td>#335</td>
                </tr>
                <tr>
                    <td>Payment Options</td>
                    <td>
                        <select name="" id="paymentMethod">
                            <option value="0">Cash On Delivery (COD)</option>
                            <option value="2">Bank transfer </option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Shipping</td>
                    <td>Free</td>
                </tr>
                <tr>
                    <td><strong>Total</strong></td>
                    <td><strong>${sessionScope.Cart.price}</strong></td>
                </tr>
            </table>
            <button class="normal">Proceed to checkout</button>
        </div>
    </section>

   	<%@ include file="../includes/footer.jsp" %>


    <script src="${ctx}/assert/javascript/script.js"></script>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                      <script src="${ctx}/assert/javascript/ajaxJquerry.js"></script>
</body>

</html>
