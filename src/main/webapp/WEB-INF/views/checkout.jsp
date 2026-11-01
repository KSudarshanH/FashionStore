<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout &mdash; Fashion Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/checkout.css?v=<%= System.currentTimeMillis() %>">
    <style>
/* Inlined Apple Design System for Instant Rendering */
:root {
  --color-gallery-white: #ffffff;
  --color-studio-mist: #f5f5f7;
  --color-paper-frost: #fafafc;
  --color-hairline-silver: #d6d6d6;
  --color-control-gray: #e6e6e8;
  --color-ink: #1d1d1f;
  --color-slate: #707070;
  --color-steel: #86868b;
  --color-apple-blue: #0066cc;
  --color-pricing-blue: #0071e3;
  --color-launch-orange: #b64400;
  --color-apple-green: #34c759;
  --color-apple-red: #ff3b30;
  --font-apple: 'Inter', -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text', 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  --radius-cards: 28px;
  --radius-media-inner: 20px;
  --radius-pills: 9999px;
  --radius-inputs: 12px;
  --shadow-card: 0 4px 20px rgba(0, 0, 0, 0.04);
  --shadow-hover: 0 12px 36px rgba(0, 0, 0, 0.08);
}
*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: var(--font-apple);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
html, body {
  background-color: var(--color-gallery-white);
  color: var(--color-ink);
  font-size: 16px;
  line-height: 1.47;
  letter-spacing: -0.015em;
  overflow-x: hidden;
}
a {
  color: inherit;
  text-decoration: none;
  transition: all 0.2s ease;
}
.apple-ribbon {
  background-color: var(--color-studio-mist);
  color: var(--color-slate);
  font-size: 12px;
  padding: 12px 20px;
  text-align: center;
  border-bottom: 1px solid var(--color-control-gray);
}
.apple-ribbon strong {
  color: var(--color-ink);
  font-weight: 600;
}
.apple-ribbon a {
  color: var(--color-apple-blue);
  margin-left: 6px;
  font-weight: 500;
}
.apple-ribbon a:hover {
  text-decoration: underline;
}
.apple-nav-wrapper {
  position: sticky;
  top: 0;
  z-index: 1000;
  background-color: rgba(255, 255, 255, 0.88);
  backdrop-filter: saturate(180%) blur(20px);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
  border-bottom: 1px solid rgba(0, 0, 0, 0.08);
}
.apple-nav-container {
  max-width: 1200px;
  margin: 0 auto;
  height: 48px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 24px;
}
.apple-logo-lockup {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: -0.02em;
}
.apple-logo-badge {
  color: var(--color-ink);
  font-size: 16px;
}
.apple-nav-links {
  display: flex;
  align-items: center;
  gap: 24px;
}
.apple-nav-links a {
  font-size: 13px;
  color: var(--color-slate);
  font-weight: 400;
  transition: color 0.15s ease;
}
.apple-nav-links a:hover,
.apple-nav-links a.active {
  color: var(--color-ink);
}
.apple-nav-actions {
  display: flex;
  align-items: center;
  gap: 16px;
  font-size: 13px;
}
.apple-link-blue {
  color: var(--color-apple-blue);
  font-weight: 500;
}
.checkout-stage-container {
  max-width: 1120px;
  margin: 0 auto;
  padding: 48px 24px 80px;
  min-height: 75vh;
}
.checkout-header-area {
  margin-bottom: 36px;
}
.checkout-kicker {
  color: var(--color-launch-orange);
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  margin-bottom: 8px;
}
.checkout-headline {
  font-size: 40px;
  font-weight: 600;
  letter-spacing: -0.03em;
  color: var(--color-ink);
  line-height: 1.15;
}
.checkout-subhead {
  color: var(--color-slate);
  font-size: 15px;
  margin-top: 8px;
}
.checkout-grid-layout {
  display: grid;
  grid-template-columns: 1fr 400px;
  gap: 36px;
  align-items: start;
}
@media (max-width: 900px) {
  .checkout-grid-layout {
    grid-template-columns: 1fr;
  }
}
.checkout-card {
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-cards);
  padding: 32px;
  margin-bottom: 24px;
  box-shadow: var(--shadow-card);
}
.checkout-card-header {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 24px;
}
.step-number {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  background-color: var(--color-ink);
  color: #fff;
  font-size: 13px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
}
.step-title {
  font-size: 18px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.015em;
}
.form-grid-2col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  margin-bottom: 16px;
}
@media (max-width: 600px) {
  .form-grid-2col {
    grid-template-columns: 1fr;
  }
}
.form-field-group {
  margin-bottom: 18px;
  display: flex;
  flex-direction: column;
  gap: 6px;
}
.form-field-group label {
  font-size: 13px;
  font-weight: 500;
  color: var(--color-ink);
}
.apple-text-input {
  width: 100%;
  padding: 13px 16px;
  font-size: 14px;
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-inputs);
  background-color: #ffffff;
  color: var(--color-ink);
  outline: none;
  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}
.apple-text-input:focus {
  border-color: var(--color-pricing-blue);
  box-shadow: 0 0 0 3px rgba(0, 113, 227, 0.15);
}
.apple-text-input:read-only {
  background-color: var(--color-studio-mist);
  color: var(--color-slate);
  cursor: not-allowed;
}
textarea.apple-text-input {
  min-height: 90px;
  resize: vertical;
  line-height: 1.5;
}
.payment-options-grid {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.payment-option-card {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 16px 20px;
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-media-inner);
  background-color: #ffffff;
  cursor: pointer;
  transition: all 0.2s ease;
}
.payment-option-card:hover {
  border-color: var(--color-steel);
  background-color: var(--color-paper-frost);
}
.payment-option-card input[type="radio"] {
  accent-color: var(--color-pricing-blue);
  width: 18px;
  height: 18px;
  cursor: pointer;
}
.payment-option-title {
  font-size: 15px;
  font-weight: 500;
  color: var(--color-ink);
}
.payment-option-desc {
  font-size: 12px;
  color: var(--color-slate);
  margin-top: 2px;
}
.checkout-summary-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 32px 28px;
  box-shadow: var(--shadow-card);
  position: sticky;
  top: 72px;
}
.checkout-summary-title {
  font-size: 20px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.02em;
  margin-bottom: 20px;
}
.checkout-items-scroll {
  max-height: 280px;
  overflow-y: auto;
  margin-bottom: 24px;
  padding-right: 4px;
  display: flex;
  flex-direction: column;
  gap: 14px;
}
.checkout-item-entry {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 13px;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-control-gray);
}
.checkout-item-title {
  font-weight: 600;
  color: var(--color-ink);
}
.checkout-item-sub {
  font-size: 12px;
  color: var(--color-slate);
  margin-top: 2px;
}
.checkout-item-price {
  font-weight: 600;
  color: var(--color-ink);
  white-space: nowrap;
}
.summary-line-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
  color: var(--color-slate);
  margin-bottom: 12px;
}
.summary-line-item .val {
  color: var(--color-ink);
  font-weight: 500;
}
.badge-free-shipping {
  color: var(--color-apple-green);
  font-weight: 600;
}
.checkout-summary-divider {
  height: 1px;
  background-color: var(--color-hairline-silver);
  margin: 18px 0;
}
.checkout-total-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  font-size: 16px;
  font-weight: 600;
  color: var(--color-ink);
  margin-bottom: 24px;
}
.checkout-total-row .total-val {
  font-size: 26px;
  font-weight: 700;
  letter-spacing: -0.02em;
}
.btn-place-order {
  display: block;
  width: 100%;
  text-align: center;
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  font-size: 16px;
  font-weight: 500;
  padding: 16px 24px;
  border-radius: var(--radius-pills);
  border: none;
  cursor: pointer;
  letter-spacing: -0.01em;
  box-shadow: 0 4px 14px rgba(0, 113, 227, 0.28);
  transition: transform 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
}
.btn-place-order:hover {
  background-color: var(--color-apple-blue);
  transform: translateY(-2px);
  box-shadow: 0 8px 22px rgba(0, 113, 227, 0.38);
}
.btn-place-order:active {
  transform: translateY(0);
}
.edit-bag-link {
  display: block;
  text-align: center;
  margin-top: 14px;
  font-size: 13px;
  color: var(--color-slate);
}
.edit-bag-link:hover {
  color: var(--color-ink);
  text-decoration: underline;
}
.apple-footer {
  background-color: var(--color-studio-mist);
  border-top: 1px solid var(--color-hairline-silver);
  padding: 56px 24px 32px;
  margin-top: 80px;
  font-size: 12px;
  color: var(--color-slate);
}
.apple-footer-container {
  max-width: 1120px;
  margin: 0 auto;
}
.apple-footer-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 36px;
  padding-bottom: 40px;
  border-bottom: 1px solid var(--color-control-gray);
}
@media (max-width: 768px) {
  .apple-footer-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
.apple-footer-col h4 {
  font-size: 12px;
  font-weight: 600;
  color: var(--color-ink);
  margin-bottom: 14px;
}
.apple-footer-col a {
  display: block;
  font-size: 12px;
  color: var(--color-slate);
  margin-bottom: 10px;
  transition: color 0.15s ease;
}
.apple-footer-col a:hover {
  color: var(--color-ink);
}
.apple-footer-bottom {
  padding-top: 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 12px;
}
    </style>
</head>
<body>

    <!-- ================= TOP ANNOUNCEMENT RIBBON ================= -->
    <div class="apple-ribbon">
        <strong>Complimentary Shipping.</strong> Free delivery on all orders over &#8377;2000.
        <a href="${pageContext.request.contextPath}/cart">&lsaquo; Return to bag</a>
    </div>

    <!-- ================= FROSTED GLASS NAVIGATION ================= -->
    <header class="apple-nav-wrapper">
        <nav class="apple-nav-container">
            <a href="${pageContext.request.contextPath}/home" class="apple-logo-lockup">
                <span class="apple-logo-badge">&#10022;</span>
                <span>fashion store</span>
            </a>

            <div class="apple-nav-links">
                <a href="${pageContext.request.contextPath}/home">Overview</a>
                <a href="${pageContext.request.contextPath}/products">Shop</a>
                <a href="${pageContext.request.contextPath}/products?category=1">Men</a>
                <a href="${pageContext.request.contextPath}/products?category=2">Women</a>
                <a href="${pageContext.request.contextPath}/products?category=3">Kids</a>
                <a href="${pageContext.request.contextPath}/products?category=4">Footwear</a>
                <a href="${pageContext.request.contextPath}/products?category=5">Accessories</a>
            </div>

            <div class="apple-nav-actions">
                <a href="${pageContext.request.contextPath}/profile">Account</a>
                <a href="${pageContext.request.contextPath}/orders">Orders</a>
                <a href="${pageContext.request.contextPath}/cart" class="apple-link-blue">
                    Bag [${cartItems.size()}]
                </a>
            </div>
        </nav>
    </header>

    <!-- ================= CHECKOUT MAIN STAGE ================= -->
    <main class="checkout-stage-container">
        <!-- Header -->
        <div class="checkout-header-area">
            <p class="checkout-kicker">Checkout &amp; Fulfillment</p>
            <h1 class="checkout-headline">Review &amp; Place Order</h1>
            <p class="checkout-subhead">
                Please enter your delivery destination and select your preferred payment settlement method.
            </p>
        </div>

        <c:if test="${not empty param.error}">
            <div style="background-color:#fff2f2; border:1px solid var(--color-apple-red); color:var(--color-apple-red); border-radius:var(--radius-inputs); padding:14px 20px; margin-bottom:24px; font-size:14px;">
                Unable to complete order execution (${param.error}). Please check your bag details or try again.
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/place-order" method="post">
            <div class="checkout-grid-layout">
                <!-- ================= LEFT: DESTINATION & PAYMENT ================= -->
                <div>
                    <!-- Step 1: Destination -->
                    <div class="checkout-card">
                        <div class="checkout-card-header">
                            <span class="step-number">1</span>
                            <h2 class="step-title">Delivery Destination</h2>
                        </div>

                        <div class="form-grid-2col">
                            <div class="form-field-group">
                                <label for="fullName">Full Name</label>
                                <input type="text" id="fullName" name="name" value="${user.name}" class="apple-text-input" placeholder="e.g. John Appleseed" required>
                            </div>
                            <div class="form-field-group">
                                <label for="phoneNum">Phone Number</label>
                                <input type="tel" id="phoneNum" name="phone" value="${user.phone}" class="apple-text-input" placeholder="e.g. 9876543210" required>
                            </div>
                        </div>

                        <div class="form-field-group">
                            <label for="emailAddr">Account Email</label>
                            <input type="email" id="emailAddr" name="email" value="${user.email}" class="apple-text-input" readonly>
                        </div>

                        <div class="form-field-group">
                            <label for="delAddress">Street Address &amp; Postal Code</label>
                            <textarea id="delAddress" name="address" class="apple-text-input" rows="3" placeholder="Enter flat/house no., building, street, area, city, and PIN code" required></textarea>
                        </div>
                    </div>

                    <!-- Step 2: Payment Method -->
                    <div class="checkout-card">
                        <div class="checkout-card-header">
                            <span class="step-number">2</span>
                            <h2 class="step-title">Settlement Method</h2>
                        </div>

                        <div class="payment-options-grid">
                            <label class="payment-option-card">
                                <input type="radio" name="paymentMethod" value="COD" checked>
                                <div>
                                    <div class="payment-option-title">Cash on Delivery (COD)</div>
                                    <div class="payment-option-desc">Pay seamlessly at your doorstep via cash or mobile scan upon delivery.</div>
                                </div>
                            </label>

                            <label class="payment-option-card">
                                <input type="radio" name="paymentMethod" value="UPI">
                                <div>
                                    <div class="payment-option-title">UPI Instant Transfer (GPay / PhonePe / Paytm)</div>
                                    <div class="payment-option-desc">Fast, frictionless payment directly from your bank account via UPI QR.</div>
                                </div>
                            </label>

                            <label class="payment-option-card">
                                <input type="radio" name="paymentMethod" value="CARD">
                                <div>
                                    <div class="payment-option-title">Debit / Credit Card</div>
                                    <div class="payment-option-desc">Encrypted checkout supporting Visa, Mastercard, RuPay, and American Express.</div>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- ================= RIGHT: ORDER MANIFEST SUMMARY ================= -->
                <aside class="checkout-summary-card">
                    <h2 class="checkout-summary-title">Manifest Summary (${cartItems.size()})</h2>

                    <div class="checkout-items-scroll">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="checkout-item-entry">
                                <div>
                                    <div class="checkout-item-title">${item.productName}</div>
                                    <div class="checkout-item-sub">Size: <strong>${item.size}</strong> &bull; Qty: ${item.quantity}</div>
                                </div>
                                <div class="checkout-item-price">
                                    &#8377;${item.price * item.quantity}
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="summary-line-item">
                        <span>Merchandise Subtotal</span>
                        <span class="val">&#8377;${cartTotal}</span>
                    </div>

                    <div class="summary-line-item">
                        <span>Courier Freight</span>
                        <c:choose>
                            <c:when test="${cartTotal >= 2000}">
                                <span class="val badge-free-shipping">FREE</span>
                            </c:when>
                            <c:otherwise>
                                <span class="val">&#8377;150</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="summary-line-item">
                        <span>Duties &amp; GST</span>
                        <span class="val">Included</span>
                    </div>

                    <div class="checkout-summary-divider"></div>

                    <div class="checkout-total-row">
                        <span>Total Due</span>
                        <span class="total-val">&#8377;${cartTotal >= 2000 ? cartTotal : cartTotal + 150}</span>
                    </div>

                    <button type="submit" class="btn-place-order">
                        Place Order &rsaquo;
                    </button>

                    <a href="${pageContext.request.contextPath}/cart" class="edit-bag-link">
                        &lsaquo; Edit Items in Bag
                    </a>
                </aside>
            </div>
        </form>
    </main>

    <!-- ================= APPLE STUDIO MIST FOOTER ================= -->
    <footer class="apple-footer">
        <div class="apple-footer-container">
            <div class="apple-footer-grid">
                <div class="apple-footer-col">
                    <h4>Explore</h4>
                    <a href="${pageContext.request.contextPath}/products">All Collections</a>
                    <a href="${pageContext.request.contextPath}/products?category=1">Men's Wardrobe</a>
                    <a href="${pageContext.request.contextPath}/products?category=2">Women's Wardrobe</a>
                    <a href="${pageContext.request.contextPath}/products?category=3">Kids' Collection</a>
                    <a href="${pageContext.request.contextPath}/products?category=4">Footwear</a>
                    <a href="${pageContext.request.contextPath}/products?category=5">Accessories</a>
                </div>

                <div class="apple-footer-col">
                    <h4>Account &amp; Orders</h4>
                    <c:choose>
                        <c:when test="${not empty sessionScope.userId}">
                            <a href="${pageContext.request.contextPath}/profile">Manage Account</a>
                            <a href="${pageContext.request.contextPath}/orders">Order History &amp; Tracking</a>
                            <a href="${pageContext.request.contextPath}/cart">Shopping Bag</a>
                            <a href="${pageContext.request.contextPath}/logout">Sign Out</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login">Sign In</a>
                            <a href="${pageContext.request.contextPath}/register">Create Account</a>
                            <a href="${pageContext.request.contextPath}/cart">Shopping Bag</a>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="apple-footer-col">
                    <h4>Services &amp; Care</h4>
                    <a href="#">Size &amp; Fit Guide</a>
                    <a href="#">Complimentary Shipping</a>
                    <a href="#">Returns &amp; Exchanges</a>
                    <a href="#">Order Inquiries</a>
                </div>

                <div class="apple-footer-col">
                    <h4>About Fashion Store</h4>
                    <a href="#">Our Philosophy</a>
                    <a href="#">Sustainable Sourcing</a>
                    <a href="#">Material Integrity</a>
                    <a href="#">Press &amp; Inquiries</a>
                </div>
            </div>

            <div class="apple-footer-bottom">
                <span>Copyright &copy; 2026 Fashion Store Inc. All rights reserved.</span>
                <span style="color:var(--color-slate);">Gallery White #ffffff &bull; Studio Mist #f5f5f7 &bull; Pricing Blue #0071e3</span>
            </div>
        </div>
    </footer>
</body>
</html>
