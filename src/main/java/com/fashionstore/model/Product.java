package com.fashionstore.model;

public class Product {

    private int productId;
    private int categoryId;
    private String productName;
    private String description;
    private double price;
    private String color;
    private String image;

    public Product() {
    }

    public Product(int productId, int categoryId, String productName,
                   String description, double price, String color,
                   String image) {

        this.productId = productId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.color = color;
        this.image = image;
    }

    public Product(int categoryId, String productName,
                   String description, double price, String color,
                   String image) {

        this.categoryId = categoryId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.color = color;
        this.image = image;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}