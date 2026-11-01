<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop All Products &mdash; Fashion Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css?v=<%= System.currentTimeMillis() %>">
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
.shop-hero-banner {
  background-color: var(--color-gallery-white);
  padding: 56px 24px 36px;
  text-align: center;
}
.shop-hero-inner {
  max-width: 860px;
  margin: 0 auto;
}
.shop-kicker {
  font-size: 16px;
  font-weight: 600;
  color: var(--color-launch-orange);
  margin-bottom: 8px;
  text-transform: uppercase;
  letter-spacing: 0.04em;
}
.shop-headline {
  font-size: 46px;
  line-height: 1.1;
  font-weight: 600;
  letter-spacing: -0.025em;
  color: var(--color-ink);
  margin-bottom: 12px;
}
@media (max-width: 768px) {
  .shop-headline {
    font-size: 32px;
  }
}
.shop-subtitle {
  font-size: 18px;
  line-height: 1.45;
  color: var(--color-slate);
  margin-bottom: 24px;
}
.shop-filter-bar {
  max-width: 1140px;
  margin: 0 auto 36px;
  padding: 0 24px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  flex-wrap: wrap;
}
.shop-category-pills {
  display: flex;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
}
.category-pill {
  font-size: 13px;
  font-weight: 500;
  padding: 8px 18px;
  border-radius: var(--radius-pills);
  background: var(--color-studio-mist);
  color: var(--color-ink);
  border: 1px solid transparent;
  transition: all 0.2s ease;
}
.category-pill:hover {
  background: #ebebed;
}
.category-pill.active {
  background: var(--color-ink);
  color: #ffffff;
}
.shop-search-box {
  display: inline-flex;
  align-items: center;
  background: var(--color-studio-mist);
  border: 1px solid var(--color-control-gray);
  border-radius: var(--radius-inputs);
  padding: 7px 16px;
  gap: 10px;
  transition: all 0.2s ease;
}
.shop-search-box input {
  border: none;
  background: transparent;
  font-size: 13px;
  color: var(--color-ink);
  outline: none;
  width: 180px;
}
.shop-search-box:focus-within {
  background: #ffffff;
  border-color: var(--color-pricing-blue);
  box-shadow: 0 0 0 3px rgba(0, 113, 227, 0.15);
}
.shop-search-box button {
  background: none;
  border: none;
  color: var(--color-pricing-blue);
  font-weight: 600;
  font-size: 13px;
  cursor: pointer;
}
.shop-meta-strip {
  max-width: 1140px;
  margin: 0 auto 20px;
  padding: 0 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 13px;
  color: var(--color-slate);
}
.shop-catalog-stage {
  max-width: 1140px;
  margin: 0 auto 80px;
  padding: 0 24px;
}
.shop-product-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 24px;
}
@media (max-width: 1024px) {
  .shop-product-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (max-width: 560px) {
  .shop-product-grid {
    grid-template-columns: 1fr;
  }
}
.apple-catalog-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 20px;
  display: flex;
  flex-direction: column;
  text-decoration: none;
  transition: transform 0.25s ease, box-shadow 0.25s ease, background-color 0.25s ease;
  border: 1px solid rgba(0, 0, 0, 0.04);
  box-shadow: var(--shadow-card);
}
.apple-catalog-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-hover);
  background-color: #f0f0f2;
}
.card-media-wrapper {
  width: 100%;
  aspect-ratio: 1/1;
  border-radius: var(--radius-media-inner);
  overflow: hidden;
  margin-bottom: 14px;
  background-color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
}
.card-media-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.35s ease;
}
.apple-catalog-card:hover .card-media-wrapper img {
  transform: scale(1.05);
}
.card-details-wrapper {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}
.card-category-kicker {
  font-size: 11px;
  font-weight: 600;
  color: var(--color-slate);
  text-transform: uppercase;
  letter-spacing: 0.04em;
  margin-bottom: 4px;
}
.card-product-name {
  font-size: 16px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.01em;
  margin-bottom: 4px;
  line-height: 1.25;
}
.card-color-spec {
  font-size: 13px;
  color: var(--color-slate);
  margin-bottom: 10px;
}
.card-bottom-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: auto;
  padding-top: 12px;
  border-top: 1px solid rgba(0, 0, 0, 0.05);
}
.card-price-value {
  font-size: 17px;
  font-weight: 600;
  color: var(--color-ink);
}
.card-action-pill {
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  font-size: 12px;
  font-weight: 500;
  padding: 6px 14px;
  border-radius: var(--radius-pills);
  display: inline-flex;
  align-items: center;
  transition: background-color 0.15s ease, transform 0.15s ease;
}
.card-action-pill:hover {
  background-color: #0077ed;
  transform: scale(1.03);
}
.shop-empty-state {
  text-align: center;
  padding: 64px 24px;
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  grid-column: 1 / -1;
}
.shop-empty-state h3 {
  font-size: 26px;
  font-weight: 600;
  color: var(--color-ink);
  margin-bottom: 10px;
}
.shop-empty-state p {
  color: var(--color-slate);
  margin-bottom: 20px;
}
.btn-reset-filter {
  background-color: var(--color-pricing-blue);
  color: #ffffff;
  padding: 10px 22px;
  font-size: 13px;
  font-weight: 500;
  border-radius: var(--radius-pills);
  display: inline-block;
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
        <a href="${pageContext.request.contextPath}/home">Return to Overview &rsaquo;</a>
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
                <a href="${pageContext.request.contextPath}/products" class="active">Shop</a>
                <c:forEach var="cat" items="${categories}">
                    <a href="${pageContext.request.contextPath}/products?category=${cat.categoryId}"
                       class="${selectedCategory == cat.categoryId ? 'active' : ''}">
                        ${cat.categoryName}
                    </a>
                </c:forEach>
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

    <main>
        <!-- ================= CATALOG HERO BANNER ================= -->
        <section class="shop-hero-banner">
            <div class="shop-hero-inner">
                <p class="shop-kicker">Curated Apparel &amp; Footwear</p>
                <h1 class="shop-headline">Explore the Full Collection.</h1>
                <p class="shop-subtitle">
                    Engineered for everyday versatility, tailored silhouettes, and premium materials designed to last.
                </p>
            </div>
        </section>

        <!-- ================= FILTER PILLS & SEARCH ================= -->
        <section class="shop-filter-bar">
            <!-- Category Pills -->
            <div class="shop-category-pills">
                <a href="${pageContext.request.contextPath}/products"
                   class="category-pill ${empty selectedCategory ? 'active' : ''}">
                    All Pieces
                </a>
                <c:forEach var="cat" items="${categories}">
                    <a href="${pageContext.request.contextPath}/products?category=${cat.categoryId}"
                       class="category-pill ${selectedCategory == cat.categoryId ? 'active' : ''}">
                        ${cat.categoryName}
                    </a>
                </c:forEach>
            </div>

            <!-- Search Pill Form -->
            <form action="${pageContext.request.contextPath}/products" method="get" class="shop-search-box">
                <c:if test="${not empty selectedCategory}">
                    <input type="hidden" name="category" value="${selectedCategory}">
                </c:if>
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <input type="text" name="search" placeholder="Search catalog..." value="${search}">
                <button type="submit">Search</button>
            </form>
        </section>

        <!-- ================= META STRIP ================= -->
        <div class="shop-meta-strip">
            <span>
                Showing <strong>${products.size()}</strong> items
                <c:if test="${not empty search}">
                    matching "<em>${search}</em>"
                </c:if>
            </span>
            <c:if test="${not empty selectedCategory || not empty search}">
                <a href="${pageContext.request.contextPath}/products" class="apple-link-blue" style="font-size:13px;">
                    Clear filters <span>&times;</span>
                </a>
            </c:if>
        </div>

        <!-- ================= PRODUCTS GRID (GALLERY CARDS) ================= -->
        <section class="shop-catalog-stage">
            <div class="shop-product-grid">
                <c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="product" items="${products}">
                            <a href="${pageContext.request.contextPath}/product-details?id=${product.productId}" class="apple-catalog-card">
                                <div class="card-media-wrapper">
                                    <c:choose>
                                        <c:when test="${not empty product.image}">
                                            <img src="${pageContext.request.contextPath}/assets/${product.image}"
                                                 alt="${product.productName}"
                                                 loading="lazy">
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color:var(--color-slate); font-size:12px;">Apparel</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="card-details-wrapper">
                                    <span class="card-category-kicker">
                                        <c:forEach var="c" items="${categories}">
                                            <c:if test="${c.categoryId == product.categoryId}">
                                                ${c.categoryName}
                                            </c:if>
                                        </c:forEach>
                                    </span>

                                    <h2 class="card-product-name">${product.productName}</h2>
                                    <span class="card-color-spec">Color: ${product.color}</span>

                                    <div class="card-bottom-row">
                                        <span class="card-price-value">&#8377;${product.price}</span>
                                        <span class="card-action-pill">Details &rsaquo;</span>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <div class="shop-empty-state">
                            <h3>No Products Found</h3>
                            <p>We could not find any items matching your selected criteria.</p>
                            <a href="${pageContext.request.contextPath}/products" class="btn-reset-filter">
                                View All Products
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
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
