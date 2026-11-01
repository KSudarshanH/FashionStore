package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.OrderItemDAO;
import com.fashionstore.model.OrderItem;
import com.fashionstore.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public boolean addOrderItem(OrderItem orderItem) {

        String sql = "INSERT INTO order_items "
                + "(order_id, variant_id, quantity, price) "
                + "VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, orderItem.getOrderId());
            preparedStatement.setInt(2, orderItem.getVariantId());
            preparedStatement.setInt(3, orderItem.getQuantity());
            preparedStatement.setDouble(4, orderItem.getPrice());

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> orderItems = new ArrayList<>();

        String sql = "SELECT oi.*, pv.product_id, pv.size, p.product_name, p.image, p.color "
                + "FROM order_items oi "
                + "LEFT JOIN product_variants pv ON oi.variant_id = pv.variant_id "
                + "LEFT JOIN products p ON pv.product_id = p.product_id "
                + "WHERE oi.order_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, orderId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                OrderItem orderItem = extractOrderItem(resultSet);
                try {
                    orderItem.setProductId(resultSet.getInt("product_id"));
                    orderItem.setSize(resultSet.getString("size"));
                    orderItem.setProductName(resultSet.getString("product_name"));
                    orderItem.setImage(resultSet.getString("image"));
                    orderItem.setColor(resultSet.getString("color"));
                } catch (SQLException e) {
                    // Fallback if joined fields are not present
                }
                orderItems.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    @Override
    public OrderItem getOrderItemById(int orderItemId) {

        String sql = "SELECT oi.*, pv.product_id, pv.size, p.product_name, p.image, p.color "
                + "FROM order_items oi "
                + "LEFT JOIN product_variants pv ON oi.variant_id = pv.variant_id "
                + "LEFT JOIN products p ON pv.product_id = p.product_id "
                + "WHERE oi.order_item_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, orderItemId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                OrderItem orderItem = extractOrderItem(resultSet);
                try {
                    orderItem.setProductId(resultSet.getInt("product_id"));
                    orderItem.setSize(resultSet.getString("size"));
                    orderItem.setProductName(resultSet.getString("product_name"));
                    orderItem.setImage(resultSet.getString("image"));
                    orderItem.setColor(resultSet.getString("color"));
                } catch (SQLException e) {
                    // Fallback
                }
                return orderItem;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private OrderItem extractOrderItem(ResultSet resultSet)
            throws SQLException {

        OrderItem orderItem = new OrderItem();

        orderItem.setOrderItemId(
                resultSet.getInt("order_item_id"));

        orderItem.setOrderId(
                resultSet.getInt("order_id"));

        orderItem.setVariantId(
                resultSet.getInt("variant_id"));

        orderItem.setQuantity(
                resultSet.getInt("quantity"));

        orderItem.setPrice(
                resultSet.getDouble("price"));

        return orderItem;
    }
}
