<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmed &mdash; Fashion Store</title>
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
.order-success-stage {
  max-width: 680px;
  margin: 48px auto 80px;
  padding: 0 24px;
  min-height: 70vh;
}
.order-success-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 48px 40px;
  box-shadow: var(--shadow-card);
  text-align: center;
}
.success-check-icon {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  background-color: var(--color-apple-green);
  color: #ffffff;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  font-size: 32px;
  font-weight: 700;
  margin-bottom: 20px;
  box-shadow: 0 8px 24px rgba(52, 199, 89, 0.3);
}
.success-heading {
  font-size: 36px;
  font-weight: 600;
  letter-spacing: -0.025em;
  color: var(--color-ink);
  margin-bottom: 12px;
}
.success-subhead {
  font-size: 15px;
  color: var(--color-slate);
  margin-bottom: 36px;
  line-height: 1.5;
}
.receipt-table-card {
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-media-inner);
  padding: 24px;
  text-align: left;
  margin-bottom: 32px;
}
.receipt-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
  border-bottom: 1px solid var(--color-control-gray);
  font-size: 14px;
}
.receipt-row:last-child {
  border-bottom: none;
}
.receipt-row .label {
  color: var(--color-slate);
}
.receipt-row .val {
  color: var(--color-ink);
  font-weight: 600;
}
.status-pill-badge {
  display: inline-flex;
  align-items: center;
  padding: 3px 12px;
  border-radius: var(--radius-pills);
  background-color: rgba(0, 113, 227, 0.1);
  color: var(--color-pricing-blue);
  font-size: 12px;
  font-weight: 600;
}
.success-actions-row {
  display: flex;
  gap: 16px;
  justify-content: center;
}
@media (max-width: 500px) {
  .success-actions-row {
    flex-direction: column;
  }
}
.btn-success-primary {
  display: inline-block;
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  padding: 14px 28px;
  border-radius: var(--radius-pills);
  font-size: 15px;
  font-weight: 500;
  box-shadow: 0 4px 14px rgba(0, 113, 227, 0.28);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.btn-success-primary:hover {
  background-color: var(--color-apple-blue);
  transform: translateY(-2px);
  box-shadow: 0 8px 22px rgba(0, 113, 227, 0.38);
}
.btn-success-secondary {
  display: inline-block;
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  color: var(--color-ink) !important;
  padding: 14px 28px;
  border-radius: var(--radius-pills);
  font-size: 15px;
  font-weight: 500;
  transition: background-color 0.2s ease, border-color 0.2s ease;
}
.btn-success-secondary:hover {
  background-color: var(--color-paper-frost);
  border-color: var(--color-steel);
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
        <a href="${pageContext.request.contextPath}/products">Browse collections &rsaquo;</a>
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
                    Bag
                </a>
            </div>
        </nav>
    </header>

    <!-- ================= ORDER SUCCESS CONTAINER ================= -->
    <main class="order-success-stage">
        <div class="order-success-card">
            <div class="success-check-icon">
                &#10003;
            </div>

            <h1 class="success-heading">Order Confirmed</h1>
            <p class="success-subhead">
                Thank you for your order. We have registered your request and our logistics center is preparing your items for express dispatch.
            </p>

            <!-- Inner Receipt Card -->
            <div class="receipt-table-card">
                <div class="receipt-row">
                    <span class="label">Order Reference</span>
                    <span class="val">#${order.orderId}</span>
                </div>
                <div class="receipt-row">
                    <span class="label">Fulfillment Status</span>
                    <span class="val">
                        <span class="status-pill-badge">${order.orderStatus}</span>
                    </span>
                </div>
                <div class="receipt-row">
                    <span class="label">Settlement Mode</span>
                    <span class="val">${order.paymentMethod}</span>
                </div>
                <div class="receipt-row">
                    <span class="label">Total Amount Settled</span>
                    <span class="val" style="font-size:16px;">&#8377;${order.totalAmount}</span>
                </div>
                <div class="receipt-row">
                    <span class="label">Dispatch Carrier</span>
                    <span class="val">Complimentary Express Courier</span>
                </div>
            </div>

            <!-- Actions -->
            <div class="success-actions-row">
                <a href="${pageContext.request.contextPath}/order-details?orderId=${order.orderId}" class="btn-success-primary">
                    View Order Details &rsaquo;
                </a>
                <a href="${pageContext.request.contextPath}/products" class="btn-success-secondary">
                    Continue Shopping
                </a>
            </div>
        </div>
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
