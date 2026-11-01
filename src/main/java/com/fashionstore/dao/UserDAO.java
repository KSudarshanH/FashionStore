package com.fashionstore.dao;

import com.fashionstore.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email, String password);

    User getUserById(int userId);

    User getUserByEmail(String email);

    boolean updateUser(User user);

    boolean emailExists(String email);

    boolean phoneExists(String phone);
}