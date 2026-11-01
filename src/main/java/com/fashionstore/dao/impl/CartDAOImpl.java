package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.model.Cart;
import com.fashionstore.model.CartItem;
import com.fashionstore.util.DBConnection;

public class CartDAOImpl implements CartDAO {

    // =====================================================
    // CREATE CART
    // =====================================================

    @Override
    public boolean createCart(Cart cart) {

        String sql = "INSERT INTO cart (user_id) VALUES (?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cart.getUserId());

            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // GET CART BY USER ID
    // =====================================================

    @Override
    public Cart getCartByUserId(int userId) {

        String sql = "SELECT * FROM cart WHERE user_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, userId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractCart(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // GET CART BY ID
    // =====================================================

    @Override
    public Cart getCartById(int cartId) {

        String sql = "SELECT * FROM cart WHERE cart_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractCart(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // DELETE CART
    // =====================================================

    @Override
    public boolean deleteCart(int cartId) {

        String sql = "DELETE FROM cart WHERE cart_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartId);

            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // GET VARIANT ID BY PRODUCT AND SIZE
    // =====================================================

    @Override
    public int getVariantIdByProductAndSize(
            int productId,
            String size) {

        String sql =
                "SELECT variant_id " +
                "FROM product_variants " +
                "WHERE product_id = ? " +
                "AND size = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, productId);
            preparedStatement.setString(2, size);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt("variant_id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }


    // =====================================================
    // ADD CART ITEM
    // =====================================================

    @Override
    public boolean addCartItem(
            int cartId,
            int variantId,
            int quantity) {

        String sql =
                "INSERT INTO cart_items " +
                "(cart_id, variant_id, quantity) " +
                "VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartId);
            preparedStatement.setInt(2, variantId);
            preparedStatement.setInt(3, quantity);

            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // UPDATE CART ITEM
    // =====================================================

    @Override
    public boolean updateCartItem(
            int cartItemId,
            int quantity) {

        String sql =
                "UPDATE cart_items " +
                "SET quantity = ? " +
                "WHERE cart_item_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, cartItemId);

            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // DELETE CART ITEM
    // =====================================================

    @Override
    public boolean deleteCartItem(int cartItemId) {

        String sql =
                "DELETE FROM cart_items " +
                "WHERE cart_item_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartItemId);

            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // GET CART ITEMS
    // =====================================================

    @Override
    public List<CartItem> getCartItems(int cartId) {

        List<CartItem> cartItems = new ArrayList<>();

        String sql =
                "SELECT ci.cart_item_id, " +
                "ci.cart_id, " +
                "ci.variant_id, " +
                "ci.quantity, " +
                "pv.product_id, " +
                "pv.size, " +
                "pv.stock, " +
                "p.product_name, " +
                "p.description, " +
                "p.price, " +
                "p.color, " +
                "p.image " +
                "FROM cart_items ci " +
                "JOIN product_variants pv " +
                "ON ci.variant_id = pv.variant_id " +
                "JOIN products p " +
                "ON pv.product_id = p.product_id " +
                "WHERE ci.cart_id = ? " +
                "ORDER BY ci.cart_item_id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                CartItem cartItem = new CartItem();

                cartItem.setCartItemId(
                        resultSet.getInt("cart_item_id"));

                cartItem.setCartId(
                        resultSet.getInt("cart_id"));

                cartItem.setVariantId(
                        resultSet.getInt("variant_id"));

                cartItem.setQuantity(
                        resultSet.getInt("quantity"));

                cartItem.setProductId(
                        resultSet.getInt("product_id"));

                cartItem.setSize(
                        resultSet.getString("size"));

                cartItem.setStock(
                        resultSet.getInt("stock"));

                cartItem.setProductName(
                        resultSet.getString("product_name"));

                cartItem.setDescription(
                        resultSet.getString("description"));

                cartItem.setPrice(
                        resultSet.getDouble("price"));

                cartItem.setColor(
                        resultSet.getString("color"));

                cartItem.setImage(
                        resultSet.getString("image"));

                cartItems.add(cartItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartItems;
    }


    // =====================================================
    // GET CART ITEM BY ID
    // =====================================================

    @Override
    public CartItem getCartItem(int cartItemId) {

        String sql =
                "SELECT ci.cart_item_id, " +
                "ci.cart_id, " +
                "ci.variant_id, " +
                "ci.quantity, " +
                "pv.product_id, " +
                "pv.size, " +
                "pv.stock, " +
                "p.product_name, " +
                "p.description, " +
                "p.price, " +
                "p.color, " +
                "p.image " +
                "FROM cart_items ci " +
                "JOIN product_variants pv " +
                "ON ci.variant_id = pv.variant_id " +
                "JOIN products p " +
                "ON pv.product_id = p.product_id " +
                "WHERE ci.cart_item_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartItemId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractCartItem(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // GET CART ITEM BY VARIANT
    // =====================================================

    @Override
    public CartItem getCartItemByVariant(
            int cartId,
            int variantId) {

        String sql =
                "SELECT ci.cart_item_id, " +
                "ci.cart_id, " +
                "ci.variant_id, " +
                "ci.quantity, " +
                "pv.product_id, " +
                "pv.size, " +
                "pv.stock, " +
                "p.product_name, " +
                "p.description, " +
                "p.price, " +
                "p.color, " +
                "p.image " +
                "FROM cart_items ci " +
                "JOIN product_variants pv " +
                "ON ci.variant_id = pv.variant_id " +
                "JOIN products p " +
                "ON pv.product_id = p.product_id " +
                "WHERE ci.cart_id = ? " +
                "AND ci.variant_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartId);
            preparedStatement.setInt(2, variantId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractCartItem(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // GET CART TOTAL
    // =====================================================

    @Override
    public double getCartTotal(int cartId) {

        String sql =
                "SELECT COALESCE(" +
                "SUM(ci.quantity * p.price), 0) AS total " +
                "FROM cart_items ci " +
                "JOIN product_variants pv " +
                "ON ci.variant_id = pv.variant_id " +
                "JOIN products p " +
                "ON pv.product_id = p.product_id " +
                "WHERE ci.cart_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getDouble("total");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0.0;
    }


    // =====================================================
    // CLEAR CART ITEMS
    // =====================================================

    @Override
    public boolean clearCartItems(int cartId) {

        String sql =
                "DELETE FROM cart_items WHERE cart_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, cartId);

            preparedStatement.executeUpdate();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // EXTRACT CART
    // =====================================================

    private Cart extractCart(
            ResultSet resultSet)
            throws SQLException {

        Cart cart = new Cart();

        cart.setCartId(
                resultSet.getInt("cart_id"));

        cart.setUserId(
                resultSet.getInt("user_id"));

        cart.setCreatedAt(
                resultSet.getTimestamp("created_at"));

        cart.setUpdatedAt(
                resultSet.getTimestamp("updated_at"));

        return cart;
    }


    // =====================================================
    // EXTRACT CART ITEM
    // =====================================================

    private CartItem extractCartItem(
            ResultSet resultSet)
            throws SQLException {

        CartItem cartItem = new CartItem();

        cartItem.setCartItemId(
                resultSet.getInt("cart_item_id"));

        cartItem.setCartId(
                resultSet.getInt("cart_id"));

        cartItem.setVariantId(
                resultSet.getInt("variant_id"));

        cartItem.setQuantity(
                resultSet.getInt("quantity"));

        cartItem.setProductId(
                resultSet.getInt("product_id"));

        cartItem.setSize(
                resultSet.getString("size"));

        cartItem.setStock(
                resultSet.getInt("stock"));

        cartItem.setProductName(
                resultSet.getString("product_name"));

        cartItem.setDescription(
                resultSet.getString("description"));

        cartItem.setPrice(
                resultSet.getDouble("price"));

        cartItem.setColor(
                resultSet.getString("color"));

        cartItem.setImage(
                resultSet.getString("image"));

        return cartItem;
    }
}