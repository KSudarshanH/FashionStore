package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.model.Order;
import com.fashionstore.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public int createOrder(Order order) {

        String sql =
                "INSERT INTO orders " +
                "(user_id, total_amount, order_status, payment_method) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(
                             sql,
                             Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setInt(
                    1, order.getUserId());

            preparedStatement.setDouble(
                    2, order.getTotalAmount());

            preparedStatement.setString(
                    3, order.getOrderStatus());

            preparedStatement.setString(
                    4, order.getPaymentMethod());

            int rowsAffected =
                    preparedStatement.executeUpdate();

            if (rowsAffected == 0) {
                return -1;
            }

            ResultSet resultSet =
                    preparedStatement.getGeneratedKeys();

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }


    @Override
    public Order getOrderById(int orderId) {

        String sql =
                "SELECT * FROM orders " +
                "WHERE order_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, orderId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractOrder(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders =
                new ArrayList<>();

        String sql =
                "SELECT * FROM orders " +
                "WHERE user_id = ? " +
                "ORDER BY order_date DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, userId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                orders.add(
                        extractOrder(resultSet)
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }


    @Override
    public boolean updateOrderStatus(
            int orderId,
            String orderStatus) {

        String sql =
                "UPDATE orders " +
                "SET order_status = ? " +
                "WHERE order_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(
                    1, orderStatus);

            preparedStatement.setInt(
                    2, orderId);

            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public String getOrderStatus(int orderId) {

        String sql =
                "SELECT order_status " +
                "FROM orders " +
                "WHERE order_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, orderId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                return resultSet.getString(
                        "order_status");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    private Order extractOrder(
            ResultSet resultSet)
            throws SQLException {

        Order order = new Order();

        order.setOrderId(
                resultSet.getInt("order_id"));

        order.setUserId(
                resultSet.getInt("user_id"));

        order.setOrderDate(
                resultSet.getTimestamp("order_date"));

        order.setTotalAmount(
                resultSet.getDouble("total_amount"));

        order.setOrderStatus(
                resultSet.getString("order_status"));

        order.setPaymentMethod(
                resultSet.getString("payment_method"));

        return order;
    }
}