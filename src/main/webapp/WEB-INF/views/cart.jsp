<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Bag &mdash; Fashion Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css?v=<%= System.currentTimeMillis() %>">
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
img {
  display: block;
  max-width: 100%;
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
.apple-link-blue:hover {
  text-decoration: underline;
}
.apple-bag-pill {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 4px 12px;
  background-color: var(--color-ink);
  color: #fff !important;
  border-radius: var(--radius-pills);
  font-size: 12px;
  font-weight: 500;
}
.cart-stage-container {
  max-width: 1120px;
  margin: 0 auto;
  padding: 48px 24px 80px;
  min-height: 75vh;
}
.cart-header-area {
  margin-bottom: 36px;
}
.cart-kicker {
  color: var(--color-launch-orange);
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  margin-bottom: 8px;
}
.cart-headline {
  font-size: 40px;
  font-weight: 600;
  letter-spacing: -0.03em;
  color: var(--color-ink);
  line-height: 1.15;
}
.cart-subhead {
  color: var(--color-slate);
  font-size: 15px;
  margin-top: 8px;
  max-width: 600px;
}
.cart-grid-layout {
  display: grid;
  grid-template-columns: 1fr 380px;
  gap: 36px;
  align-items: start;
}
@media (max-width: 900px) {
  .cart-grid-layout {
    grid-template-columns: 1fr;
  }
}
.cart-items-column {
  display: flex;
  flex-direction: column;
  gap: 20px;
}
.cart-item-card {
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-cards);
  padding: 24px;
  box-shadow: var(--shadow-card);
  display: grid;
  grid-template-columns: 120px 1fr auto;
  gap: 24px;
  align-items: center;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.cart-item-card:hover {
  box-shadow: var(--shadow-hover);
}
@media (max-width: 640px) {
  .cart-item-card {
    grid-template-columns: 90px 1fr;
    gap: 16px;
  }
  .cart-item-actions {
    grid-column: 1 / -1;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid var(--color-control-gray);
    padding-top: 14px;
  }
}
.cart-item-thumb {
  width: 120px;
  height: 120px;
  border-radius: var(--radius-media-inner);
  background-color: var(--color-studio-mist);
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}
.cart-item-thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}
.cart-item-card:hover .cart-item-thumb img {
  transform: scale(1.05);
}
@media (max-width: 640px) {
  .cart-item-thumb {
    width: 90px;
    height: 90px;
  }
}
.cart-item-info {
  display: flex;
  flex-direction: column;
  gap: 6px;
}
.cart-item-title {
  font-size: 18px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.015em;
}
.cart-item-title:hover {
  color: var(--color-pricing-blue);
}
.cart-item-specs {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 13px;
  color: var(--color-slate);
}
.cart-spec-pill {
  display: inline-flex;
  align-items: center;
  padding: 2px 10px;
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-pills);
  font-size: 12px;
  font-weight: 500;
  color: var(--color-ink);
}
.cart-item-price {
  font-size: 17px;
  font-weight: 600;
  color: var(--color-ink);
  margin-top: 4px;
}
.cart-item-actions {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: 12px;
}
.cart-stepper-form {
  display: flex;
  align-items: center;
  gap: 8px;
}
.cart-stepper {
  display: inline-flex;
  align-items: center;
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-pills);
  background-color: var(--color-studio-mist);
  padding: 2px 6px;
}
.cart-stepper input[type="number"] {
  width: 36px;
  text-align: center;
  border: none;
  background: transparent;
  font-size: 14px;
  font-weight: 600;
  color: var(--color-ink);
  outline: none;
  -moz-appearance: textfield;
}
.cart-stepper input[type="number"]::-webkit-outer-spin-button,
.cart-stepper input[type="number"]::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
.cart-stepper-btn {
  background: transparent;
  border: none;
  cursor: pointer;
  width: 26px;
  height: 26px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 15px;
  font-weight: 600;
  color: var(--color-ink);
  transition: background-color 0.15s ease;
}
.cart-stepper-btn:hover {
  background-color: var(--color-control-gray);
}
.cart-update-btn {
  background-color: var(--color-ink);
  color: #fff;
  border: none;
  border-radius: var(--radius-pills);
  padding: 5px 12px;
  font-size: 12px;
  font-weight: 500;
  cursor: pointer;
  transition: opacity 0.15s ease;
}
.cart-update-btn:hover {
  opacity: 0.85;
}
.cart-remove-link {
  font-size: 13px;
  color: var(--color-slate);
  display: inline-flex;
  align-items: center;
  gap: 4px;
  transition: color 0.15s ease;
}
.cart-remove-link:hover {
  color: var(--color-apple-red);
}
.cart-continue-row {
  margin-top: 12px;
}
.cart-continue-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
  font-weight: 500;
  color: var(--color-pricing-blue);
}
.cart-continue-link:hover {
  text-decoration: underline;
}
.cart-summary-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 32px 28px;
  box-shadow: var(--shadow-card);
  position: sticky;
  top: 72px;
}
.summary-heading {
  font-size: 20px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.02em;
  margin-bottom: 24px;
}
.summary-breakdown {
  display: flex;
  flex-direction: column;
  gap: 14px;
  font-size: 14px;
}
.summary-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: var(--color-slate);
}
.summary-row .value {
  color: var(--color-ink);
  font-weight: 500;
}
.shipping-free-badge {
  color: var(--color-apple-green);
  font-weight: 600;
}
.summary-divider {
  height: 1px;
  background-color: var(--color-hairline-silver);
  margin: 18px 0;
}
.summary-total-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  font-size: 16px;
  font-weight: 600;
  color: var(--color-ink);
  margin-bottom: 24px;
}
.summary-total-row .total-amount {
  font-size: 26px;
  font-weight: 700;
  letter-spacing: -0.02em;
}
.btn-apple-checkout {
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
.btn-apple-checkout:hover {
  background-color: var(--color-apple-blue);
  transform: translateY(-2px);
  box-shadow: 0 8px 22px rgba(0, 113, 227, 0.38);
}
.btn-apple-checkout:active {
  transform: translateY(0);
}
.summary-trust-badges {
  margin-top: 24px;
  padding-top: 20px;
  border-top: 1px solid var(--color-control-gray);
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.trust-item {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 12px;
  color: var(--color-slate);
}
.trust-icon {
  color: var(--color-ink);
  font-size: 14px;
}
.cart-empty-container {
  max-width: 680px;
  margin: 40px auto;
  text-align: center;
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 64px 32px;
  box-shadow: var(--shadow-card);
}
.cart-empty-badge {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  display: inline-flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  color: var(--color-ink);
  margin-bottom: 20px;
}
.cart-empty-title {
  font-size: 32px;
  font-weight: 600;
  letter-spacing: -0.025em;
  color: var(--color-ink);
  margin-bottom: 12px;
}
.cart-empty-desc {
  font-size: 15px;
  color: var(--color-slate);
  margin-bottom: 32px;
  max-width: 440px;
  margin-left: auto;
  margin-right: auto;
}
.btn-empty-shop {
  display: inline-block;
  background-color: var(--color-pricing-blue);
  color: #fff !important;
  padding: 14px 32px;
  border-radius: var(--radius-pills);
  font-size: 15px;
  font-weight: 500;
  box-shadow: 0 4px 14px rgba(0, 113, 227, 0.28);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.btn-empty-shop:hover {
  background-color: var(--color-apple-blue);
  transform: translateY(-2px);
  box-shadow: 0 8px 22px rgba(0, 113, 227, 0.38);
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
        <a href="${pageContext.request.contextPath}/products">Continue shopping &rsaquo;</a>
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
                <c:choose>
                    <c:when test="${not empty sessionScope.userId}">
                        <a href="${pageContext.request.contextPath}/profile">Account</a>
                        <a href="${pageContext.request.contextPath}/orders">Orders</a>
                        <a href="${pageContext.request.contextPath}/logout" style="color:var(--color-slate);">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login">Sign in</a>
                    </c:otherwise>
                </c:choose>

                <a href="${pageContext.request.contextPath}/cart" class="apple-bag-pill">
                    Bag [${not empty cartItems ? cartItems.size() : 0}]
                </a>
            </div>
        </nav>
    </header>

    <!-- ================= SHOPPING BAG MAIN CONTAINER ================= -->
    <main class="cart-stage-container">
        <!-- Header -->
        <div class="cart-header-area">
            <p class="cart-kicker">Review Your Selection</p>
            <h1 class="cart-headline">Your Shopping Bag</h1>
            <p class="cart-subhead">
                Complimentary shipping on orders over &#8377;2000 and 30-day hassle-free returns on all signature apparel.
            </p>
        </div>

        <c:choose>
            <c:when test="${not empty cartItems && cartItems.size() > 0}">
                <div class="cart-grid-layout">
                    <!-- ================= LEFT: ITEMS LIST ================= -->
                    <div class="cart-items-column">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="cart-item-card">
                                <!-- Media Inner Frame -->
                                <div class="cart-item-thumb">
                                    <c:choose>
                                        <c:when test="${not empty item.image}">
                                            <a href="${pageContext.request.contextPath}/product-details?id=${item.productId}">
                                                <img src="${pageContext.request.contextPath}/assets/${item.image}" alt="${item.productName}">
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <div style="font-size:12px; color:var(--color-slate);">Apparel</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <!-- Information Details -->
                                <div class="cart-item-info">
                                    <a href="${pageContext.request.contextPath}/product-details?id=${item.productId}" class="cart-item-title">
                                        ${item.productName}
                                    </a>
                                    <div class="cart-item-specs">
                                        <span>Color: <strong>${item.color}</strong></span>
                                        <span>&bull;</span>
                                        <span>Size: <span class="cart-spec-pill">${item.size}</span></span>
                                    </div>
                                    <div class="cart-item-price">
                                        &#8377;${item.price}
                                    </div>
                                </div>

                                <!-- Actions: Quantity Stepper & Remove -->
                                <div class="cart-item-actions">
                                    <form action="${pageContext.request.contextPath}/cart" method="post" class="cart-stepper-form">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="cartItemId" value="${item.cartItemId}">

                                        <div class="cart-stepper">
                                            <button type="button" class="cart-stepper-btn btn-dec">&minus;</button>
                                            <input type="number" name="quantity" value="${item.quantity}" min="1" max="10" class="input-qty" aria-label="Quantity">
                                            <button type="button" class="cart-stepper-btn btn-inc">&plus;</button>
                                        </div>

                                        <button type="submit" class="cart-update-btn">Update</button>
                                    </form>

                                    <a href="${pageContext.request.contextPath}/cart?action=delete&cartItemId=${item.cartItemId}"
                                       class="cart-remove-link"
                                       onclick="return confirm('Remove ${item.productName} from your bag?');">
                                        Remove
                                    </a>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Continue shopping shortcut -->
                        <div class="cart-continue-row">
                            <a href="${pageContext.request.contextPath}/products" class="cart-continue-link">
                                &lsaquo; Explore More Collections
                            </a>
                        </div>
                    </div>

                    <!-- ================= RIGHT: STICKY ORDER SUMMARY ================= -->
                    <aside class="cart-summary-card">
                        <h2 class="summary-heading">Order Summary</h2>

                        <div class="summary-breakdown">
                            <div class="summary-row">
                                <span>Subtotal (${cartItems.size()} items)</span>
                                <span class="value">&#8377;${cartTotal}</span>
                            </div>

                            <div class="summary-row">
                                <span>Estimated Shipping</span>
                                <c:choose>
                                    <c:when test="${cartTotal >= 2000}">
                                        <span class="value shipping-free-badge">FREE</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="value">&#8377;150</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="summary-row">
                                <span>Estimated Tax &amp; GST</span>
                                <span class="value">Included</span>
                            </div>

                            <div class="summary-divider"></div>

                            <div class="summary-total-row">
                                <span>Total</span>
                                <span class="total-amount">&#8377;${cartTotal >= 2000 ? cartTotal : cartTotal + 150}</span>
                            </div>

                            <a href="${pageContext.request.contextPath}/checkout" class="btn-apple-checkout">
                                Check Out &rsaquo;
                            </a>

                            <div class="summary-trust-badges">
                                <div class="trust-item">
                                    <span class="trust-icon">&#10003;</span>
                                    <span>256-Bit SSL Encrypted &amp; Secure Checkout</span>
                                </div>
                                <div class="trust-item">
                                    <span class="trust-icon">&#10003;</span>
                                    <span>Fast Courier Dispatch with Live Tracking</span>
                                </div>
                                <div class="trust-item">
                                    <span class="trust-icon">&#10003;</span>
                                    <span>30 Days Effortless Returns &amp; Exchanges</span>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </c:when>

            <c:otherwise>
                <!-- ================= EMPTY BAG VIEW ================= -->
                <div class="cart-empty-container">
                    <div class="cart-empty-badge">
                        &#10022;
                    </div>
                    <h2 class="cart-empty-title">Your Bag is Empty</h2>
                    <p class="cart-empty-desc">
                        Explore our new Autumn / Winter collection, tailored silhouettes, and premium wardrobe essentials.
                    </p>
                    <a href="${pageContext.request.contextPath}/products" class="btn-empty-shop">
                        Continue Shopping &rsaquo;
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
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

    <!-- Interactive Stepper Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".cart-stepper-form").forEach(function(form) {
                const decBtn = form.querySelector(".btn-dec");
                const incBtn = form.querySelector(".btn-inc");
                const qtyInput = form.querySelector(".input-qty");

                if (decBtn && qtyInput) {
                    decBtn.addEventListener("click", function() {
                        let val = parseInt(qtyInput.value) || 1;
                        if (val > 1) {
                            qtyInput.value = val - 1;
                        }
                    });
                }
                if (incBtn && qtyInput) {
                    incBtn.addEventListener("click", function() {
                        let val = parseInt(qtyInput.value) || 1;
                        if (val < 10) {
                            qtyInput.value = val + 1;
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
