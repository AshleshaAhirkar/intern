package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Contact;
import com.helper.FactoryProvider;


public class SaveContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveContactServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String message = request.getParameter("message");

            Contact contact = new Contact(name, mobile, address, message);

            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();
            session.save(contact);
            transaction.commit();
            session.close();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            response.sendRedirect("home1.jsp");
        } catch (Exception e) {
            e.printStackTrace();
}
}
}
