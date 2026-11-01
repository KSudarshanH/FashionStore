package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.Cart;
import com.fashionstore.model.CartItem;

public interface CartDAO {

    // ==============================
    // CART OPERATIONS
    // ==============================

    boolean createCart(Cart cart);

    Cart getCartByUserId(int userId);

    Cart getCartById(int cartId);

    boolean deleteCart(int cartId);


    // ==============================
    // PRODUCT VARIANT
    // ==============================

    int getVariantIdByProductAndSize(int productId, String size);


    // ==============================
    // CART ITEM OPERATIONS
    // ==============================

    boolean addCartItem(int cartId, int variantId, int quantity);

    boolean updateCartItem(int cartItemId, int quantity);

    boolean deleteCartItem(int cartItemId);

    List<CartItem> getCartItems(int cartId);

    CartItem getCartItem(int cartItemId);

    CartItem getCartItemByVariant(int cartId, int variantId);


    // ==============================
    // CART TOTAL
    // ==============================

    double getCartTotal(int cartId);


    // ==============================
    // CLEAR CART
    // ==============================

    boolean clearCartItems(int cartId);
}