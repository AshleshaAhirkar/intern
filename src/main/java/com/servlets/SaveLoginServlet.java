package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.query.Query;
import com.entities.Sign;
import com.helper.FactoryProvider;

public class SaveLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveLoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        try {
            // Fetching parameters from request
            String mobile = request.getParameter("mobile");
            String password = request.getParameter("password");

            // Check if user exists with given mobile
            Sign user = getUserByMobile(mobile);

            if (user != null) {
                // User exists, check password
                if (user.getPassword().equals(password)) {
                    // Password matches, login successful
                    out.print("success");
                } else {
                    // Password does not match, show error
                    out.print("invalid_password");
                }
            } else {
                // User does not exist
                out.print("user_not_found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        } finally {
            out.close();
        }
    }

    private Sign getUserByMobile(String mobile) {
        Session session = FactoryProvider.getFactory().openSession();
        Query<Sign> query = session.createQuery("FROM Sign WHERE mobile = :mobile", Sign.class);
        query.setParameter("mobile", mobile);
        Sign user = query.uniqueResult();
        session.close();
        return user;
}
}