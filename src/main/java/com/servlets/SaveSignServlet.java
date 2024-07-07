package com.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Sign;
import com.helper.FactoryProvider;

public class SaveSignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveSignServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Fetching parameters from request
            String mobile = request.getParameter("mobile");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String email = request.getParameter("email");

            // Check if user already exists
            if (isUserExists(mobile)) {
                out.println("<h3 style='color:red;text-align:center;'>User already exists. Please login.</h3>");
                response.sendRedirect("Cont.jsp");
                return;
            }

            // Create user entity object
            Sign newUser = new Sign();
            newUser.setMobile(mobile);
            newUser.setPassword(password);
            newUser.setName(name);
            newUser.setEmail(email);

            // Save user to database
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.save(newUser);
            tx.commit();
            session.close();

            // Sign up successful, redirect to login page
            out.println("<h3 style='color:green;text-align:center;'>Sign up successful! Please login.</h3>");
            response.sendRedirect("home1.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;text-align:center;'>Error processing sign up. Please try again later.</h3>");
        } finally {
            out.close();
        }
    }

    private boolean isUserExists(String mobile) {
        Session session = FactoryProvider.getFactory().openSession();
        Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Sign WHERE mobile = :mobile", Long.class);
        query.setParameter("mobile", mobile);
        Long count = query.uniqueResult();
        session.close();
        return  count>0;
}
}