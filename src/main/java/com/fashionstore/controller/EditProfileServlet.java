package com.fashionstore.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.model.User;

@WebServlet("/profile/edit")
public class EditProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // User must be logged in
        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return;
        }

        int userId =
                (Integer) session.getAttribute("userId");

        User user =
                userDAO.getUserById(userId);

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath() + "/profile"
            );

            return;
        }

        request.setAttribute("user", user);

        request.getRequestDispatcher(
                "/WEB-INF/views/edit-profile.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return;
        }

        int userId =
                (Integer) session.getAttribute("userId");

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String country = request.getParameter("country");

        if (name == null || name.trim().isEmpty()) {

            request.setAttribute(
                    "error",
                    "Name cannot be empty."
            );

            doGet(request, response);
            return;
        }

        User user = userDAO.getUserById(userId);

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath() + "/profile"
            );

            return;
        }

        String trimmedPhone = (phone != null) ? phone.trim() : null;
        if (trimmedPhone != null && !trimmedPhone.isEmpty()) {
            if (user.getPhone() == null || !user.getPhone().equals(trimmedPhone)) {
                if (userDAO.phoneExists(trimmedPhone)) {
                    request.setAttribute(
                            "error",
                            "Phone number is already associated with another account."
                    );
                    request.setAttribute("user", user);
                    request.getRequestDispatcher(
                            "/WEB-INF/views/edit-profile.jsp"
                    ).forward(request, response);
                    return;
                }
            }
        }

        user.setName(name.trim());
        user.setPhone(trimmedPhone);
        user.setAddress(address);
        user.setCity(city);
        user.setState(state);
        user.setPincode(pincode);
        user.setCountry(country);

        boolean updated =
                userDAO.updateUser(user);

        if (updated) {

            session.setAttribute(
                    "userName",
                    user.getName()
            );

            response.sendRedirect(
                    request.getContextPath()
                    + "/profile?updated=true"
            );

        } else {

            request.setAttribute(
                    "error",
                    "Unable to update profile. Please try again."
            );

            request.setAttribute(
                    "user",
                    user
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/edit-profile.jsp"
            ).forward(request, response);
        }
    }
}
