package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductVariantDAO;
import com.fashionstore.model.ProductVariant;
import com.fashionstore.util.DBConnection;

public class ProductVariantDAOImpl implements ProductVariantDAO {

    @Override
    public boolean addVariant(ProductVariant variant) {

        String sql = "INSERT INTO product_variants "
                + "(product_id, size, stock) VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, variant.getProductId());
            preparedStatement.setString(2, variant.getSize());
            preparedStatement.setInt(3, variant.getStock());

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ProductVariant getVariantById(int variantId) {

        String sql = "SELECT * FROM product_variants WHERE variant_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, variantId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractVariant(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<ProductVariant> getVariantsByProductId(int productId) {

        List<ProductVariant> variants = new ArrayList<>();

        String sql = "SELECT * FROM product_variants WHERE product_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, productId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                variants.add(extractVariant(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return variants;
    }

    @Override
    public ProductVariant getVariantByProductAndSize(int productId, String size) {

        String sql = "SELECT * FROM product_variants "
                + "WHERE product_id = ? AND size = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, productId);
            preparedStatement.setString(2, size);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return extractVariant(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean updateStock(int variantId, int stock) {

        String sql = "UPDATE product_variants SET stock = ? "
                + "WHERE variant_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, stock);
            preparedStatement.setInt(2, variantId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateVariant(ProductVariant variant) {

        String sql = "UPDATE product_variants SET "
                + "product_id = ?, size = ?, stock = ? "
                + "WHERE variant_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, variant.getProductId());
            preparedStatement.setString(2, variant.getSize());
            preparedStatement.setInt(3, variant.getStock());
            preparedStatement.setInt(4, variant.getVariantId());

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteVariant(int variantId) {

        String sql = "DELETE FROM product_variants WHERE variant_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, variantId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean checkStock(int variantId, int quantity) {

        String sql = "SELECT stock FROM product_variants WHERE variant_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, variantId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                int availableStock = resultSet.getInt("stock");

                return availableStock >= quantity;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private ProductVariant extractVariant(ResultSet resultSet)
            throws SQLException {

        ProductVariant variant = new ProductVariant();

        variant.setVariantId(resultSet.getInt("variant_id"));
        variant.setProductId(resultSet.getInt("product_id"));
        variant.setSize(resultSet.getString("size"));
        variant.setStock(resultSet.getInt("stock"));

        return variant;
    }
}