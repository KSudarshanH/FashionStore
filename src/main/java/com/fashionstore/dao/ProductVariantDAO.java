package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.ProductVariant;

public interface ProductVariantDAO {

    boolean addVariant(ProductVariant variant);

    ProductVariant getVariantById(int variantId);

    List<ProductVariant> getVariantsByProductId(int productId);

    ProductVariant getVariantByProductAndSize(int productId, String size);

    boolean updateStock(int variantId, int stock);

    boolean updateVariant(ProductVariant variant);

    boolean deleteVariant(int variantId);

    boolean checkStock(int variantId, int quantity);
}