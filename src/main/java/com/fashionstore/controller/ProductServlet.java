package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.dao.impl.CategoryDAOImpl;
import com.fashionstore.model.Product;
import com.fashionstore.model.Category;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {

        productDAO = new ProductDAOImpl();
        categoryDAO = new CategoryDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String categoryParameter = request.getParameter("category");
        String searchParameter = request.getParameter("search");
        String sizeParameter = request.getParameter("size");
        String minPriceParameter = request.getParameter("minPrice");
        String maxPriceParameter = request.getParameter("maxPrice");
        String sortParameter = request.getParameter("sort");

        Integer categoryId = null;
        Double minPrice = null;
        Double maxPrice = null;

        // Convert category
        if (categoryParameter != null
                && !categoryParameter.trim().isEmpty()) {

            try {
                categoryId = Integer.parseInt(categoryParameter);

            } catch (NumberFormatException e) {
                categoryId = null;
            }
        }

        // Convert minimum price
        if (minPriceParameter != null
                && !minPriceParameter.trim().isEmpty()) {

            try {
                minPrice = Double.parseDouble(minPriceParameter);

            } catch (NumberFormatException e) {
                minPrice = null;
            }
        }

        // Convert maximum price
        if (maxPriceParameter != null
                && !maxPriceParameter.trim().isEmpty()) {

            try {
                maxPrice = Double.parseDouble(maxPriceParameter);

            } catch (NumberFormatException e) {
                maxPrice = null;
            }
        }

        /*
         * Get all categories
         */
        List<Category> categories = categoryDAO.getAllCategories();

        List<Product> products;

        /*
         * If search is provided,
         * perform product search.
         */
        if (searchParameter != null
                && !searchParameter.trim().isEmpty()) {

            products = productDAO.searchProducts(
                    searchParameter.trim()
            );
        }

        /*
         * If any filter is provided,
         * perform filtering.
         */
        else if (categoryId != null
                || (sizeParameter != null
                    && !sizeParameter.trim().isEmpty())
                || minPrice != null
                || maxPrice != null
                || (sortParameter != null
                    && !sortParameter.trim().isEmpty())) {

            products = productDAO.filterProducts(
                    categoryId,
                    sizeParameter,
                    minPrice,
                    maxPrice,
                    sortParameter
            );
        }

        /*
         * If no search or filter is provided,
         * display all products.
         */
        else {

            products = productDAO.getAllProducts();
        }

        /*
         * Send products to JSP
         */
        request.setAttribute("products", products);

        /*
         * Send categories to JSP
         */
        request.setAttribute("categories", categories);

        /*
         * Keep filter values available to JSP
         */
        request.setAttribute(
                "selectedCategory",
                categoryId
        );

        request.setAttribute(
                "selectedSize",
                sizeParameter
        );

        request.setAttribute(
                "minPrice",
                minPriceParameter
        );

        request.setAttribute(
                "maxPrice",
                maxPriceParameter
        );

        request.setAttribute(
                "search",
                searchParameter
        );

        request.setAttribute(
                "sort",
                sortParameter
        );

        /*
         * Forward to products.jsp
         */
        request.getRequestDispatcher(
                "/WEB-INF/views/products.jsp"
        ).forward(request, response);
    }
}