<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account &mdash; Fashion Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/profile.css?v=<%= System.currentTimeMillis() %>">
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
.profile-stage-container {
  max-width: 960px;
  margin: 0 auto;
  padding: 48px 24px 80px;
  min-height: 75vh;
}
.profile-header-area {
  margin-bottom: 32px;
}
.profile-kicker {
  color: var(--color-launch-orange);
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  margin-bottom: 8px;
}
.profile-headline {
  font-size: 40px;
  font-weight: 600;
  letter-spacing: -0.03em;
  color: var(--color-ink);
  line-height: 1.15;
}
.profile-subhead {
  color: var(--color-slate);
  font-size: 15px;
  margin-top: 6px;
}
.profile-alert-success {
  background-color: rgba(52, 199, 89, 0.12);
  border: 1px solid var(--color-apple-green);
  color: #1e7e34;
  border-radius: var(--radius-inputs);
  padding: 12px 18px;
  margin-bottom: 24px;
  font-size: 14px;
  display: flex;
  align-items: center;
  gap: 8px;
}
.profile-card {
  background-color: var(--color-studio-mist);
  border-radius: var(--radius-cards);
  padding: 36px 40px;
  box-shadow: var(--shadow-card);
}
.profile-identity-strip {
  display: flex;
  align-items: center;
  gap: 20px;
  margin-bottom: 32px;
}
.profile-avatar-circle {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  background-color: var(--color-ink);
  color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  font-weight: 600;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}
.profile-user-titles {
  display: flex;
  flex-direction: column;
  gap: 4px;
}
.profile-user-name {
  font-size: 24px;
  font-weight: 600;
  color: var(--color-ink);
  letter-spacing: -0.02em;
}
.profile-user-email {
  font-size: 14px;
  color: var(--color-slate);
}
.profile-uid-badge {
  display: inline-flex;
  align-items: center;
  padding: 2px 10px;
  background-color: var(--color-gallery-white);
  border-radius: var(--radius-pills);
  font-size: 12px;
  font-weight: 500;
  color: var(--color-slate);
  margin-left: 8px;
}
.profile-details-table {
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-media-inner);
  padding: 24px 28px;
  margin-bottom: 32px;
}
.profile-detail-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 14px 0;
  border-bottom: 1px solid var(--color-control-gray);
  font-size: 14px;
}
.profile-detail-row:last-child {
  border-bottom: none;
}
.profile-detail-row .label {
  color: var(--color-slate);
  font-weight: 400;
}
.profile-detail-row .value {
  color: var(--color-ink);
  font-weight: 600;
  text-align: right;
}
.profile-actions-strip {
  display: flex;
  align-items: center;
  gap: 14px;
  flex-wrap: wrap;
}
.btn-profile-primary {
  display: inline-block;
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  padding: 12px 28px;
  border-radius: var(--radius-pills);
  font-size: 14px;
  font-weight: 500;
  box-shadow: 0 4px 14px rgba(0, 113, 227, 0.28);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.btn-profile-primary:hover {
  background-color: var(--color-apple-blue);
  transform: translateY(-2px);
  box-shadow: 0 8px 22px rgba(0, 113, 227, 0.38);
}
.btn-profile-secondary {
  display: inline-block;
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  color: var(--color-ink) !important;
  padding: 12px 24px;
  border-radius: var(--radius-pills);
  font-size: 14px;
  font-weight: 500;
  transition: background-color 0.2s ease;
}
.btn-profile-secondary:hover {
  background-color: var(--color-paper-frost);
}
.btn-profile-signout {
  margin-left: auto;
  font-size: 14px;
  color: var(--color-apple-red);
  font-weight: 500;
}
.btn-profile-signout:hover {
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
        <a href="${pageContext.request.contextPath}/products">Browse catalog &rsaquo;</a>
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
                <a href="${pageContext.request.contextPath}/profile" class="active" style="font-weight:600; color:var(--color-ink);">Account</a>
                <a href="${pageContext.request.contextPath}/orders">Orders</a>
                <a href="${pageContext.request.contextPath}/logout" style="color:var(--color-slate);">Logout</a>
                <a href="${pageContext.request.contextPath}/cart" class="apple-link-blue">
                    Bag
                </a>
            </div>
        </nav>
    </header>

    <!-- ================= PROFILE MAIN STAGE ================= -->
    <main class="profile-stage-container">
        <div class="profile-header-area">
            <p class="profile-kicker">Preferences &amp; Security</p>
            <h1 class="profile-headline">Account Overview</h1>
            <p class="profile-subhead">Manage your personal credentials, contact numbers, and delivery destination details.</p>
        </div>

        <c:if test="${param.updated == 'true'}">
            <div class="profile-alert-success">
                <span>&#10003;</span>
                <span>Your profile information has been successfully updated.</span>
            </div>
        </c:if>

        <div class="profile-card">
            <!-- Top Identity Strip -->
            <div class="profile-identity-strip">
                <div class="profile-avatar-circle">
                    <c:choose>
                        <c:when test="${not empty user.name}">
                            ${user.name.substring(0, 1).toUpperCase()}
                        </c:when>
                        <c:otherwise>
                            &#10022;
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="profile-user-titles">
                    <div class="profile-user-name">
                        ${user.name}
                        <span class="profile-uid-badge">ID #${user.userId}</span>
                    </div>
                    <div class="profile-user-email">${user.email}</div>
                </div>
            </div>

            <!-- Details Table (Inner 20px card) -->
            <div class="profile-details-table">
                <div class="profile-detail-row">
                    <span class="label">Full Legal Name</span>
                    <span class="value">${user.name}</span>
                </div>
                <div class="profile-detail-row">
                    <span class="label">Email Address</span>
                    <span class="value">${user.email}</span>
                </div>
                <div class="profile-detail-row">
                    <span class="label">Contact Phone</span>
                    <span class="value">${not empty user.phone ? user.phone : 'Not provided'}</span>
                </div>
                <div class="profile-detail-row">
                    <span class="label">Street Address</span>
                    <span class="value">${not empty user.address ? user.address : 'Not provided'}</span>
                </div>
                <div class="profile-detail-row">
                    <span class="label">City &amp; State</span>
                    <span class="value">${not empty user.city ? user.city : 'N/A'}, ${not empty user.state ? user.state : 'N/A'}</span>
                </div>
                <div class="profile-detail-row">
                    <span class="label">Postal Code</span>
                    <span class="value">${not empty user.pincode ? user.pincode : 'N/A'}</span>
                </div>
                <div class="profile-detail-row">
                    <span class="label">Country / Region</span>
                    <span class="value">${not empty user.country ? user.country : 'India'}</span>
                </div>
            </div>

            <!-- Actions Strip -->
            <div class="profile-actions-strip">
                <a href="${pageContext.request.contextPath}/profile/edit" class="btn-profile-primary">
                    Edit Profile &rsaquo;
                </a>
                <a href="${pageContext.request.contextPath}/orders" class="btn-profile-secondary">
                    View Orders
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="btn-profile-signout">
                    Sign Out &rsaquo;
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
                    <a href="${pageContext.request.contextPath}/profile">Manage Account</a>
                    <a href="${pageContext.request.contextPath}/orders">Order History &amp; Tracking</a>
                    <a href="${pageContext.request.contextPath}/cart">Shopping Bag</a>
                    <a href="${pageContext.request.contextPath}/logout">Sign Out</a>
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
