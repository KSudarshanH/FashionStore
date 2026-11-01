package com.fashionstore.util;

import java.util.List;

import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.impl.CategoryDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.model.Category;
import com.fashionstore.model.Product;
import com.fashionstore.model.User;

public class DAOTest {

    public static void main(String[] args) {

        // ------------------------------------
        // 1. Test UserDAO
        // ------------------------------------

        UserDAO userDAO = new UserDAOImpl();

        User user = userDAO.getUserById(1);

        System.out.println("========== USER TEST ==========");

        if (user != null) {
            System.out.println("User ID: " + user.getUserId());
            System.out.println("Name: " + user.getName());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Phone: " + user.getPhone());
        } else {
            System.out.println("User not found.");
        }


        // ------------------------------------
        // 2. Test CategoryDAO
        // ------------------------------------

        CategoryDAO categoryDAO = new CategoryDAOImpl();

        List<Category> categories = categoryDAO.getAllCategories();

        System.out.println("\n========== CATEGORY TEST ==========");

        for (Category category : categories) {

            System.out.println(
                    category.getCategoryId()
                    + " - "
                    + category.getCategoryName()
            );
        }


        // ------------------------------------
        // 3. Test ProductDAO
        // ------------------------------------

        ProductDAO productDAO = new ProductDAOImpl();

        List<Product> products = productDAO.getAllProducts();

        System.out.println("\n========== PRODUCT TEST ==========");

        for (Product product : products) {

            System.out.println(
                    product.getProductId()
                    + " - "
                    + product.getProductName()
                    + " - ₹"
                    + product.getPrice()
                    + " - "
                    + product.getColor()
            );
        }


        // ------------------------------------
        // 4. Test Product Search
        // ------------------------------------

        List<Product> searchResults =
                productDAO.searchProducts("shirt");

        System.out.println("\n========== SEARCH TEST ==========");

        for (Product product : searchResults) {

            System.out.println(
                    product.getProductId()
                    + " - "
                    + product.getProductName()
            );
        }


        // ------------------------------------
        // 5. Test Product Category Filter
        // ------------------------------------

        List<Product> menProducts =
                productDAO.getProductsByCategory(1);

        System.out.println("\n========== CATEGORY FILTER TEST ==========");

        for (Product product : menProducts) {

            System.out.println(
                    product.getProductId()
                    + " - "
                    + product.getProductName()
            );
        }


        System.out.println("\n========== ALL DAO TESTS COMPLETED ==========");
    }
}