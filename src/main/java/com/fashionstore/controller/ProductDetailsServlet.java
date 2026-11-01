package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.ProductVariantDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.dao.impl.ProductVariantDAOImpl;
import com.fashionstore.model.Product;
import com.fashionstore.model.ProductVariant;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;
    private ProductVariantDAO productVariantDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAOImpl();
        productVariantDAO = new ProductVariantDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String productIdParameter =
                request.getParameter("id");

        /*
         * Check whether product ID was provided
         */
        if (productIdParameter == null
                || productIdParameter.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/products"
            );

            return;
        }

        int productId;

        /*
         * Convert product ID
         */
        try {

            productId =
                    Integer.parseInt(productIdParameter);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath() + "/products"
            );

            return;
        }

        /*
         * Get product from database
         */
        Product product =
                productDAO.getProductById(productId);

        /*
         * Product not found
         */
        if (product == null) {

            response.sendRedirect(
                    request.getContextPath() + "/products"
            );

            return;
        }

        /*
         * Get product variants (actual sizes and available stock)
         */
        List<ProductVariant> variants =
                productVariantDAO.getVariantsByProductId(productId);

        /*
         * Send product and variants to JSP
         */
        request.setAttribute("product", product);
        request.setAttribute("variants", variants);

        /*
         * Forward to product details JSP
         */
        request.getRequestDispatcher(
                "/WEB-INF/views/product-details.jsp"
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
