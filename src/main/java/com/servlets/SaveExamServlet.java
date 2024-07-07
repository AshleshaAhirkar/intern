package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Exam;
import com.helper.FactoryProvider;


public class SaveExamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveExamServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Retrieve the session, do not create a new one if it doesn't exist

        // Check if user is logged in
//        if (session == null || session.getAttribute("username") == null) {
//            response.sendRedirect("home1.jsp"); // Redirect to login page if not logged in
//            return;
//        }

        try {
            // Fetching parameters from request
            String name = request.getParameter("name");
            String aadhar = request.getParameter("aadhar");
            String mobile = request.getParameter("mobile");
            String dobStr = request.getParameter("dob"); // The date string from the request
            String email = request.getParameter("email");
            String address = request.getParameter("address");
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

            // Creating Exam object with the parsed date
            Exam exam = new Exam(name, dob, mobile, email, aadhar, address, city, state, course);

            // Hibernate session and transaction
            Session hibernateSession = FactoryProvider.getFactory().openSession();
            Transaction transaction = hibernateSession.beginTransaction();
            hibernateSession.save(exam);
            transaction.commit();
            hibernateSession.close();

            // Sending response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            response.sendRedirect("home1.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error saving exam details: " + e.getMessage());
}
}
}