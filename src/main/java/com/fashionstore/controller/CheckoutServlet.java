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
import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.model.Cart;
import com.fashionstore.model.CartItem;
import com.fashionstore.model.User;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        cartDAO = new CartDAOImpl();
        userDAO = new UserDAOImpl();
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
                    request.getContextPath() + "/login"
            );

            return;
        }

        int userId =
                (Integer) session.getAttribute("userId");


        // Get user details
        User user = userDAO.getUserById(userId);

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return;
        }


        // Get user's cart
        Cart cart = cartDAO.getCartByUserId(userId);

        if (cart == null) {

            response.sendRedirect(
                    request.getContextPath() + "/cart"
            );

            return;
        }


        // Get cart items
        List<CartItem> cartItems =
                cartDAO.getCartItems(cart.getCartId());


        // Check whether cart is empty
        if (cartItems == null ||
                cartItems.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/cart"
            );

            return;
        }


        // Get cart total
        double cartTotal =
                cartDAO.getCartTotal(cart.getCartId());


        // Send data to JSP
        request.setAttribute(
                "user",
                user
        );

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


        // Open checkout page
        request.getRequestDispatcher(
                "/WEB-INF/views/checkout.jsp"
        ).forward(request, response);
    }
}