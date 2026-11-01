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
import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.OrderItemDAO;
import com.fashionstore.dao.ProductVariantDAO;
import com.fashionstore.dao.UserDAO;

import com.fashionstore.dao.impl.CartDAOImpl;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.dao.impl.OrderItemDAOImpl;
import com.fashionstore.dao.impl.ProductVariantDAOImpl;
import com.fashionstore.dao.impl.UserDAOImpl;

import com.fashionstore.model.Cart;
import com.fashionstore.model.CartItem;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;
import com.fashionstore.model.ProductVariant;
import com.fashionstore.model.User;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO;
    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;
    private ProductVariantDAO productVariantDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        cartDAO = new CartDAOImpl();
        orderDAO = new OrderDAOImpl();
        orderItemDAO = new OrderItemDAOImpl();
        productVariantDAO = new ProductVariantDAOImpl();
        userDAO = new UserDAOImpl();
    }

    // =====================================================
    // POST
    // =====================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

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

        // =================================================
        // PAYMENT METHOD & SHIPPING INFO
        // =================================================

        String paymentMethod =
                request.getParameter("paymentMethod");

        if (paymentMethod == null ||
                paymentMethod.trim().isEmpty()) {

            paymentMethod = "COD";
        }

        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // Sync missing profile information if provided
        User user = userDAO.getUserById(userId);
        if (user != null) {
            boolean userUpdated = false;
            if ((user.getAddress() == null || user.getAddress().trim().isEmpty())
                    && address != null && !address.trim().isEmpty()) {
                user.setAddress(address.trim());
                userUpdated = true;
            }
            if ((user.getPhone() == null || user.getPhone().trim().isEmpty())
                    && phone != null && !phone.trim().isEmpty()) {
                user.setPhone(phone.trim());
                userUpdated = true;
            }
            if (userUpdated) {
                userDAO.updateUser(user);
            }
        }

        // =================================================
        // GET USER CART
        // =================================================

        Cart cart =
                cartDAO.getCartByUserId(userId);

        if (cart == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

            return;
        }

        // =================================================
        // GET CART ITEMS
        // =================================================

        List<CartItem> cartItems =
                cartDAO.getCartItems(
                        cart.getCartId()
                );

        if (cartItems == null ||
                cartItems.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

            return;
        }

        // =================================================
        // CALCULATE TOTAL WITH SHIPPING FREIGHT
        // =================================================

        double merchandiseTotal =
                cartDAO.getCartTotal(
                        cart.getCartId()
                );

        if (merchandiseTotal <= 0) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

            return;
        }

        // Compliant with checkout UI: free delivery on orders >= ₹2000, else ₹150
        double finalTotal = merchandiseTotal >= 2000.0 ? merchandiseTotal : (merchandiseTotal + 150.0);

        // =================================================
        // CREATE ORDER
        // =================================================

        Order order = new Order();

        order.setUserId(userId);

        order.setTotalAmount(finalTotal);

        order.setOrderStatus("PENDING");

        order.setPaymentMethod(paymentMethod);

        int orderId =
                orderDAO.createOrder(order);

        // Order creation failed
        if (orderId == -1) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/checkout?error=order"
            );

            return;
        }

        // =================================================
        // CREATE ORDER ITEMS & DEDUCT STOCK
        // =================================================

        boolean itemsCreated = true;

        for (CartItem cartItem : cartItems) {

            OrderItem orderItem =
                    new OrderItem();

            orderItem.setOrderId(orderId);

            orderItem.setVariantId(
                    cartItem.getVariantId()
            );

            orderItem.setQuantity(
                    cartItem.getQuantity()
            );

            orderItem.setPrice(
                    cartItem.getPrice()
            );

            boolean added =
                    orderItemDAO.addOrderItem(
                            orderItem
                    );

            if (!added) {

                itemsCreated = false;

                break;
            }

            // Deduct inventory stock
            ProductVariant variant = productVariantDAO.getVariantById(cartItem.getVariantId());
            if (variant != null) {
                int newStock = Math.max(0, variant.getStock() - cartItem.getQuantity());
                productVariantDAO.updateStock(variant.getVariantId(), newStock);
            }
        }

        // =================================================
        // IF ORDER ITEMS FAILED
        // =================================================

        if (!itemsCreated) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/checkout?error=items"
            );

            return;
        }

        // =================================================
        // CLEAR CART
        // =================================================

        boolean cartCleared =
                cartDAO.clearCartItems(
                        cart.getCartId()
                );

        if (!cartCleared) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/checkout?error=cart"
            );

            return;
        }

        // =================================================
        // SAVE ORDER ID IN SESSION
        // =================================================

        session.setAttribute(
                "lastOrderId",
                orderId
        );

        // =================================================
        // GO TO ORDER CONFIRMATION
        // =================================================

        response.sendRedirect(
                request.getContextPath()
                + "/order-success"
                + "?orderId="
                + orderId
        );
    }

    // =====================================================
    // GET
    // =====================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath()
                + "/checkout"
        );
    }
}
