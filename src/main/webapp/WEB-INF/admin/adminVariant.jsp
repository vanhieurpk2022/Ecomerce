<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style_admin.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" />
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon_ad/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon_ad/site.webmanifest">
    <title>Admin Products-Variant</title>

</head>

<body>
      <!-- Sidebar -->
           <fmt:setLocale value="vi_VN"/>
      
      	<jsp:include page="/WEB-INF/includes/_SidebarAdmin.jsp"></jsp:include>
	 <c:set var="ctx" value="${pageContext.request.contextPath}"/>


     <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>Variant Products</h1>
            </div>
            <div class="header-right">
                <div class="user-profile">
                    <div class="user-avatar">AD</div>
                    <span>Admin</span>
                </div>
            </div>
        </div>

        <div class="container-fluid p-4">
            <!-- Nút quay lại và hành động -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <a href="${ctx }/admin/products"  class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left"></i> Quay lại
                </a>
              
            </div>

            <div class="row">
                <!-- Cột bên trái: Danh sách sản phẩm -->
                <div class="col-lg-8">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0">Products</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class=" text-center align-middle">
                                    <thead class="table-light">
                                    
                                        <tr>
                                            <th>Products Name</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                             <th>sold</th>
                                            <th >Status</th>
                                            <th>Tools</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Dòng sản phẩm 1 -->
                                        <c:forEach items="${pvList}" var="pv" >
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="${ctx }${pv.products.img}" class="product-img me-3" height="80" width="80" alt="product">
                                                     <div>
                                                        <h6 class="mb-0">${pv.products.productName } - ${pv.size }</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td> <fmt:formatNumber value="${pv.finalPrice }" pattern="#,##0 VNĐ"/></td>
                                            <td>${pv.stock }</td>
                                            <td class=" fw-bold">${pv.sold }</td>
                                            <td class=" fw-bold">${pv.status }</td>
                                            <td>      <div>
                     					 			<a href="${ctx }/admin/lockVariant?id=${pv.variantID}" class="btn btn-warning">Lock</a>
                     					 			<a href="${ctx }/admin/unLockVariant?id=${pv.variantID}" class="btn btn-success">Unlock</a>
                                                        <button onclick="loadVariantData('${ctx}', this);" data-bs-toggle="modal" data-productID="${pp.productID}" data-bs-target="#variantModalModify" data-variantID="${pv.variantID}" class="btn btn-danger">Modify</button>
                      				
                      						 </div></td>
                      		                  </tr>
                                        </c:forEach>
                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
    
                </div>
									<!-- Modal Modify-->
										<div class="modal fade" id="variantModalModify" tabindex="-1"
									     aria-labelledby="variantModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-lg">
									    <div class="modal-content">
									
									      <!-- HEADER -->
									      <div class="modal-header">
									        <h5 class="modal-title" id="variantModalLabel">
									          Modify Products
									        </h5>
									        <button type="button" class="btn-close"
									                data-bs-dismiss="modal"></button>
									      </div>
									
									      <!-- FORM -->
									      <form action="${ctx}/admin/modifyVariant" method="post">
									
									        <div class="modal-body">
									
									          <!-- Product ID (hidden) -->
         							 <input type="hidden" id="modal_productID" name="productID" value="">
									 <input type="hidden" id="modal_variantID" name="variantID" value="">
									
									          <div class="row g-3">
									
									            <!-- Size -->
									            <div class="col-md-4">
									              <label class="form-label">Size</label>
									              <select id="modal_Size" name="size" class="form-select" required>
									                <option value="">-- Select size --</option>
									                <option value="S">S</option>
									                <option value="M">M</option>
									                <option value="L">L</option>
									                <option value="XL">XL</option>
									              </select>
									            </div>
									
									            <!-- Stock -->
									            <div class="col-md-4">
									              <label class="form-label">Stock</label>
									              <input id="modal_stock" type="number" name="stock"
									                     class="form-control"
									                     min="0" required>
									            </div>
									
									            <!-- Price Adjustment -->
									            <div class="col-md-6">
									              <label class="form-label">Price Adjustment (VNĐ)</label>
									              <input id="modal_price" type="number" name="priceAdjustment"
									                     class="form-control"
									                     step="1000" value="0">
									            </div>
									
									            <!-- Status -->
									            <div class="col-md-6">
									              <label class="form-label">Status</label>
									              <select id="modal_status" name="status" class="form-select">
									                <option value="ACTIVE">ACTIVE</option>
									                <option value="INACTIVE">INACTIVE</option>
									              </select>
									            </div>
									
									          </div>
									        </div>
									
									        <!-- FOOTER -->
									        <div class="modal-footer">
									          <button type="button"
									                  class="btn btn-secondary"
									                  data-bs-dismiss="modal">
									            Close
									          </button>
									          <button type="submit" class="btn btn-primary">
									           Save
									          </button>
									        </div>
									
									      </form>
									
									    </div>
									  </div>
									</div>
									<!-- End Modal -->
                <!-- Cột bên phải: Thông tin khách hàng & Tổng tiền -->
                <div class="col-lg-4">
                    <!-- Trạng thái đơn hàng -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-body text-center">
                            <h6 class="text-muted mb-3">Current Status</h6>
                       
                            <span class="badge bg-info text-dark fs-6 py-2 px-4 mb-3">${pp.status}</span>
                           	<div> 
								<h6>Tools</h6>
								<div>
									<button class="btn btn-primary mt-2"  data-bs-toggle="modal" data-bs-target="#variantModal"><i class="bi bi-plus"></i> Add</button>
									<!-- Modal -->
										<div class="modal fade" id="variantModal" tabindex="-1"
									     aria-labelledby="variantModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-lg">
									    <div class="modal-content">
									
									      <!-- HEADER -->
									      <div class="modal-header">
									        <h5 class="modal-title" id="variantModalLabel">
									          Add Products Variant
									        </h5>
									        <button type="button" class="btn-close"
									                data-bs-dismiss="modal"></button>
									      </div>
									
									      <!-- FORM -->
									      <form action="${ctx }/admin/addvariant" method="post">
									
									        <div class="modal-body">
									
									          <!-- Product ID (hidden) -->
         							 <input type="hidden" name="productID" value="${pp.productID}">
									
									          <div class="row g-3">
									
									            <!-- Size -->
									            <div class="col-md-4">
									              <label class="form-label">Size</label>
									              <select name="size" class="form-select" required>
									                <option value="">-- Select size --</option>
									                <option value="S">S</option>
									                <option value="M">M</option>
									                <option value="L">L</option>
									                <option value="XL">XL</option>
									              </select>
									            </div>
									
									            <!-- Stock -->
									            <div class="col-md-4">
									              <label class="form-label">Stock</label>
									              <input type="number" name="stock"
									                     class="form-control"
									                     min="0" required>
									            </div>
									
									            <!-- Price Adjustment -->
									            <div class="col-md-6">
									              <label class="form-label">Price Adjustment (VNĐ)</label>
									              <input type="number" name="priceAdjustment"
									                     class="form-control"
									                     step="1000" value="0">
									            </div>
									
									            <!-- Status -->
									            <div class="col-md-6">
									              <label class="form-label">Status</label>
									              <select name="status" class="form-select">
									                <option value="ACTIVE">ACTIVE</option>
									                <option value="INACTIVE">INACTIVE</option>
									              </select>
									            </div>
									
									          </div>
									        </div>
									
									        <!-- FOOTER -->
									        <div class="modal-footer">
									          <button type="button"
									                  class="btn btn-secondary"
									                  data-bs-dismiss="modal">
									            Close
									          </button>
									          <button type="submit" class="btn btn-primary">
									           Save
									          </button>
									        </div>
									
									      </form>
									
									    </div>
									  </div>
									</div>
									<!-- End Modal -->
								</div>
						</div>
                        </div>
                    </div>

                   
             
            </div>
        </div>
         </div>
    </div>
                   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
	            <script src="${ctx}/assert/javascript/adminAjax.js"></script>
	
	<script>

	document.querySelectorAll(".order-row").forEach(row => {
	    row.addEventListener("click", function () {
	        window.location.href = this.dataset.href;
	    });
	});
	
	document.querySelectorAll(".order-status").forEach(select => {
	    select.addEventListener("click", function (e) {
	        e.stopPropagation(); // 🚫 không cho click lan lên <tr>
	    });
	});
	</script>
</body>

</html>