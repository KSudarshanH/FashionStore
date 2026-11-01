package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.OrderItemDAO;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.dao.impl.OrderItemDAOImpl;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {

        orderDAO = new OrderDAOImpl();
        orderItemDAO = new OrderItemDAOImpl();
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

        String orderIdParameter =
                request.getParameter("orderId");

        // Check order ID
        if (orderIdParameter == null ||
                orderIdParameter.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/orders"
            );

            return;
        }

        int orderId;

        try {

            orderId =
                    Integer.parseInt(orderIdParameter);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath() + "/orders"
            );

            return;
        }


        // Get order
        Order order =
                orderDAO.getOrderById(orderId);


        // Order does not exist
        if (order == null) {

            response.sendRedirect(
                    request.getContextPath() + "/orders"
            );

            return;
        }


        // Security check:
        // User can only view their own order
        if (order.getUserId() != userId) {

            response.sendRedirect(
                    request.getContextPath() + "/orders"
            );

            return;
        }


        // Get order items
        List<OrderItem> orderItems =
                orderItemDAO.getOrderItemsByOrderId(orderId);


        // Send data to JSP
        request.setAttribute(
                "order",
                order
        );

        request.setAttribute(
                "orderItems",
                orderItems
        );


        // Open order details page
        request.getRequestDispatcher(
                "/WEB-INF/views/order-details.jsp"
        ).forward(request, response);
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}