package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException; // Import for ParseException
import java.text.SimpleDateFormat; // Import for SimpleDateFormat
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Admission;
import com.helper.FactoryProvider;

public class SaveAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveAddServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetching parameters from request
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String dobStr = request.getParameter("dob"); // The date string from the request
            String education = request.getParameter("education");
            String email = request.getParameter("email");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String course = request.getParameter("course");

            // Parsing the date
            SimpleDateFormat dateFormat = new SimpleDateFormat("d-M-yyyy"); // Define the expected date format
            Date dob = null;
            try {
                dob = dateFormat.parse(dobStr); // Parse the date string into a Date object
            } catch (ParseException e) {
                e.printStackTrace();
                throw new ServletException("Invalid date format. Please use the correct format."); // Handle parsing errors
            }

            // Creating Admission object with the parsed date
            Admission admission = new Admission(name, address, mobile, dob, education, email, city, state, course);

            // Hibernate session and transaction
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();
            session.save(admission);
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