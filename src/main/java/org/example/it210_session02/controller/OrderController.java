package org.example.it210_session02.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Date;

@WebServlet("/orders")
public class OrderController extends HttpServlet {
    public static class Order {
        private String id;
        private String name;
        private double price;
        private Date date;

        public Order(String id, String name, double price, Date date) {
            this.id = id;
            this.name = name;
            this.price = price;
            this.date = date;
        }

        public String getId() { return id; }
        public String getName() { return name; }
        public double getPrice() { return price; }
        public Date getDate() { return date; }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = Arrays.asList(
                new Order("ORD001", "Laptop Dell XPS", 25000000.0, new Date()),
                new Order("ORD002", "Chuột Logitech", 500000.0, new Date()),
                new Order("ORD003", "Bàn phím cơ", 1200000.0, new Date())
        );
        request.setAttribute("orderList", orders);

        ServletContext context = getServletContext();
        synchronized (context) {
            Integer total = (Integer) context.getAttribute("totalViewCount");
            context.setAttribute("totalViewCount", (total == null) ? 1 : total + 1);
        }

        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}
