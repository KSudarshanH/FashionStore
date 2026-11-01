package com.fashionstore.model;

public class CartItem {

    private int cartItemId;
    private int cartId;
    private int variantId;
    private int quantity;

    // Product information
    private int productId;
    private String productName;
    private String description;
    private double price;
    private String color;
    private String image;

    // Variant information
    private String size;
    private int stock;


    // Default constructor
    public CartItem() {
    }


    // Constructor with all basic cart item details
    public CartItem(
            int cartItemId,
            int cartId,
            int variantId,
            int quantity) {

        this.cartItemId = cartItemId;
        this.cartId = cartId;
        this.variantId = variantId;
        this.quantity = quantity;
    }


    // Constructor for adding a new cart item
    public CartItem(
            int cartId,
            int variantId,
            int quantity) {

        this.cartId = cartId;
        this.variantId = variantId;
        this.quantity = quantity;
    }


    // ==============================
    // CART ITEM ID
    // ==============================

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }


    // ==============================
    // CART ID
    // ==============================

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }


    // ==============================
    // VARIANT ID
    // ==============================

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }


    // ==============================
    // QUANTITY
    // ==============================

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    // ==============================
    // PRODUCT ID
    // ==============================

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }


    // ==============================
    // PRODUCT NAME
    // ==============================

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }


    // ==============================
    // DESCRIPTION
    // ==============================

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    // ==============================
    // PRICE
    // ==============================

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    // ==============================
    // COLOR
    // ==============================

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }


    // ==============================
    // IMAGE
    // ==============================

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


    // ==============================
    // SIZE
    // ==============================

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }


    // ==============================
    // STOCK
    // ==============================

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}