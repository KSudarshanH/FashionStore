package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Product;
import com.fashionstore.util.DBConnection;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public boolean addProduct(Product product) {

        String sql = "INSERT INTO products "
                + "(category_id, product_name, description, price, color, image) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, product.getCategoryId());
            preparedStatement.setString(2, product.getProductName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getColor());
            preparedStatement.setString(6, product.getImage());

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Product getProductById(int productId) {

        String sql = "SELECT * FROM products WHERE product_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, productId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractProduct(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Product> getAllProducts() {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                products.add(extractProduct(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public List<Product> getProductsByCategory(int categoryId) {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products WHERE category_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, categoryId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                products.add(extractProduct(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public List<Product> searchProducts(String keyword) {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products "
                + "WHERE product_name LIKE ? "
                + "OR description LIKE ? "
                + "OR color LIKE ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            String searchKeyword = "%" + keyword + "%";

            preparedStatement.setString(1, searchKeyword);
            preparedStatement.setString(2, searchKeyword);
            preparedStatement.setString(3, searchKeyword);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                products.add(extractProduct(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public List<Product> filterProducts(
            Integer categoryId,
            String size,
            Double minPrice,
            Double maxPrice,
            String sortBy) {

        List<Product> products = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT DISTINCT p.* "
                + "FROM products p "
                + "LEFT JOIN product_variants pv "
                + "ON p.product_id = pv.product_id "
                + "WHERE 1=1"
        );

        List<Object> parameters = new ArrayList<>();

        if (categoryId != null) {
            sql.append(" AND p.category_id = ?");
            parameters.add(categoryId);
        }

        if (size != null && !size.trim().isEmpty()) {
            sql.append(" AND pv.size = ?");
            parameters.add(size);
        }

        if (minPrice != null) {
            sql.append(" AND p.price >= ?");
            parameters.add(minPrice);
        }

        if (maxPrice != null) {
            sql.append(" AND p.price <= ?");
            parameters.add(maxPrice);
        }

        if (sortBy != null && !sortBy.trim().isEmpty()) {

            switch (sortBy) {

                case "price_asc":
                    sql.append(" ORDER BY p.price ASC");
                    break;

                case "price_desc":
                    sql.append(" ORDER BY p.price DESC");
                    break;

                case "name_asc":
                    sql.append(" ORDER BY p.product_name ASC");
                    break;

                case "name_desc":
                    sql.append(" ORDER BY p.product_name DESC");
                    break;

                default:
                    sql.append(" ORDER BY p.product_id DESC");
            }
        }

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql.toString())) {

            for (int i = 0; i < parameters.size(); i++) {

                Object parameter = parameters.get(i);

                if (parameter instanceof Integer) {
                    preparedStatement.setInt(i + 1, (Integer) parameter);

                } else if (parameter instanceof Double) {
                    preparedStatement.setDouble(i + 1, (Double) parameter);

                } else {
                    preparedStatement.setString(i + 1, parameter.toString());
                }
            }

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                products.add(extractProduct(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    @Override
    public boolean updateProduct(Product product) {

        String sql = "UPDATE products SET "
                + "category_id = ?, "
                + "product_name = ?, "
                + "description = ?, "
                + "price = ?, "
                + "color = ?, "
                + "image = ? "
                + "WHERE product_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, product.getCategoryId());
            preparedStatement.setString(2, product.getProductName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getColor());
            preparedStatement.setString(6, product.getImage());
            preparedStatement.setInt(7, product.getProductId());

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteProduct(int productId) {

        String sql = "DELETE FROM products WHERE product_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, productId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Product extractProduct(ResultSet resultSet) throws SQLException {

        Product product = new Product();

        product.setProductId(resultSet.getInt("product_id"));
        product.setCategoryId(resultSet.getInt("category_id"));
        product.setProductName(resultSet.getString("product_name"));
        product.setDescription(resultSet.getString("description"));
        product.setPrice(resultSet.getDouble("price"));
        product.setColor(resultSet.getString("color"));
        product.setImage(resultSet.getString("image"));

        return product;
    }
}