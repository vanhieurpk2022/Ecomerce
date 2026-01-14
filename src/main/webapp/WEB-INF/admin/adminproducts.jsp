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
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
         integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
         crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon_ad/apple-touch-icon.png">
      <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon_ad/favicon-16x16.png">
      <link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon_ad/site.webmanifest">
      <title>Admin Products</title>
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
               <h1>Products</h1>
            </div>
            <div class="header-right">
               <div class="user-profile">
                  <div class="user-avatar">AD</div>
                  <span>Admin</span>
               </div>
            </div>
         </div>
         <!-- Main Grid -->
         <div class="main-grid">
            <!-- Recent Orders -->
            <div class="card">
               <div class="card-header">
                  <h3>List Products</h3>
                  <div class="search-box">
                     <input type="text" placeholder="Tìm kiếm...">
                  </div>
               </div>
               <div class="table_wrapper">
                  <table class=" text-center align-middle">
                     <!-- Thêm class table-hover của bootstrap -->
                     <thead class="table-light">
                        <tr>
                           <th> Products ID</th>
                           <th>Products name</th>
                           <th>Category name</th>
                           <th>Base price</th>
                           <th>Quantity variant</th>
                           <th>Status</th>
                           <th class="text-center">Feature</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var ="p" items="${productsList}">
                           <tr class="order-row" data-href="${ctx}/admin/variant?id=${p.productID}" style="cursor: pointer;">
                              <td class="fw-bold">#${p.productID }</td>
                              <td>
                                 <div class="d-flex flex-column">
                                    <span >${p.productName }</span>
                                 </div>
                              </td>
                              <td >${p.cate.categoryName }</td>
                              <td>
                                 <span class="badge border text-dark fw-normal">
                                    <fmt:formatNumber value="${p.price }" pattern="#,##0 VNĐ"/>
                                 </span>
                              </td>
                              <td>${p.quantityVariantCurr }</td>
                              <td>
                                 <c:choose >
                                    <c:when test="${p.status == 'ACTIVE'}"> <span class="badge text-bg-success">${p.status }</span></c:when>
                                    <c:when test="${p.status == 'LOCK'}"> <span class="badge text-bg-warning">${p.status }</span></c:when>
                                 </c:choose>
                              </td>
                              <td>
                                 <div>
                                    <a href="${ctx }/admin/lock?id=${p.productID}" class="btn btn-warning">Lock</a>
                                    <a href="${ctx }/admin/unLock?id=${p.productID}" class="btn btn-success">Unlock</a>
                                  <button data-productid="${p.productID}" data-bs-toggle="modal" onclick="event.stopPropagation();loadProducts('${ctx}',this);" data-bs-target="#productModalModify" class="btn btn-danger">  Modify</button>
                                    
                                 </div>
                              </td>
                           </tr>
                        </c:forEach>
                        <!-- Thêm các dòng khác tương tự -->
                     </tbody>
                  </table>
               </div>
            </div>
            <!-- Modal Modify -->
                  <div class="modal fade" id="productModalModify" tabindex="-1"
                     aria-labelledby="productModalLabel" aria-hidden="true">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <!-- HEADER -->
                           <div class="modal-header">
                              <h5 class="modal-title" id="productModalLabel">
                                Modify Products
                              </h5>
                              <button type="button" class="btn-close"
                                 data-bs-dismiss="modal"></button>
                           </div>
                           <!-- FORM -->
                           <form action="${ctx}/admin/modifyProducts" method="post" enctype="multipart/form-data">
                              <div class="modal-body">
                                 <div class="row g-3">
                                    <!-- Product Name -->
                                    <div class="col-md-6">
                                       <label class="form-label">Product Name</label>
                                       <input type="text" id="modal_productName" name="productName"
                                          class="form-control" required>
                                    </div>
                                  <input type="hidden" id="productsID" name="pid" value="">
                                    <!-- Category -->
                                    <div class="col-md-6">
                                       <label class="form-label">Category</label>
                                       <select id="modal_categoryProducts" name="categoryID" class="form-select" required>
                                          <option value="">-- Select category --</option>
                                          <c:forEach items="${categoryList}" var="c">
                                             <option value="${c.categoryID}">
                                                ${c.categoryName}
                                             </option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                    <!-- Base Price -->
                                    <div class="col-md-6">
                                       <label class="form-label">Base Price (VNĐ)</label>
                                       <input id="modal_basePrice" type="number" name="price"
                                          class="form-control"
                                          min="0" step="1000" required>
                                    </div>
                                    <!-- Product Status -->
                                    <div class="col-md-6">
                                       <label class="form-label">Status</label>
                                       <select id="modal_status" name="status" class="form-select">
                                          <option value="ACTIVE">ACTIVE</option>
                                          <option value="INACTIVE">INACTIVE</option>
                                       </select>
                                    </div>
                                    <!-- Description -->
                                    <div class="col-md-12">
                                       <label class="form-label">Description</label>
                                       <textarea id="modal_textarea" name="description"
                                          class="form-control"
                                          rows="3"></textarea>
                                    </div>
                                    <!-- Preview -->
                                    <div class="d-flex justify-content-center">
                                    <img  class="border"  id="preview" src="" alt="Preview" width="80" height="80" style="max-width:200px; display:none;">
                                    
                                    </div>
                                    <!-- Image -->
                                    <div class="col-md-12">
                                       <label class="form-label">Product Image</label>
                                       <input  type="file" name="image"
                                          class="form-control" accept="image/*" onchange="previewImage(event)">
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
                                 Save Product
                                 </button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <!-- End Modal -->
            
            
            <section>
               <h6>Tool</h6>
               <div>
                  <button class="btn btn-primary mt-2"  data-bs-toggle="modal" data-bs-target="#productModal"><i class="bi bi-plus"></i> Add</button>
                  <!-- Modal -->
                  <div class="modal fade" id="productModal" tabindex="-1"
                     aria-labelledby="productModalLabel" aria-hidden="true">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <!-- HEADER -->
                           <div class="modal-header">
                              <h5 class="modal-title" id="productModalLabel">
                                 Add New Product
                              </h5>
                              <button type="button" class="btn-close"
                                 data-bs-dismiss="modal"></button>
                           </div>
                           <!-- FORM -->
                           <form action="${ctx}/admin/addproducts" method="post" enctype="multipart/form-data">
                              <div class="modal-body">
                                 <div class="row g-3">
                                    <!-- Product Name -->
                                    <div class="col-md-6">
                                       <label class="form-label">Product Name</label>
                                       <input type="text" name="productName"
                                          class="form-control" required>
                                    </div>
                                    <!-- Category -->
                                    <div class="col-md-6">
                                       <label class="form-label">Category</label>
                                       <select name="categoryID" class="form-select" required>
                                          <option value="">-- Select category --</option>
                                          <c:forEach items="${categoryList}" var="c">
                                             <option value="${c.categoryID}">
                                                ${c.categoryName}
                                             </option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                    <!-- Base Price -->
                                    <div class="col-md-6">
                                       <label class="form-label">Base Price (VNĐ)</label>
                                       <input type="number" name="price"
                                          class="form-control"
                                          min="0" step="1000" required>
                                    </div>
                                    <!-- Product Status -->
                                    <div class="col-md-6">
                                       <label class="form-label">Status</label>
                                       <select name="status" class="form-select">
                                          <option value="ACTIVE">ACTIVE</option>
                                          <option value="INACTIVE">INACTIVE</option>
                                       </select>
                                    </div>
                                    <!-- Description -->
                                    <div class="col-md-12">
                                       <label class="form-label">Description</label>
                                       <textarea name="description"
                                          class="form-control"
                                          rows="3"></textarea>
                                    </div>
                                    <!-- Preview -->
                                    <div class="d-flex justify-content-center">
                                    <img class="border"  id="preview" src="" alt="Preview" width="80" height="80" style="max-width:200px; display:none;">
                                    
                                    </div>
                                    <!-- Image -->
                                    <div class="col-md-12">
                                       <label class="form-label">Product Image</label>
                                       <input type="file" name="image"
                                          class="form-control" accept="image/*" onchange="previewImage(event)">
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
                                 Save Product
                                 </button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <!-- End Modal -->
               </div>
            </section>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
                               <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="${ctx}/assert/javascript/adminAjax.js"></script>
            
      <script>
         document.querySelectorAll(".order-row").forEach(row => {
             row.addEventListener("click", function () {
                 window.location.href = this.dataset.href;
             });
         });
         function previewImage(event) {
        	    const file = event.target.files[0];
        	    if (!file) return;

        	    const img = document.getElementById("preview");
        	    img.src = URL.createObjectURL(file);
        	    img.style.display = "block";
        	}
         	
      </script>
   </body>
</html>