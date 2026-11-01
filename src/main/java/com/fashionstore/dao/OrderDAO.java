package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.Order;

public interface OrderDAO {

    // Create order and return generated order ID
    int createOrder(Order order);

    Order getOrderById(int orderId);

    List<Order> getOrdersByUserId(int userId);

    boolean updateOrderStatus(int orderId, String orderStatus);

    String getOrderStatus(int orderId);
}