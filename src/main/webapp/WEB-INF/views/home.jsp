<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion Store &mdash; The White Gallery</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css?v=<%= System.currentTimeMillis() %>">
    <style>
/* Apple Design System - Inlined for instant rendering */
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
  --text-global-nav: 12px;
  --text-body-small: 14px;
  --text-body: 17px;
  --text-product-kicker: 19px;
  --text-feature-heading: 40px;
  --text-hero-display: 56px;
  --font-weight-regular: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;
  --radius-cards: 28px;
  --radius-images: 28px;
  --radius-media-inner: 20px;
  --radius-pills: 9999px;
  --radius-buttons: 9999px;
  --radius-inputs: 980px;
  --shadow-card: 0 4px 24px rgba(0, 0, 0, 0.04);
  --shadow-hover: 0 10px 36px rgba(0, 0, 0, 0.08);
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
  font-size: var(--text-body);
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
  font-size: var(--text-global-nav);
  padding: 12px 20px;
  text-align: center;
  border-bottom: 1px solid var(--color-control-gray);
  letter-spacing: -0.01em;
}
.apple-ribbon strong {
  color: var(--color-ink);
  font-weight: var(--font-weight-semibold);
}
.apple-ribbon a {
  color: var(--color-apple-blue);
  margin-left: 6px;
  font-weight: var(--font-weight-medium);
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
  font-weight: var(--font-weight-semibold);
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
  font-size: var(--text-global-nav);
  color: rgba(29, 29, 31, 0.8);
  font-weight: var(--font-weight-regular);
  padding: 6px 0;
}
.apple-nav-links a:hover, .apple-nav-links a.active {
  color: var(--color-ink);
  font-weight: var(--font-weight-medium);
}
.apple-nav-actions {
  display: flex;
  align-items: center;
  gap: 16px;
}
.apple-nav-actions a, .apple-nav-actions button {
  font-size: var(--text-global-nav);
  color: rgba(29, 29, 31, 0.8);
  background: none;
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 6px;
}
.apple-nav-actions a:hover {
  color: var(--color-ink);
}
.apple-bag-badge {
  background: var(--color-pricing-blue);
  color: #ffffff;
  font-size: 11px;
  font-weight: var(--font-weight-semibold);
  border-radius: var(--radius-pills);
  padding: 2px 8px;
}
.apple-search-bar {
  display: inline-flex;
  align-items: center;
  background: var(--color-studio-mist);
  border: 1px solid var(--color-control-gray);
  border-radius: var(--radius-inputs);
  padding: 6px 14px;
  gap: 8px;
  transition: all 0.2s ease;
}
.apple-search-bar input {
  border: none;
  background: transparent;
  font-size: 12px;
  color: var(--color-ink);
  outline: none;
  width: 130px;
}
.apple-search-bar:focus-within {
  background: #ffffff;
  border-color: var(--color-pricing-blue);
  box-shadow: 0 0 0 3px rgba(0, 113, 227, 0.15);
}
.apple-btn-blue {
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  font-size: 14px;
  font-weight: var(--font-weight-medium);
  padding: 11px 24px;
  border-radius: var(--radius-pills);
  border: none;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  text-decoration: none;
  transition: all 0.2s ease;
}
.apple-btn-blue:hover {
  background-color: #0077ed;
  transform: scale(1.02);
}
.apple-btn-outline {
  background-color: transparent;
  color: var(--color-pricing-blue) !important;
  font-size: 14px;
  font-weight: var(--font-weight-medium);
  padding: 10px 22px;
  border-radius: var(--radius-pills);
  border: 1px solid var(--color-pricing-blue);
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  text-decoration: none;
  transition: all 0.2s ease;
}
.apple-btn-outline:hover {
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
}
.apple-link-blue {
  color: var(--color-apple-blue);
  font-size: 14px;
  font-weight: var(--font-weight-medium);
  display: inline-flex;
  align-items: center;
  gap: 4px;
}
.apple-link-blue:hover {
  text-decoration: underline;
}
.apple-hero-stage {
  background-color: var(--color-gallery-white);
  padding: 56px 24px 72px;
  text-align: center;
}
.apple-hero-container {
  max-width: 920px;
  margin: 0 auto;
}
.apple-hero-kicker {
  font-size: var(--text-product-kicker);
  font-weight: var(--font-weight-semibold);
  color: var(--color-launch-orange);
  margin-bottom: 12px;
}
.apple-hero-headline {
  font-size: var(--text-hero-display);
  line-height: 1.06;
  font-weight: var(--font-weight-semibold);
  letter-spacing: -0.03em;
  color: var(--color-ink);
  margin-bottom: 16px;
}
@media (max-width: 768px) {
  .apple-hero-headline {
    font-size: 38px;
  }
}
.apple-hero-subtitle {
  font-size: 19px;
  line-height: 1.4;
  color: var(--color-slate);
  max-width: 640px;
  margin: 0 auto 28px;
}
.apple-hero-cta-group {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 16px;
  margin-bottom: 40px;
  flex-wrap: wrap;
}
.apple-hero-visual-frame {
  position: relative;
  max-width: 1040px;
  margin: 0 auto;
  border-radius: var(--radius-images);
  overflow: hidden;
  box-shadow: 0 16px 48px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(0, 0, 0, 0.06);
}
.apple-hero-visual-frame img {
  width: 100%;
  height: 520px;
  object-fit: cover;
  object-position: center 20%;
  border-radius: var(--radius-images);
  display: block;
}
@media (max-width: 768px) {
  .apple-hero-visual-frame img {
    height: 320px;
  }
}
.apple-floating-capsule {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  background: rgba(255, 255, 255, 0.94);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  border-radius: var(--radius-pills);
  padding: 8px 20px;
  display: flex;
  align-items: center;
  gap: 14px;
  border: 1px solid rgba(0, 0, 0, 0.08);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
  white-space: nowrap;
}
.apple-floating-capsule span {
  font-size: 13px;
  font-weight: var(--font-weight-medium);
  color: var(--color-ink);
}
.apple-highlights-stage {
  background-color: var(--color-studio-mist);
  padding: 80px 24px;
}
.apple-section-header {
  max-width: 1140px;
  margin: 0 auto 36px;
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 16px;
}
.apple-section-header h2 {
  font-size: var(--text-feature-heading);
  font-weight: var(--font-weight-semibold);
  letter-spacing: -0.025em;
  color: var(--color-ink);
}
@media (max-width: 768px) {
  .apple-section-header h2 {
    font-size: 30px;
  }
}
.apple-cards-grid {
  max-width: 1140px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
  gap: 20px;
}
.apple-feature-card {
  background-color: var(--color-gallery-white);
  border-radius: var(--radius-cards);
  padding: 18px;
  display: flex;
  flex-direction: column;
  transition: transform 0.25s ease, box-shadow 0.25s ease;
  border: 1px solid rgba(0, 0, 0, 0.04);
  box-shadow: var(--shadow-card);
  text-decoration: none;
}
.apple-feature-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-hover);
}
.apple-card-media {
  width: 100%;
  aspect-ratio: 4/5;
  border-radius: var(--radius-media-inner);
  overflow: hidden;
  margin-bottom: 14px;
  background-color: var(--color-studio-mist);
}
.apple-card-media img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.35s ease;
}
.apple-feature-card:hover .apple-card-media img {
  transform: scale(1.04);
}
.apple-card-content {
  display: flex;
  flex-direction: column;
  gap: 4px;
}
.apple-card-kicker {
  font-size: 11px;
  font-weight: var(--font-weight-semibold);
  color: var(--color-slate);
  text-transform: uppercase;
  letter-spacing: 0.04em;
}
.apple-card-title {
  font-size: 18px;
  font-weight: var(--font-weight-semibold);
  letter-spacing: -0.015em;
  color: var(--color-ink);
}
.apple-card-link {
  font-size: 12px;
  font-weight: var(--font-weight-medium);
  color: var(--color-apple-blue);
  margin-top: 4px;
}
.apple-products-stage {
  background-color: var(--color-gallery-white);
  padding: 80px 24px;
}
.apple-product-grid {
  max-width: 1140px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}
@media (max-width: 1024px) {
  .apple-product-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (max-width: 560px) {
  .apple-product-grid {
    grid-template-columns: 1fr;
  }
}
.apple-product-item {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 18px;
  display: flex;
  flex-direction: column;
  text-decoration: none;
  transition: transform 0.25s ease, box-shadow 0.25s ease;
  border: 1px solid rgba(0, 0, 0, 0.04);
}
.apple-product-item:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 32px rgba(0, 0, 0, 0.06);
  background-color: #f0f0f2;
}
.apple-product-visual {
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
.apple-product-visual img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.35s ease;
}
.apple-product-item:hover .apple-product-visual img {
  transform: scale(1.05);
}
.apple-product-info {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}
.apple-product-cat {
  font-size: 11px;
  font-weight: var(--font-weight-semibold);
  color: var(--color-slate);
  text-transform: uppercase;
  letter-spacing: 0.04em;
  margin-bottom: 4px;
}
.apple-product-name {
  font-size: 15px;
  font-weight: var(--font-weight-semibold);
  color: var(--color-ink);
  letter-spacing: -0.01em;
  margin-bottom: 8px;
  line-height: 1.25;
}
.apple-product-bottom {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: auto;
  padding-top: 10px;
}
.apple-product-price {
  font-size: 16px;
  font-weight: var(--font-weight-semibold);
  color: var(--color-ink);
}
.apple-mini-pill {
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  font-size: 12px;
  font-weight: var(--font-weight-medium);
  padding: 5px 12px;
  border-radius: var(--radius-pills);
  display: inline-flex;
  align-items: center;
  transition: background-color 0.15s ease;
}
.apple-mini-pill:hover {
  background-color: #0077ed;
}
.apple-story-section {
  background-color: var(--color-studio-mist);
  padding: 80px 24px;
}
.apple-story-container {
  max-width: 1140px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
  align-items: center;
}
@media (max-width: 860px) {
  .apple-story-container {
    grid-template-columns: 1fr;
  }
}
.apple-story-copy {
  display: flex;
  flex-direction: column;
  gap: 14px;
}
.apple-story-copy h3 {
  font-size: 32px;
  font-weight: var(--font-weight-semibold);
  letter-spacing: -0.025em;
  color: var(--color-ink);
  line-height: 1.15;
}
.apple-story-copy p {
  font-size: 16px;
  line-height: 1.5;
  color: var(--color-slate);
}
.apple-story-visual {
  border-radius: var(--radius-cards);
  overflow: hidden;
  box-shadow: 0 12px 36px rgba(0,0,0,0.06);
}
.apple-story-visual img {
  width: 100%;
  height: 380px;
  object-fit: cover;
  object-position: center;
  display: block;
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
  font-weight: var(--font-weight-semibold);
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

    <!-- ================= APPLE TOP RIBBON ================= -->
    <div class="apple-ribbon">
        <strong>Complimentary Shipping.</strong> Free delivery on all orders over &#8377;2000.
        <a href="${pageContext.request.contextPath}/products">Shop now &rsaquo;</a>
    </div>

    <!-- ================= APPLE FROSTED GLASS NAVIGATION ================= -->
    <header class="apple-nav-wrapper">
        <nav class="apple-nav-container">
            <!-- Brand -->
            <a href="${pageContext.request.contextPath}/home" class="apple-logo-lockup">
                <span class="apple-logo-badge">&#10022;</span>
                <span>fashion store</span>
            </a>

            <!-- Navigation Links -->
            <div class="apple-nav-links">
                <a href="${pageContext.request.contextPath}/home" class="active">Overview</a>
                <a href="${pageContext.request.contextPath}/products">Shop</a>
                <c:forEach var="cat" items="${categories}">
                    <a href="${pageContext.request.contextPath}/products?category=${cat.categoryId}">
                        ${cat.categoryName}
                    </a>
                </c:forEach>
            </div>

            <!-- Utility Controls -->
            <div class="apple-nav-actions">
                <form action="${pageContext.request.contextPath}/products" method="get" class="apple-search-bar">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <input type="text" name="search" placeholder="Search products">
                </form>

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
        <!-- ================= HERO PRODUCT STAGE (GALLERY WHITE) ================= -->
        <section class="apple-hero-stage">
            <div class="apple-hero-container">
                <p class="apple-hero-kicker">New Autumn / Winter Collection</p>
                <h1 class="apple-hero-headline">Your Style. Beautifully Crafted.</h1>
                <p class="apple-hero-subtitle">
                    Discover everyday luxury, tailored silhouettes, and premium essentials designed for effortless comfort and timeless elegance.
                </p>

                <div class="apple-hero-cta-group">
                    <a href="${pageContext.request.contextPath}/products" class="apple-btn-blue">
                        Shop the Collection
                    </a>
                    <a href="#departments" class="apple-btn-outline">
                        Explore Highlights
                    </a>
                </div>
            </div>

            <!-- Hero Centerpiece Visual Stage with 28px Rounded Frame -->
            <div class="apple-hero-visual-frame">
                <img src="${pageContext.request.contextPath}/assets/images/hero-fashion.jpg?v=<%= System.currentTimeMillis() %>" alt="Signature Fashion Collection">

                <!-- Floating Pricing Callout Capsule -->
                <div class="apple-floating-capsule">
                    <span>Signature Apparel &bull; From &#8377;499</span>
                    <a href="${pageContext.request.contextPath}/products" class="apple-btn-blue" style="padding: 6px 14px; font-size: 12px;">
                        Explore &rsaquo;
                    </a>
                </div>
            </div>
        </section>

        <!-- ================= HIGHLIGHTS STAGE (STUDIO MIST #f5f5f7) ================= -->
        <section class="apple-highlights-stage" id="departments">
            <div class="apple-section-header">
                <div>
                    <p style="font-size:12px; font-weight:600; text-transform:uppercase; color:var(--color-slate); letter-spacing:0.04em; margin-bottom:4px;">
                        Curated Departments
                    </p>
                    <h2>Explore by Department.</h2>
                </div>
                <a href="${pageContext.request.contextPath}/products" class="apple-link-blue">
                    Browse all collections <span>&rsaquo;</span>
                </a>
            </div>

            <div class="apple-cards-grid">
                <c:forEach var="cat" items="${categories}">
                    <a href="${pageContext.request.contextPath}/products?category=${cat.categoryId}" class="apple-feature-card">
                        <div class="apple-card-media">
                            <img class="category-auto-image"
                                 src="${pageContext.request.contextPath}/assets/images/placeholder.jpg"
                                 data-category="${cat.categoryName}"
                                 alt="${cat.categoryName}"
                                 loading="lazy">
                        </div>
                        <div class="apple-card-content">
                            <span class="apple-card-kicker">Department 0${cat.categoryId}</span>
                            <span class="apple-card-title">${cat.categoryName}</span>
                            <span class="apple-card-link">Explore Collection <span>&rsaquo;</span></span>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </section>

        <!-- ================= FEATURED ESSENTIALS (GALLERY WHITE) ================= -->
        <section class="apple-products-stage">
            <div class="apple-section-header">
                <div>
                    <p style="font-size:12px; font-weight:600; text-transform:uppercase; color:var(--color-launch-orange); letter-spacing:0.04em; margin-bottom:4px;">
                        Season Highlights
                    </p>
                    <h2>Featured Essentials.</h2>
                </div>
                <a href="${pageContext.request.contextPath}/products" class="apple-link-blue">
                    View all [${products.size()}] <span>&rsaquo;</span>
                </a>
            </div>

            <div class="apple-product-grid">
                <c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="product" items="${products}" begin="0" end="7">
                            <a href="${pageContext.request.contextPath}/product-details?id=${product.productId}" class="apple-product-item">
                                <div class="apple-product-visual">
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
                                <div class="apple-product-info">
                                    <span class="apple-product-cat">
                                        <c:forEach var="c" items="${categories}">
                                            <c:if test="${c.categoryId == product.categoryId}">
                                                ${c.categoryName}
                                            </c:if>
                                        </c:forEach>
                                    </span>
                                    <h3 class="apple-product-name">${product.productName}</h3>
                                    <div class="apple-product-bottom">
                                        <span class="apple-product-price">&#8377;${product.price}</span>
                                        <span class="apple-mini-pill">View &rsaquo;</span>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p style="color:var(--color-slate); grid-column:1/-1; text-align:center;">No items recorded.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <!-- ================= EDITORIAL STORYTELLING (STUDIO MIST) ================= -->
        <section class="apple-story-section">
            <div class="apple-story-container">
                <div class="apple-story-copy">
                    <p style="font-size:12px; font-weight:600; text-transform:uppercase; color:var(--color-launch-orange); letter-spacing:0.04em;">
                        Uncompromising Craft
                    </p>
                    <h3>Designed without compromise. Worn every day.</h3>
                    <p>
                        Every piece is cut from high-density, breathable organic textiles. Engineered seams and balanced silhouettes ensure lasting resilience, while refined details make styling effortless from morning to evening.
                    </p>
                    <div>
                        <a href="${pageContext.request.contextPath}/products" class="apple-link-blue">
                            Learn more about our materials and fit <span>&rsaquo;</span>
                        </a>
                    </div>
                </div>
                <div class="apple-story-visual">
                    <img src="${pageContext.request.contextPath}/assets/images/craft-fabrics.jpg?v=<%= System.currentTimeMillis() %>" alt="Craftsmanship and textiles">
                </div>
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

    <!-- Category Image Fallback Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const categoryImages = document.querySelectorAll(".category-auto-image");
            categoryImages.forEach(function (img) {
                const categoryName = (img.dataset.category || "").toLowerCase().trim();
                const basePath = "${pageContext.request.contextPath}/assets/images/";
                let imageName = "hero-fashion.jpg";
                if (categoryName === "men") imageName = "category-men.jpg";
                else if (categoryName === "women") imageName = "category-women.jpg";
                else if (categoryName === "kids") imageName = "category-kids.jpg";
                else if (categoryName === "footwear") imageName = "category-footwear.jpg";
                else if (categoryName === "accessories") imageName = "category-accessories.jpg";
                img.src = basePath + imageName;
            });
        });
    </script>
</body>
</html>
