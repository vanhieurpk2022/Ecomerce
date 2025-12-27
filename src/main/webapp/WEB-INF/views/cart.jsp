<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech2etc Ecommerce Tutorial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
</head>

<body>


		<c:set var = "ctx" value="${pageContext.request.contextPath}"/>

   <jsp:include page="../includes/header.jsp"></jsp:include>

    <section id="page-header" class="about-header">
        <h2>#let's_talk</h2>
        <p>LEAVE A MESSENGE. We love to hear from you!</p>
    </section>
			<div class="container mt-2">
        <p class="text-center">If you have orders you can see <a href="${ctx }/cart/order_guest"> here</a> </p>
    </div>
    <section id="cart" class="section-p1">
    <div class="table-warraper">
        <table >
            <thead>
                <tr>
                    <td>Image</td>
                    <td>Product</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Subtotal</td> 
                    <td>Remove</td>
                </tr>

            </thead>
            <tbody>
            <c:if test="${sessionScope.Cart.items !=null}">  
            <c:forEach var ="items" items="${sessionScope.Cart.items}">
                <tr>
				     <fmt:setLocale value="vi_VN"/>
                    <td><img src="${ctx }${items.products.img }" alt=""></td>
                    <td>${items.products.productName } - <strong>${items.variant.size}</strong> </td>
                    <td><fmt:formatNumber value="${items.products.price }" pattern="#,##0 VNĐ"/></td>
                    <td><input class="text-center" type="number" value="${items.quanity}" onchange="changeQuanity(${items.variant.variantID},this)"></td>
                    <td><fmt:formatNumber value="${items.subtotal}" pattern="#,##0 VNĐ"/> </td>
                    <td>   <button class="normal" data-variantid="${items.variant.variantID}" onclick="removeItem(this)" ><i class="bi bi-x-circle" style="font-size:25px;"></i></button></td>
                       
                </tr>	
                  </c:forEach>
                  </c:if>
            </tbody>
        </table>
        </div>
    </section>

    <section id="cart-add" class="section-p1">
  
    	  <div id="subtotal">
    	    <div class="d-flex flex-row">
    	 <p> <span class="fs-4">Total:</span>  <strong id="TotalPrice"> <fmt:formatNumber value="${sessionScope.Cart.price}" pattern="#,##0 VNĐ"/> </strong> </p>
    </div>
     <a href="${ctx }/cart/checkout" class="btn btn-success ">Proceed to checkout</a>
     </div>
    </section>

   	<%@ include file="../includes/footer.jsp" %>
	<script>     window.ctx = "${pageContext.request.contextPath}";
	</script>

         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${ctx}/assert/javascript/script.js"></script>
        <script src="${ctx}/assert/javascript/ajaxJquerry.js"></script>
    
</body>

</html>
