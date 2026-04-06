package org.example.it210_session02.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class AuthController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        if (("admin".equals(user) && "admin123".equals(pass)) || ("staff".equals(user) && "staff123".equals(pass))) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);
            session.setAttribute("role", "admin".equals(user) ? "Quản trị viên" : "Nhân viên");
            response.sendRedirect("orders");
        } else {
            // Lưu vào Request Scope để thông báo lỗi chỉ xuất hiện 1 lần
            request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getServletPath().equals("/logout")) {
            request.getSession().invalidate(); // Xóa sạch session
            response.sendRedirect("login.jsp");
        }
    }
}
