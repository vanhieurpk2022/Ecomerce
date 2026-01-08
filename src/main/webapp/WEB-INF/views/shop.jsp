<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
	<fmt:setBundle basename="i18n.messages" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="app.title" /></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    	          
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
	          
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">

</head>

<body>
		<c:set var="ctx" value="${pageContext.request.contextPath }"/>

    <jsp:include page="../includes/header.jsp"></jsp:include>


    <section id="page-header">
        <h2><fmt:message key="shop.header.title" /></h2>
        <p><fmt:message key="shop.header.desc" /></p>
    </section>

   <section id="filter" class="section-p1">
  <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">

    <!-- Filter button -->
    <a class="btn btn-outline-secondary"
            data-bs-toggle="offcanvas"
            data-bs-target="#offcanvasExample">
      <i class="bi bi-funnel"></i> <fmt:message key="shop.filter.btn" />
    </a>

    <!-- Search -->
    <form class="d-flex" >
      <input type="hidden" name="action" value="">
      <input class="form-control me-2"
             type="search"
             name="keyword"
             placeholder="<fmt:message key='shop.search.placeholder' />">
      <button class="btn btn-success"><fmt:message key="shop.search.btn" /></button>
    </form>

  </div>
  
		  <div class="offcanvas offcanvas-start" tabindex="-1"
		     id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
		
		  <div class="offcanvas-header">
		    <h5 class="offcanvas-title" id="offcanvasExampleLabel">
		      <i class="bi bi-funnel"></i> <fmt:message key="shop.filter.title" />
		    </h5>
		    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
		  </div>
		
		  <form action="${ctx}/shop" method="GET">
		    <input type="hidden" name="action" value="FilterProducts">
		
		    <div class="offcanvas-body">
		
		      <!-- CATEGORY -->
		      <div class="mb-3">
		        <label class="form-label fw-semibold"><fmt:message key="shop.filter.category" /></label>
		        <select name="categoryID" class="form-select">
		          <option value=""><fmt:message key="shop.filter.allCategories" /></option>
		          <c:forEach items="${cate}" var="c">
		            <option value="${c.categoryID}">${c.categoryName}</option>
		          </c:forEach>
		        </select>
		      </div>
		
		      <!-- PRICE RANGE -->
		      <div class="mb-3">
		        <label class="form-label fw-semibold"><fmt:message key="shop.filter.priceRange" /></label>
		        <div class="row g-2">
		          <div class="col-6">
						<!-- Price Input -->
					<input type="number" name="minPrice" value="${minPrice}" class="form-control" placeholder="<fmt:message key='shop.filter.min' />">
		          </div>
		          <div class="col-6">
		            <input type="number" name="maxPrice"
		                   class="form-control"
		                   placeholder="<fmt:message key='shop.filter.max' />">
		          </div>
		        </div>
		      </div>
		
		      <!-- SIZE -->
		      <div class="mb-3">
		        <label class="form-label fw-semibold"><fmt:message key="shop.filter.size" /></label>
		        <div class="d-flex gap-2 flex-wrap">
		        <div class="form-check">
				    <input class="form-check-input" type="checkbox" name="size" value="S" id="sizeS"
				           ${selectedSizes.contains('S') ? 'checked' : ''}>
				    <label class="form-check-label" for="sizeS">S</label>
				</div>
		          <div class="form-check">
		            <input class="form-check-input" type="checkbox" name="size" value="M" id="sizeM">
		            <label class="form-check-label" for="sizeM">M</label>
		          </div>
		          <div class="form-check">
		            <input class="form-check-input" type="checkbox" name="size" value="L" id="sizeL">
		            <label class="form-check-label" for="sizeL">L</label>
		          </div>
		          <div class="form-check">
		            <input class="form-check-input" type="checkbox" name="size" value="XL" id="sizeXL">
		            <label class="form-check-label" for="sizeXL">XL</label>
		          </div>
		        </div>
		      </div>
		
		      <!-- SORT -->
		      <div class="mb-3">
		        <label class="form-label fw-semibold"><fmt:message key="shop.filter.sortBy" /></label>
		        <select name="sort" class="form-select">
		          <option value=""><fmt:message key="shop.filter.sort.default" /></option>
		          <option value="price_asc"><fmt:message key="shop.filter.sort.priceAsc" /></option>
		          <option value="price_desc"><fmt:message key="shop.filter.sort.priceDesc" /></option>
		          <option value="newest"><fmt:message key="shop.filter.sort.newest" /></option>
		          <option value="sold_desc"><fmt:message key="shop.filter.sort.bestSelling" /></option>
		        </select>
		      </div>
		
		      <hr>
		
		      <!-- ACTION BUTTONS -->
		      <div class="d-flex gap-2">
		        <button type="submit" class="btn btn-primary w-100">
		          <fmt:message key="shop.filter.apply" />
		        </button>
		        <a href="${ctx}/shop" class="btn btn-outline-secondary w-100">
		          <fmt:message key="shop.filter.reset" />
		        </a>
		      </div>
		
		    </div>
		  </form>
		</div>
</section>

    <section id="product1" class="section-p1">

		
		
        <div class="pro-container">
        <c:forEach var="p" items="${ListProducts}">

            <div class="pro" >
                <img src="${ctx}${p.img}" alt="">
                <div class="des">
                    <span><fmt:message key="shop.product.brand" /></span>
                    <h5>${p.productName }</h5>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                  
                    <h4><fmt:formatNumber value="${p.price }" pattern="#,##0 VNĐ"/></h4>
                </div>
                <a href="${pageContext.request.contextPath}/shop?action=SProduct&productID=${p.productID}&type=${p.categoryID}" ><i class="bi bi-cart cart"></i></a>
            </div>
        </c:forEach>
        </div>
    </section>

    <section id="pagination" class="section-p1">
            <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
      <a href="${pageContext.request.contextPath}/shop?action=showCard&page=0">0</a>
        <a href="${pageContext.request.contextPath}/shop?action=showCard&page=1">1</a>
        <a href="${pageContext.request.contextPath}/shop?action=showCard&page=2">2</a>
        
      <a href="${pageContext.request.contextPath}/shop?action=showCard&page=${currentPage + 1}">
    <i class="fa-solid fa-arrow-right"></i>
</a>

    </section>

    <section id="newsletter" class="section-p1 section-m1">
        <div class="newstext">
            <h4><fmt:message key="newsletter.title" /></h4>
            <p><fmt:message key="newsletter.desc" /> <span><fmt:message key="newsletter.specialOffers" /></span></p>
        </div>
        <div class="form">
            <input type="text" placeholder="<fmt:message key='newsletter.emailPlaceholder' />">
            <button class="normal"><fmt:message key="newsletter.signup" /></button>
        </div>
    </section>


    <%@ include file="../includes/footer.jsp" %>

   
       <script src="${ctx}/assert/javascript/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
