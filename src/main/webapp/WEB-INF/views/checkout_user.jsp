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
            <div class="d-flex justify-content-between align-items-center flex-wrap">
                <h1 class="mb-0"><i class="fas fa-shopping-cart me-2"></i>Checkout</h1>

            </div>
        </div>
    </div>

    <div class="checkout-container mb-5">
        <div class="row">
            <div class="col-lg-8">
                <!-- Shipping Address Selection -->
                <div class="section-card">
                    <div class="section-title">
                        <i class="fas fa-map-marker-alt"></i>
                        Shipping Address
                    </div>

                    <!-- Address 1 (Default) -->
                    <div class="address-card selected">
                        <input type="radio" name="address" value="1" checked>
                        <div class="mb-2">
                            <span class="address-default-badge">Default</span>
                        </div>
                        <h6 class="mb-2">John Doe</h6>
                        <p class="mb-1 text-muted">
                            <i class="fas fa-phone me-2"></i>0123 456 789
                        </p>
                        <p class="mb-0 text-muted">
                            <i class="fas fa-map-marker-alt me-2"></i>
                            123 Nguyen Hue, Ben Nghe Ward, District 1, Ho Chi Minh City
                        </p>
                    </div>

                    <!-- Address 2 -->
                    <div class="address-card">
                        <input type="radio" name="address" value="2">
                        <h6 class="mb-2">John Doe</h6>
                        <p class="mb-1 text-muted">
                            <i class="fas fa-phone me-2"></i>0987 654 321
                        </p>
                        <p class="mb-0 text-muted">
                            <i class="fas fa-map-marker-alt me-2"></i>
                            456 Le Loi, Ben Thanh Ward, District 1, Ho Chi Minh City
                        </p>
                    </div>

                    <!-- Add New Address -->
                    <button class="btn-add-address">
                        <i class="fas fa-plus me-2"></i>Add New Address
                    </button>
                </div>

                <!-- Order Notes -->
                <div class="section-card">
                    <div class="section-title">
                        <i class="fas fa-sticky-note"></i>
                        Order Notes
                    </div>
                    <textarea class="form-control" rows="3"
                        placeholder="Notes about your order, e.g. special delivery instructions"></textarea>
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
                    <div class="payment-method">
                        <label class="d-flex align-items-center mb-0">
                            <input type="radio" name="payment" value="card">
                            <div>
                                <strong>Credit/Debit Card</strong>
                                <div class="text-muted small">Visa, Mastercard, JCB</div>
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

                        <!-- Voucher -->
                        <div class="mb-3">
                            <label class="form-label small fw-bold">Discount Code</label>
                            <div class="voucher-input">
                                <input type="text" class="form-control" placeholder="Enter code">
                                <button class="btn btn-primary">Apply</button>
                            </div>
                        </div>

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

                        <div class="text-center mt-3">
                            <small class="text-muted">
                                <i class="fas fa-shield-alt me-1"></i>
                                Your payment information is secure
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
       	<%@ include file="../includes/footer.jsp" %>
    <script>
        // Address selection
        document.querySelectorAll('.address-card').forEach(card => {
            card.addEventListener('click', function () {
                document.querySelectorAll('.address-card').forEach(c => c.classList.remove('selected'));
                this.classList.add('selected');
                this.querySelector('input[type="radio"]').checked = true;
            });
        });

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