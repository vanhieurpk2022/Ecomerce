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
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
   </head>
   <body>
      <jsp:include page="../includes/header.jsp"></jsp:include>
      <c:set var="ctx" value="${pageContext.request.contextPath}" />
      
      <div class="container-fluid">
        <!-- Main Content -->
        <div class="container">
            <h1 class="page-title"><i class="fas fa-cog"></i> Settings</h1>
            <div class="settings-wrapper">
                <!-- Sidebar -->
                <jsp:include page="../includes/_SidebarSetting.jsp"></jsp:include>
                
                <!-- Content Area -->
                <div class="content-area">
                    <!-- Orders Section -->
                    <section class="section" id="orders">
                        <h3 class="section-title"><i class="fas fa-user-circle"></i> Order History</h3>
                        
                        <!-- Search Form -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <input type="text" class="form-control" placeholder="Orders ID" />
                            </div>
                            <div class="col-md-4">
                                <input type="date" class="form-control" />
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-success btn-sm">Find</button>
                            </div>
                        </div>
                        
                        <!-- Order Card -->
                        <div class="shadow p-3 border rounded-3 mb-3">
                            <!-- Order Header -->
                          
                            <hr>
                            
                            <!-- Product Items -->
                            <div class="d-flex align-items-center mb-3">
                                <div class="flex-shrink-0">
                                    <img src="https://via.placeholder.com/80" alt="Product" width="80" height="80" class="rounded">
                                </div>
                                <div class="flex-grow-1 px-3 position-relative">
                                    <p class="mb-1 fw-semibold">Tên Sản Phẩm</p>
                                    <div class="small text-muted">Quantity: 4</div>
                                    <div class="d-md-none mt-1">
                                        <span class="fw-bold">100.000 VNĐ</span>
                                    </div>
                                    <div class="d-none d-md-block position-absolute end-0 top-0 p-2">
                                        <span class="fw-bold">100.000 VNĐ</span>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <hr>
                            
                            <!-- Order Total -->
                            <div class="d-flex flex-column flex-md-row justify-content-end align-items-start align-items-md-center">
                               <button class="btn btn-info  text-light mt-2 mt-md-0 me-2">
                                   Buy
                                </button>
                                <button class="btn btn-warning text-light mt-2 mt-md-0 ">
                                    <i class="bi bi-star"></i> Review
                                </button>
                            </div>
                        </div>
                            <!-- End Order Card -->
                        <!-- Additional Order Cards (Repeat as needed) -->
                          <!-- Order Card -->
                        <div class="shadow p-3 border rounded-3 mb-3">
                            <!-- Order Header -->
                            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-2">
                                <div>
                                    <span class="fw-bold">Order #20251118</span>
                                    <span class="small text-muted d-block d-md-inline ms-md-2">
                                        <i class="bi bi-calendar"></i> 2025-11-24
                                    </span>
                                </div>
                                <div class="text-success p-2 bg-success-subtle fw-bold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-archive"></i> Delivered
                                </div>
                                 <div class="text-success p-2 bg-success-subtle fw-bold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-archive"></i> Delivered
                                </div>
                                <!-- Alternative Status Badges (Uncomment as needed) -->
                                <!-- Awaiting Status -->
                              <!-- <div class="text-secondary p-2 bg-body-secondary fw-bold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-clock"></i> Awaiting
                                </div> -->
                                
                                <!-- Shipping Status -->
                                <!-- <div class="p-2 bg-warning-subtle fw-bold rounded-2 mt-2 mt-md-0">
                                    <i class="bi bi-truck text-warning"></i>
                                    <span class="text-warning">Shipping</span>
                                </div> -->
                            </div>
                            
                            <hr>
                            
                            <!-- Product Items -->
                            <div class="d-flex align-items-center mb-3">
                                <div class="flex-shrink-0">
                                    <img src="https://via.placeholder.com/80" alt="Product" width="80" height="80" class="rounded">
                                </div>
                                <div class="flex-grow-1 px-3 position-relative">
                                    <p class="mb-1 fw-semibold">Tên Sản Phẩm</p>
                                    <div class="small text-muted">Quantity: 4</div>
                                    <div class="d-md-none mt-1">
                                        <span class="fw-bold">100.000 VNĐ</span>
                                    </div>
                                    <div class="d-none d-md-block position-absolute end-0 top-0 p-2">
                                        <span class="fw-bold">100.000 VNĐ</span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3">
                                <div class="flex-shrink-0">
                                    <img src="https://via.placeholder.com/80" alt="Product" width="80" height="80" class="rounded">
                                </div>
                                <div class="flex-grow-1 px-3 position-relative">
                                    <p class="mb-1 fw-semibold">Tên Sản Phẩm</p>
                                    <div class="small text-muted">Quantity: 4</div>
                                    <div class="d-md-none mt-1">
                                        <span class="fw-bold">100.000 VNĐ</span>
                                    </div>
                                    <div class="d-none d-md-block position-absolute end-0 top-0 p-2">
                                        <span class="fw-bold">100.000 VNĐ</span>
                                    </div>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <!-- Order Total -->
                            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
                                <div>
                                    <span class="fw-bold fs-6">Total:</span> 
                                    <span class="fs-4 text-primary fw-bold">100.000 VNĐ</span>
                                </div>
                                <button class="btn btn-warning text-light mt-2 mt-md-0 ">
                                    <i class="bi bi-star"></i> Review
                                </button>
                            </div>
                        </div>
                            <!-- End Order Card -->
                            
                    </section>
                </div>
            </div>
        </div>
      </div>
      
      <%@ include file="../includes/footer.jsp" %>
      
      <!-- Bootstrap 5.3.3 JS Bundle -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      
      <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>
      <script src="${pageContext.request.contextPath}/assert/javascript/checkPassword.js"></script>
   </body>
</html>