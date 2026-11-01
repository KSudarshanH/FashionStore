<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order #${order.orderId} Details &mdash; Fashion Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/order-details.css?v=<%= System.currentTimeMillis() %>">
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
  --radius-inputs: 980px;
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
.detail-stage-container {
  max-width: 1080px;
  margin: 0 auto;
  padding: 48px 24px 80px;
  min-height: 75vh;
}
.detail-breadcrumb {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  color: var(--color-slate);
  margin-bottom: 24px;
}
.detail-breadcrumb a:hover {
  color: var(--color-ink);
}
.detail-header-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 32px;
  margin-bottom: 32px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 20px;
}
.detail-title-group {
  display: flex;
  flex-direction: column;
  gap: 6px;
}
.detail-kicker {
  color: var(--color-launch-orange);
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
}
.detail-heading {
  font-size: 32px;
  font-weight: 600;
  letter-spacing: -0.025em;
  color: var(--color-ink);
}
.detail-date {
  font-size: 14px;
  color: var(--color-slate);
}
.status-pill {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 6px 18px;
  border-radius: var(--radius-pills);
  font-size: 13px;
  font-weight: 600;
  letter-spacing: 0.02em;
}
.status-pill.delivered {
  background-color: rgba(52, 199, 89, 0.12);
  color: var(--color-apple-green);
}
.status-pill.shipped {
  background-color: rgba(0, 113, 227, 0.12);
  color: var(--color-pricing-blue);
}
.status-pill.pending {
  background-color: rgba(182, 68, 0, 0.12);
  color: var(--color-launch-orange);
}
.detail-grid-layout {
  display: grid;
  grid-template-columns: 1fr 380px;
  gap: 36px;
  align-items: start;
}
@media (max-width: 900px) {
  .detail-grid-layout {
    grid-template-columns: 1fr;
  }
}
.items-card {
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-cards);
  padding: 32px;
  box-shadow: var(--shadow-card);
}
.items-card-title {
  font-size: 20px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.015em;
  margin-bottom: 24px;
}
.item-entry-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 18px 0;
  border-bottom: 1px solid var(--color-control-gray);
  gap: 16px;
}
.item-entry-row:last-child {
  border-bottom: none;
}
.item-thumb-box {
  width: 64px;
  height: 64px;
  border-radius: 16px;
  background-color: var(--color-studio-mist);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  color: var(--color-ink);
  flex-shrink: 0;
  overflow: hidden;
}
.item-meta {
  flex: 1;
}
.item-name {
  font-size: 15px;
  font-weight: 600;
  color: var(--color-ink);
}
.item-rate {
  font-size: 13px;
  color: var(--color-slate);
  margin-top: 2px;
}
.item-pricing {
  text-align: right;
}
.item-total-price {
  font-size: 16px;
  font-weight: 600;
  color: var(--color-ink);
}
.item-qty-badge {
  font-size: 12px;
  color: var(--color-slate);
  margin-top: 2px;
}
.summary-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 32px 28px;
  box-shadow: var(--shadow-card);
}
.summary-card-title {
  font-size: 20px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.02em;
  margin-bottom: 24px;
}
.summary-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
  color: var(--color-slate);
  margin-bottom: 14px;
}
.summary-row .val {
  color: var(--color-ink);
  font-weight: 500;
}
.summary-divider {
  height: 1px;
  background-color: var(--color-hairline-silver);
  margin: 20px 0;
}
.summary-total-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  margin-bottom: 24px;
}
.summary-total-row span:first-child {
  font-size: 16px;
  font-weight: 600;
  color: var(--color-ink);
}
.summary-total-row .total-amount {
  font-size: 26px;
  font-weight: 700;
  color: var(--color-ink);
  letter-spacing: -0.02em;
}
.help-box {
  padding-top: 18px;
  border-top: 1px solid var(--color-control-gray);
  font-size: 12px;
  color: var(--color-slate);
  line-height: 1.5;
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
        <a href="${pageContext.request.contextPath}/orders">&lsaquo; Return to all orders</a>
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
                <a href="${pageContext.request.contextPath}/orders" style="font-weight:600; color:var(--color-ink);">Orders</a>
                <a href="${pageContext.request.contextPath}/cart" class="apple-link-blue">
                    Bag
                </a>
            </div>
        </nav>
    </header>

    <!-- ================= ORDER DETAILS MAIN STAGE ================= -->
    <main class="detail-stage-container">
        <!-- Breadcrumb -->
        <div class="detail-breadcrumb">
            <a href="${pageContext.request.contextPath}/orders">Orders</a>
            <span>&rsaquo;</span>
            <span>Order #${order.orderId}</span>
        </div>

        <!-- Header Card -->
        <div class="detail-header-card">
            <div class="detail-title-group">
                <p class="detail-kicker">Order Manifest</p>
                <h1 class="detail-heading">Order #${order.orderId}</h1>
                <p class="detail-date">Placed on ${order.orderDate}</p>
            </div>

            <div>
                <c:choose>
                    <c:when test="${order.orderStatus == 'DELIVERED'}">
                        <span class="status-pill delivered">&#10003; Delivered</span>
                    </c:when>
                    <c:when test="${order.orderStatus == 'SHIPPED'}">
                        <span class="status-pill shipped">&bull; Shipped</span>
                    </c:when>
                    <c:otherwise>
                        <span class="status-pill pending">&bull; ${order.orderStatus}</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 2-Column Grid -->
        <div class="detail-grid-layout">
            <!-- Left: Allocated Items -->
            <div class="items-card">
                <h2 class="items-card-title">Allocated Merchandise (${not empty orderItems ? orderItems.size() : 0})</h2>

                <c:choose>
                    <c:when test="${not empty orderItems}">
                        <c:forEach var="item" items="${orderItems}">
                            <div class="item-entry-row">
                                <div class="item-thumb-box">
                                    <c:choose>
                                        <c:when test="${not empty item.image}">
                                            <img src="${pageContext.request.contextPath}/assets/${item.image}" alt="${item.productName}" style="width:100%; height:100%; object-fit:cover;">
                                        </c:when>
                                        <c:otherwise>
                                            &#10022;
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="item-meta">
                                    <div class="item-name">
                                        <c:choose>
                                            <c:when test="${not empty item.productName}">
                                                ${item.productName}
                                            </c:when>
                                            <c:otherwise>
                                                Garment Variant #${item.variantId}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="item-rate">
                                        <c:if test="${not empty item.color}">Color: ${item.color} &bull; </c:if>
                                        <c:if test="${not empty item.size}">Size: <strong>${item.size}</strong> &bull; </c:if>
                                        Unit Price: &#8377;${item.price}
                                    </div>
                                </div>
                                <div class="item-pricing">
                                    <div class="item-total-price">&#8377;${item.price * item.quantity}</div>
                                    <div class="item-qty-badge">Qty: ${item.quantity}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p style="color:var(--color-slate); font-size:14px;">No itemized entries found for this order.</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Right: Settlement Summary -->
            <aside class="summary-card">
                <h2 class="summary-card-title">Settlement Summary</h2>

                <div class="summary-row">
                    <span>Merchandise Value</span>
                    <span class="val">&#8377;${order.totalAmount}</span>
                </div>
                <div class="summary-row">
                    <span>Shipping Freight</span>
                    <span class="val" style="color:var(--color-apple-green); font-weight:600;">Complimentary</span>
                </div>
                <div class="summary-row">
                    <span>Payment Channel</span>
                    <span class="val">${order.paymentMethod}</span>
                </div>

                <div class="summary-divider"></div>

                <div class="summary-total-row">
                    <span>Total Settled</span>
                    <span class="total-amount">&#8377;${order.totalAmount}</span>
                </div>

                <div class="help-box">
                    <strong>Need assistance with this order?</strong><br>
                    Please quote Order Reference #${order.orderId} when contacting client services.
                </div>
            </aside>
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
