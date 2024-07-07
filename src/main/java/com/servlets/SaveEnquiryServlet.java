package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Enquiry;
import com.helper.FactoryProvider;

public class SaveEnquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveEnquiryServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetching parameters from request
            String name = request.getParameter("name");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String course = request.getParameter("course");

            // Creating Admission object
            Enquiry enquiry = new Enquiry(name, mobile, email, course);

            // Hibernate session and transaction
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();
            session.save(enquiry);
            transaction.commit();
            session.close();

            // Sending response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            response.sendRedirect("home1.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            }
}
}
