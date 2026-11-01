package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.impl.CartDAOImpl;
import com.fashionstore.model.Cart;
import com.fashionstore.model.CartItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO;

    @Override
    public void init() throws ServletException {

        cartDAO = new CartDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // User must be logged in
        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login"
            );

            return;
        }

        int userId =
                (Integer) session.getAttribute("userId");

        String action = request.getParameter("action");

        if (action == null || action.trim().isEmpty()) {

            action = "view";
        }

        switch (action) {

            case "add":
                addToCart(request, response, userId);
                break;

            case "update":
                updateCart(request, response, userId);
                break;

            case "delete":
                deleteFromCart(request, response, userId);
                break;

            case "view":
            default:
                viewCart(request, response, userId);
                break;
        }
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }


    // =====================================================
    // VIEW CART
    // =====================================================

    private void viewCart(
            HttpServletRequest request,
            HttpServletResponse response,
            int userId)
            throws ServletException, IOException {

        Cart cart = cartDAO.getCartByUserId(userId);

        List<CartItem> cartItems = null;

        double cartTotal = 0.0;

        if (cart != null) {

            cartItems =
                    cartDAO.getCartItems(cart.getCartId());

            cartTotal =
                    cartDAO.getCartTotal(cart.getCartId());

        }

        request.setAttribute(
                "cart",
                cart
        );

        request.setAttribute(
                "cartItems",
                cartItems
        );

        request.setAttribute(
                "cartTotal",
                cartTotal
        );

        request.getRequestDispatcher(
                "/WEB-INF/views/cart.jsp"
        ).forward(request, response);
    }


    // =====================================================
    // ADD TO CART
    // =====================================================

    private void addToCart(
            HttpServletRequest request,
            HttpServletResponse response,
            int userId)
            throws IOException {

        String productIdParameter =
                request.getParameter("productId");

        String size =
                request.getParameter("size");

        String quantityParameter =
                request.getParameter("quantity");


        // Validate product ID
        if (productIdParameter == null ||
                productIdParameter.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/products"
            );

            return;
        }


        // Validate size
        if (size == null ||
                size.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/product-details?id="
                    + productIdParameter
                    + "&error=size"
            );

            return;
        }


        int productId;

        int quantity;


        try {

            productId =
                    Integer.parseInt(productIdParameter);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/products"
            );

            return;
        }


        try {

            quantity =
                    Integer.parseInt(quantityParameter);

        } catch (Exception e) {

            quantity = 1;
        }


        if (quantity < 1) {

            quantity = 1;
        }

        if (quantity > 10) {

            quantity = 10;
        }


        // Find the product variant
        int variantId =
                cartDAO.getVariantIdByProductAndSize(
                        productId,
                        size
                );


        if (variantId == -1) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/product-details?id="
                    + productId
                    + "&error=variant"
            );

            return;
        }


        // Find user's cart
        Cart cart =
                cartDAO.getCartByUserId(userId);


        // Create cart if it doesn't exist
        if (cart == null) {

            cart = new Cart(userId);

            boolean created =
                    cartDAO.createCart(cart);

            if (!created) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/product-details?id="
                        + productId
                        + "&error=cart"
                );

                return;
            }

            // Get newly created cart
            cart =
                    cartDAO.getCartByUserId(userId);
        }


        // Check whether product variant
        // already exists in cart
        CartItem existingItem =
                cartDAO.getCartItemByVariant(
                        cart.getCartId(),
                        variantId
                );


        if (existingItem != null) {

            int newQuantity =
                    existingItem.getQuantity()
                    + quantity;

            if (newQuantity > 10) {
                newQuantity = 10;
            }

            cartDAO.updateCartItem(
                    existingItem.getCartItemId(),
                    newQuantity
            );

        } else {

            cartDAO.addCartItem(
                    cart.getCartId(),
                    variantId,
                    quantity
            );
        }


        // Go to cart
        response.sendRedirect(
                request.getContextPath()
                + "/cart"
        );
    }


    // =====================================================
    // UPDATE CART
    // =====================================================

    private void updateCart(
            HttpServletRequest request,
            HttpServletResponse response,
            int userId)
            throws IOException {

        String cartItemIdParameter =
                request.getParameter("cartItemId");

        String quantityParameter =
                request.getParameter("quantity");


        int cartItemId;

        int quantity;


        try {

            cartItemId =
                    Integer.parseInt(cartItemIdParameter);

            quantity =
                    Integer.parseInt(quantityParameter);

        } catch (Exception e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

            return;
        }

        // Security check: ensure item exists and belongs to logged-in user
        Cart cart = cartDAO.getCartByUserId(userId);
        CartItem cartItem = cartDAO.getCartItem(cartItemId);

        if (cart == null || cartItem == null || cartItem.getCartId() != cart.getCartId()) {
            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );
            return;
        }


        if (quantity <= 0) {

            cartDAO.deleteCartItem(
                    cartItemId
            );

        } else {

            if (quantity > 10) {
                quantity = 10;
            }

            cartDAO.updateCartItem(
                    cartItemId,
                    quantity
            );
        }


        response.sendRedirect(
                request.getContextPath()
                + "/cart"
        );
    }


    // =====================================================
    // DELETE FROM CART
    // =====================================================

    private void deleteFromCart(
            HttpServletRequest request,
            HttpServletResponse response,
            int userId)
            throws IOException {

        String cartItemIdParameter =
                request.getParameter("cartItemId");


        int cartItemId;


        try {

            cartItemId =
                    Integer.parseInt(cartItemIdParameter);

        } catch (Exception e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

            return;
        }

        // Security check: ensure item exists and belongs to logged-in user
        Cart cart = cartDAO.getCartByUserId(userId);
        CartItem cartItem = cartDAO.getCartItem(cartItemId);

        if (cart != null && cartItem != null && cartItem.getCartId() == cart.getCartId()) {
            cartDAO.deleteCartItem(
                    cartItemId
            );
        }


        response.sendRedirect(
                request.getContextPath()
                + "/cart"
        );
    }
}
