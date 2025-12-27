<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">

</head>
<body>
   <jsp:include page="../includes/header.jsp"></jsp:include>

     <div class="checkout-header">
        <div class="checkout-container">
            <h1 class="mb-0"><i class="fas fa-shopping-cart me-2"></i>Checkout</h1>
        </div>
    </div>

    <div class="checkout-container mb-5">
        <div class="row">
            <div class="col-lg-8">
                <!-- Login Prompt -->
                <div class="login-prompt">
                    <i class="fas fa-info-circle me-2"></i>
                    <strong>Already have an account?</strong>
                    <a href="checkout-login.html">Sign in now</a> for faster checkout!
                </div>

                <!-- Customer Information -->
                <div class="section-card">
                    <div class="section-title">
                        <i class="fas fa-user"></i>
                        Customer Information
                    </div>
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">First Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" placeholder="Enter first name" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Last Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" placeholder="Enter last name" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Email <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" placeholder="email@example.com" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" placeholder="0123456789" required>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Shipping Address -->
                <div class="section-card">
                    <div class="section-title">
                        <i class="fas fa-map-marker-alt"></i>
                        Shipping Address
                    </div>
                    <form>
                        <div class="mb-3">
                            <label class="form-label">Street Address <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" placeholder="House number, street name" required>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">City <span class="text-danger">*</span></label>
                                <select class="form-select" required>
                                    <option value="">Select city</option>
                                    <option>Hanoi</option>
                                    <option>Ho Chi Minh City</option>
                                    <option>Da Nang</option>
                                    <option>Can Tho</option>
                                </select>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label class="form-label">Ward <span class="text-danger">*</span></label>
                                <select class="form-select" required>
                                    <option value="">Select ward</option>
                                    <option>Ward 1</option>
                                    <option>Ward 2</option>
                                    <option>Ward 3</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Order Notes (Optional)</label>
                            <textarea class="form-control" rows="3"
                                placeholder="Notes about your order, e.g. special delivery instructions"></textarea>
                        </div>
                    </form>
                </div>

                  <!-- Payment Method -->
                <div class="section-card">
                    <div class="section-title">
                        <i class="fas fa-credit-card"></i>
                        Payment Method
                    </div>
                    <div class="payment-method active">
                        <label class="d-flex align-items-center mb-0">
                            <input type="radio" name="payment" value="cod" checked>
                            <div>
                                <strong>Cash on Delivery (COD)</strong>
                                <div class="text-muted small">Pay with cash when you receive your order</div>
                            </div>
                        </label>
                    </div>
                    <div class="payment-method">
                        <label class="d-flex align-items-center mb-0">
                            <input type="radio" name="payment" value="bank">
                            <div>
                                <strong>Bank Transfer</strong>
                                <div class="text-muted small">Direct transfer to our bank account</div>
                            </div>
                        </label>
                    </div>
                    <div class="payment-method">
                        <label class="d-flex align-items-center mb-0">
                            <input type="radio" name="payment" value="momo">
                            <div>
                                <strong>MoMo Wallet</strong>
                                <div class="text-muted small">Pay via MoMo e-wallet</div>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="section-card">
                    <div class="section-title">
                        <i class="fas fa-receipt"></i>
                        Your Order
                    </div>

                    <div class="order-summary">
                        <!-- Product Items -->
                        <div class="product-item">
                            <img src="https://via.placeholder.com/80" alt="Product" class="product-img">
                            <div class="product-info">
                                <div class="product-name">Premium Men's T-Shirt</div>
                                <div class="product-variant">Size: L | Color: Black</div>
                                <div class="d-flex justify-content-between align-items-center mt-2">
                                    <span class="text-muted">Qty: 2</span>
                                    <span class="product-price">$40.00</span>
                                </div>
                            </div>
                        </div>

                        <div class="product-item">
                            <img src="https://via.placeholder.com/80" alt="Product" class="product-img">
                            <div class="product-info">
                                <div class="product-name">Slim Fit Jeans</div>
                                <div class="product-variant">Size: 32 | Color: Blue</div>
                                <div class="d-flex justify-content-between align-items-center mt-2">
                                    <span class="text-muted">Qty: 1</span>
                                    <span class="product-price">$55.00</span>
                                </div>
                            </div>
                        </div>

                        <hr class="my-3">

                        <!-- Summary -->
                        <div class="summary-row">
                            <span>Subtotal</span>
                            <span>$95.00</span>
                        </div>
                        <div class="summary-row">
                            <span>Shipping</span>
                            <span>$3.00</span>
                        </div>
                        <div class="summary-row">
                            <span>Discount</span>
                            <span class="text-danger">-$5.00</span>
                        </div>
                        <div class="summary-row">
                            <span>Total</span>
                            <span>$93.00</span>
                        </div>

                        <button class="btn btn-checkout mt-3">
                            <i class="fas fa-lock me-2"></i>Place Order
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
       	<%@ include file="../includes/footer.jsp" %>
    	<script>
        // Payment method selection
        document.querySelectorAll('.payment-method').forEach(method => {
            method.addEventListener('click', function () {
                document.querySelectorAll('.payment-method').forEach(m => m.classList.remove('active'));
                this.classList.add('active');
                this.querySelector('input[type="radio"]').checked = true;
            });
        });
    </script>
    </body>
</html>