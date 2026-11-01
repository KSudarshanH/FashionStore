<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productName} &mdash; Fashion Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product-details.css?v=<%= System.currentTimeMillis() %>">
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
  height: auto;
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
  max-width: 1140px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 52px;
  padding: 0 24px;
}
.apple-logo-lockup {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 16px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.02em;
}
.apple-logo-badge {
  width: 24px;
  height: 24px;
  background: var(--color-ink);
  color: #fff;
  border-radius: 6px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 12px;
  font-weight: 700;
}
.apple-nav-links {
  display: flex;
  align-items: center;
  gap: 24px;
}
@media (max-width: 900px) {
  .apple-nav-links {
    display: none;
  }
}
.apple-nav-links a {
  font-size: 12px;
  color: rgba(29, 29, 31, 0.8);
  padding: 6px 0;
}
.apple-nav-links a:hover, .apple-nav-links a.active {
  color: var(--color-ink);
  font-weight: 600;
}
.apple-nav-actions {
  display: flex;
  align-items: center;
  gap: 16px;
}
.apple-nav-actions a {
  font-size: 12px;
  color: rgba(29, 29, 31, 0.8);
}
.apple-nav-actions a:hover {
  color: var(--color-ink);
}
.apple-bag-badge {
  background: var(--color-pricing-blue);
  color: #ffffff;
  font-size: 11px;
  font-weight: 600;
  border-radius: var(--radius-pills);
  padding: 2px 8px;
}
.product-local-bar {
  background: rgba(255, 255, 255, 0.95);
  border-bottom: 1px solid var(--color-hairline-silver);
  padding: 10px 24px;
  position: sticky;
  top: 52px;
  z-index: 900;
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
}
.product-local-inner {
  max-width: 1140px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.local-product-title {
  font-size: 17px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.015em;
}
.local-right-controls {
  display: flex;
  align-items: center;
  gap: 16px;
}
.local-price-tag {
  font-size: 15px;
  font-weight: 600;
  color: var(--color-ink);
}
.local-buy-pill {
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  font-size: 12px;
  font-weight: 500;
  padding: 6px 16px;
  border-radius: var(--radius-pills);
  transition: all 0.2s ease;
}
.local-buy-pill:hover {
  background-color: #0077ed;
  transform: scale(1.02);
}
.product-stage-container {
  max-width: 1140px;
  margin: 40px auto 90px;
  padding: 0 24px;
}
.product-breadcrumb {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 12px;
  color: var(--color-slate);
  margin-bottom: 28px;
}
.product-breadcrumb a:hover {
  color: var(--color-ink);
  text-decoration: underline;
}
.product-split-stage {
  display: grid;
  grid-template-columns: 1.15fr 0.85fr;
  gap: 48px;
  align-items: start;
}
@media (max-width: 900px) {
  .product-split-stage {
    grid-template-columns: 1fr;
    gap: 32px;
  }
}
.product-media-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(0, 0, 0, 0.04);
  box-shadow: var(--shadow-card);
}
.product-media-card img {
  width: 100%;
  aspect-ratio: 1/1;
  object-fit: cover;
  border-radius: var(--radius-media-inner);
  background: #ffffff;
  box-shadow: 0 8px 30px rgba(0, 0, 0, 0.05);
}
.product-config-panel {
  display: flex;
  flex-direction: column;
}
.config-kicker {
  font-size: 12px;
  font-weight: 600;
  color: var(--color-launch-orange);
  text-transform: uppercase;
  letter-spacing: 0.04em;
  margin-bottom: 8px;
}
.config-title {
  font-size: 38px;
  line-height: 1.12;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.025em;
  margin-bottom: 12px;
}
@media (max-width: 768px) {
  .config-title {
    font-size: 28px;
  }
}
.config-price-box {
  display: flex;
  align-items: baseline;
  gap: 12px;
  margin-bottom: 20px;
}
.config-price {
  font-size: 26px;
  font-weight: 600;
  color: var(--color-ink);
}
.config-shipping-badge {
  font-size: 13px;
  color: #12803b;
  font-weight: 500;
  background: rgba(18, 128, 59, 0.08);
  padding: 3px 10px;
  border-radius: var(--radius-pills);
}
.config-description {
  font-size: 16px;
  line-height: 1.5;
  color: var(--color-slate);
  margin-bottom: 28px;
  padding-bottom: 24px;
  border-bottom: 1px solid var(--color-control-gray);
}
.config-group {
  margin-bottom: 24px;
}
.config-label {
  font-size: 13px;
  font-weight: 600;
  color: var(--color-ink);
  margin-bottom: 10px;
  display: flex;
  justify-content: space-between;
}
.size-pills-row {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
}
.size-pill-radio {
  position: relative;
  cursor: pointer;
}
.size-pill-radio input {
  position: absolute;
  opacity: 0;
  pointer-events: none;
}
.size-pill-span {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 52px;
  height: 40px;
  padding: 0 16px;
  border-radius: var(--radius-pills);
  background: var(--color-studio-mist);
  color: var(--color-ink);
  font-size: 14px;
  font-weight: 500;
  border: 1px solid transparent;
  transition: all 0.2s ease;
}
.size-pill-radio:hover .size-pill-span {
  background: #ebebed;
}
.size-pill-radio input:checked + .size-pill-span {
  background: var(--color-ink);
  color: #ffffff;
}
.quantity-stepper-box {
  display: inline-flex;
  align-items: center;
  background: var(--color-studio-mist);
  border-radius: var(--radius-pills);
  padding: 4px;
  border: 1px solid var(--color-control-gray);
}
.stepper-btn {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: #ffffff;
  border: 1px solid var(--color-control-gray);
  color: var(--color-ink);
  font-size: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.15s ease;
}
.stepper-btn:hover {
  background: var(--color-ink);
  color: #ffffff;
  border-color: var(--color-ink);
}
.stepper-input {
  width: 44px;
  text-align: center;
  border: none;
  background: transparent;
  font-size: 15px;
  font-weight: 600;
  color: var(--color-ink);
  outline: none;
}
.btn-add-bag {
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  font-size: 16px;
  font-weight: 600;
  padding: 16px 32px;
  border-radius: var(--radius-pills);
  border: none;
  cursor: pointer;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  margin-top: 24px;
  margin-bottom: 32px;
  box-shadow: 0 4px 16px rgba(0, 113, 227, 0.25);
  transition: all 0.2s ease;
}
.btn-add-bag:hover {
  background-color: #0077ed;
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(0, 113, 227, 0.35);
}
.product-specs-card {
  background: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 24px;
  border: 1px solid rgba(0, 0, 0, 0.04);
}
.specs-heading {
  font-size: 15px;
  font-weight: 600;
  color: var(--color-ink);
  margin-bottom: 14px;
}
.spec-item-row {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px solid rgba(0, 0, 0, 0.06);
  font-size: 14px;
}
.spec-item-row:last-child {
  border-bottom: none;
}
.spec-label {
  color: var(--color-slate);
}
.spec-val {
  font-weight: 500;
  color: var(--color-ink);
}
.apple-alert-box {
  background: #fff2f2;
  border: 1px solid #ffcccc;
  color: #cc0000;
  padding: 10px 18px;
  border-radius: var(--radius-pills);
  font-size: 13px;
  font-weight: 500;
  margin-bottom: 20px;
}
.apple-footer {
  background-color: var(--color-studio-mist);
  color: var(--color-slate);
  font-size: 12px;
  line-height: 1.4;
  border-top: 1px solid var(--color-hairline-silver);
  padding: 40px 24px 30px;
}
.apple-footer-container {
  max-width: 1140px;
  margin: 0 auto;
}
.apple-footer-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 32px;
  padding-bottom: 28px;
  border-bottom: 1px solid var(--color-hairline-silver);
}
@media (max-width: 768px) {
  .apple-footer-grid {
    grid-template-columns: 1fr 1fr;
  }
}
.apple-footer-col h4 {
  font-size: 12px;
  font-weight: 600;
  color: var(--color-ink);
  margin-bottom: 12px;
}
.apple-footer-col a {
  display: block;
  font-size: 12px;
  color: var(--color-slate);
  margin-bottom: 8px;
}
.apple-footer-col a:hover {
  color: var(--color-ink);
  text-decoration: underline;
}
.apple-footer-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 16px;
  font-size: 11px;
  color: var(--color-slate);
  flex-wrap: wrap;
  gap: 12px;
}
    </style>
</head>
<body>

    <!-- ================= TOP ANNOUNCEMENT RIBBON ================= -->
    <div class="apple-ribbon">
        <strong>Complimentary Shipping.</strong> Free delivery on all orders over &#8377;2000.
        <a href="${pageContext.request.contextPath}/products">Browse all products &rsaquo;</a>
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

                <a href="${pageContext.request.contextPath}/cart" class="apple-link-blue" style="font-size:13px;">
                    Bag <span class="apple-bag-badge">Bag</span>
                </a>
            </div>
        </nav>
    </header>

    <!-- ================= APPLE PRODUCT LOCAL BAR ================= -->
    <div class="product-local-bar">
        <div class="product-local-inner">
            <span class="local-product-title">${product.productName}</span>
            <div class="local-right-controls">
                <span class="local-price-tag">&#8377;${product.price}</span>
                <a href="#addToBagSection" class="local-buy-pill">
                    Add to Bag
                </a>
            </div>
        </div>
    </div>

    <main class="product-stage-container">
        <!-- Breadcrumb -->
        <div class="product-breadcrumb">
            <a href="${pageContext.request.contextPath}/home">Overview</a>
            <span>&rsaquo;</span>
            <a href="${pageContext.request.contextPath}/products">Shop</a>
            <span>&rsaquo;</span>
            <span>${product.productName}</span>
        </div>

        <c:if test="${param.error == 'size'}">
            <div class="apple-alert-box">
                Please select a size variant before adding to your shopping bag.
            </div>
        </c:if>

        <div class="product-split-stage">
            <!-- ================= LEFT: 28PX ROUNDED MEDIA SHOWCASE ================= -->
            <div class="product-media-card">
                <c:choose>
                    <c:when test="${not empty product.image}">
                        <img src="${pageContext.request.contextPath}/assets/${product.image}"
                             alt="${product.productName}">
                    </c:when>
                    <c:otherwise>
                        <div style="aspect-ratio:1/1; display:flex; align-items:center; justify-content:center; color:var(--color-slate);">
                            No Product Image
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- ================= RIGHT: CONFIGURATION DETAILS ================= -->
            <div class="product-config-panel">
                <p class="config-kicker">
                    <c:choose>
                        <c:when test="${product.categoryId == 1}">Men's Collection</c:when>
                        <c:when test="${product.categoryId == 2}">Women's Collection</c:when>
                        <c:when test="${product.categoryId == 3}">Kids' Collection</c:when>
                        <c:when test="${product.categoryId == 4}">Footwear</c:when>
                        <c:when test="${product.categoryId == 5}">Accessories</c:when>
                        <c:otherwise>Signature Apparel</c:otherwise>
                    </c:choose>
                </p>

                <h1 class="config-title">${product.productName}</h1>

                <div class="config-price-box">
                    <span class="config-price">&#8377;${product.price}</span>
                    <span class="config-shipping-badge">Free Delivery</span>
                </div>

                <p class="config-description">
                    ${product.description}
                </p>

                <!-- ADD TO CART FORM -->
                <form action="${pageContext.request.contextPath}/cart" method="post" id="addToBagSection">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="${product.productId}">

                    <!-- COLOR SPECIFICATION -->
                    <div class="config-group">
                        <div class="config-label">
                            <span>Selected Finish / Color</span>
                            <span style="color:var(--color-slate); font-weight:400;">${product.color}</span>
                        </div>
                        <div style="display:flex; align-items:center; gap:8px;">
                            <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background:var(--color-ink); border:2px solid #fff; box-shadow:0 0 0 1px var(--color-hairline-silver);"></span>
                            <span style="font-size:14px; font-weight:500;">${product.color}</span>
                        </div>
                    </div>

                    <!-- SIZE SELECTION PILLS -->
                    <div class="config-group">
                        <div class="config-label">
                            <span>Select Size</span>
                            <a href="#" class="apple-link-blue" style="font-size:12px;">Size Guide</a>
                        </div>

                        <div class="size-pills-row">
                            <c:choose>
                                <c:when test="${not empty variants}">
                                    <c:forEach var="v" items="${variants}" varStatus="status">
                                        <label class="size-pill-radio ${v.stock <= 0 ? 'disabled' : ''}">
                                            <input type="radio" name="size" value="${v.size}"
                                                   ${status.first ? 'checked' : ''}
                                                   ${v.stock <= 0 ? 'disabled' : ''} required>
                                            <span class="size-pill-span" style="${v.size.length() > 3 ? 'min-width:90px;' : ''}">${v.size}</span>
                                        </label>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <label class="size-pill-radio">
                                        <input type="radio" name="size" value="Free Size" checked required>
                                        <span class="size-pill-span" style="min-width:90px;">Free Size</span>
                                    </label>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- QUANTITY STEPPER -->
                    <div class="config-group">
                        <div class="config-label">
                            <span>Quantity</span>
                        </div>
                        <div class="quantity-stepper-box">
                            <button type="button" class="stepper-btn" id="decQty">&minus;</button>
                            <input type="number" name="quantity" id="qtyInput" value="1" min="1" max="10" class="stepper-input">
                            <button type="button" class="stepper-btn" id="incQty">+</button>
                        </div>
                    </div>

                    <!-- CONVERSION BUTTON -->
                    <button type="submit" class="btn-add-bag">
                        Add to Bag &mdash; &#8377;${product.price}
                    </button>
                </form>

                <!-- SPECIFICATIONS CARD (STUDIO MIST 28PX CARD) -->
                <div class="product-specs-card">
                    <h3 class="specs-heading">Product Highlights &amp; Care</h3>
                    <div class="spec-item-row">
                        <span class="spec-label">Material &amp; Weave</span>
                        <span class="spec-val">100% Breathable Organic Cotton</span>
                    </div>
                    <div class="spec-item-row">
                        <span class="spec-label">Tailored Cut</span>
                        <span class="spec-val">Engineered Ergonomic Fit</span>
                    </div>
                    <div class="spec-item-row">
                        <span class="spec-label">Care Instructions</span>
                        <span class="spec-val">Machine wash cold, gentle cycle</span>
                    </div>
                    <div class="spec-item-row">
                        <span class="spec-label">Dispatch Guarantee</span>
                        <span class="spec-val">Dispatches within 24-48 hours</span>
                    </div>
                </div>
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

    <!-- Stepper logic -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const dec = document.getElementById("decQty");
            const inc = document.getElementById("incQty");
            const input = document.getElementById("qtyInput");
            if (dec && inc && input) {
                dec.addEventListener("click", function () {
                    let v = parseInt(input.value) || 1;
                    if (v > 1) input.value = v - 1;
                });
                inc.addEventListener("click", function () {
                    let v = parseInt(input.value) || 1;
                    input.value = v + 1;
                });
            }
        });
    </script>
</body>
</html>
