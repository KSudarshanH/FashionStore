<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account &mdash; Fashion Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css?v=<%= System.currentTimeMillis() %>">
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
.auth-page-container {
  min-height: 75vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 56px 24px 80px;
}
.auth-card-wrapper {
  width: 100%;
  max-width: 460px;
  background-color: var(--color-gallery-white);
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-cards);
  padding: 44px 36px;
  box-shadow: var(--shadow-card);
}
.auth-card-wrapper.register-wide {
  max-width: 600px;
}
.auth-header-block {
  text-align: center;
  margin-bottom: 28px;
}
.auth-kicker {
  color: var(--color-launch-orange);
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  margin-bottom: 8px;
}
.auth-headline {
  font-size: 30px;
  font-weight: 600;
  letter-spacing: -0.025em;
  color: var(--color-ink);
  line-height: 1.2;
}
.auth-subhead {
  color: var(--color-slate);
  font-size: 14px;
  margin-top: 8px;
}
.auth-alert-error {
  background-color: #fff2f2;
  border: 1px solid var(--color-apple-red);
  color: var(--color-apple-red);
  border-radius: var(--radius-inputs);
  padding: 12px 16px;
  margin-bottom: 24px;
  font-size: 13px;
  display: flex;
  align-items: center;
  gap: 8px;
}
.auth-form {
  display: flex;
  flex-direction: column;
  gap: 18px;
}
.form-field-group {
  display: flex;
  flex-direction: column;
  gap: 6px;
}
.form-field-group label {
  font-size: 13px;
  font-weight: 500;
  color: var(--color-ink);
}
.apple-auth-input {
  width: 100%;
  padding: 14px 16px;
  font-size: 14px;
  border: 1px solid var(--color-hairline-silver);
  border-radius: var(--radius-inputs);
  background-color: #ffffff;
  color: var(--color-ink);
  outline: none;
  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}
.apple-auth-input:focus {
  border-color: var(--color-pricing-blue);
  box-shadow: 0 0 0 3px rgba(0, 113, 227, 0.15);
}
.form-grid-2col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}
@media (max-width: 540px) {
  .form-grid-2col {
    grid-template-columns: 1fr;
  }
}
.btn-auth-primary {
  display: block;
  width: 100%;
  text-align: center;
  background-color: var(--color-pricing-blue);
  color: #ffffff !important;
  font-size: 16px;
  font-weight: 500;
  padding: 15px 24px;
  border-radius: var(--radius-pills);
  border: none;
  cursor: pointer;
  letter-spacing: -0.01em;
  margin-top: 10px;
  box-shadow: 0 4px 14px rgba(0, 113, 227, 0.28);
  transition: transform 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
}
.btn-auth-primary:hover {
  background-color: var(--color-apple-blue);
  transform: translateY(-2px);
  box-shadow: 0 8px 22px rgba(0, 113, 227, 0.38);
}
.btn-auth-primary:active {
  transform: translateY(0);
}
.auth-switch-box {
  margin-top: 24px;
  padding-top: 20px;
  border-top: 1px solid var(--color-control-gray);
  text-align: center;
  font-size: 13px;
  color: var(--color-slate);
}
.auth-switch-box a {
  color: var(--color-pricing-blue);
  font-weight: 500;
  margin-left: 4px;
}
.auth-switch-box a:hover {
  text-decoration: underline;
}
.auth-return-link {
  display: block;
  text-align: center;
  margin-top: 16px;
  font-size: 12px;
  color: var(--color-slate);
}
.auth-return-link:hover {
  color: var(--color-ink);
  text-decoration: underline;
}
.apple-footer {
  background-color: var(--color-studio-mist);
  border-top: 1px solid var(--color-hairline-silver);
  padding: 56px 24px 32px;
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
        <a href="${pageContext.request.contextPath}/home">Return to storefront &rsaquo;</a>
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
                <a href="${pageContext.request.contextPath}/login" style="font-weight:600; color:var(--color-ink);">Sign In</a>
                <a href="${pageContext.request.contextPath}/cart" class="apple-link-blue">
                    Bag
                </a>
            </div>
        </nav>
    </header>

    <!-- ================= AUTH CARD ================= -->
    <main class="auth-page-container">
        <div class="auth-card-wrapper register-wide">
            <div class="auth-header-block">
                <p class="auth-kicker">Account Registration</p>
                <h1 class="auth-headline">Create Your Account</h1>
                <p class="auth-subhead">Join Fashion Store for express checkout, order tracking, and curated releases.</p>
            </div>

            <c:if test="${not empty error}">
                <div class="auth-alert-error">
                    <span>&#9888;</span>
                    <span>${error}</span>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post" class="auth-form">
                <!-- Personal Info -->
                <div class="form-grid-2col">
                    <div class="form-field-group">
                        <label for="regName">Full Legal Name</label>
                        <input type="text" id="regName" name="name" class="apple-auth-input" placeholder="e.g. John Appleseed" value="${param.name}" required autocomplete="name">
                    </div>

                    <div class="form-field-group">
                        <label for="regPhone">Phone Number</label>
                        <input type="tel" id="regPhone" name="phone" class="apple-auth-input" placeholder="e.g. 9876543210" value="${param.phone}" required autocomplete="tel">
                    </div>
                </div>

                <div class="form-grid-2col">
                    <div class="form-field-group">
                        <label for="regEmail">Email Address</label>
                        <input type="email" id="regEmail" name="email" class="apple-auth-input" placeholder="name@example.com" value="${param.email}" required autocomplete="email">
                    </div>

                    <div class="form-field-group">
                        <label for="regPassword">Password</label>
                        <input type="password" id="regPassword" name="password" class="apple-auth-input" placeholder="Minimum 6 characters" required autocomplete="new-password">
                    </div>
                </div>

                <!-- Delivery Address Info -->
                <div class="form-field-group">
                    <label for="regAddress">Street Address</label>
                    <input type="text" id="regAddress" name="address" class="apple-auth-input" placeholder="Flat, apartment, street, area" value="${param.address}" required autocomplete="street-address">
                </div>

                <div class="form-grid-2col">
                    <div class="form-field-group">
                        <label for="regCity">City</label>
                        <input type="text" id="regCity" name="city" class="apple-auth-input" placeholder="e.g. Mumbai" value="${param.city}" required autocomplete="address-level2">
                    </div>

                    <div class="form-field-group">
                        <label for="regState">State</label>
                        <input type="text" id="regState" name="state" class="apple-auth-input" placeholder="e.g. Maharashtra" value="${param.state}" required autocomplete="address-level1">
                    </div>
                </div>

                <div class="form-grid-2col">
                    <div class="form-field-group">
                        <label for="regPincode">Postal PIN Code</label>
                        <input type="text" id="regPincode" name="pincode" class="apple-auth-input" placeholder="e.g. 400001" value="${param.pincode}" required autocomplete="postal-code">
                    </div>

                    <div class="form-field-group">
                        <label for="regCountry">Country</label>
                        <input type="text" id="regCountry" name="country" class="apple-auth-input" value="${empty param.country ? 'India' : param.country}" required autocomplete="country-name">
                    </div>
                </div>

                <button type="submit" class="btn-auth-primary">
                    Create Account &rsaquo;
                </button>
            </form>

            <div class="auth-switch-box">
                <span>Already have an account?</span>
                <a href="${pageContext.request.contextPath}/login">Sign In &rsaquo;</a>
            </div>

            <a href="${pageContext.request.contextPath}/home" class="auth-return-link">
                &lsaquo; Return to Storefront
            </a>
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
                    <a href="${pageContext.request.contextPath}/login">Sign In</a>
                    <a href="${pageContext.request.contextPath}/register">Create Account</a>
                    <a href="${pageContext.request.contextPath}/cart">Shopping Bag</a>
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
