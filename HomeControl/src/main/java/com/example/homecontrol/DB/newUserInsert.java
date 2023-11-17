package com.example.homecontrol.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/newuserinsert")
public class newUserInsert extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("newID");
        String pw = req.getParameter("newPW");
        DBManager.newInstance();

        try {
        DBManager.getInstance().getDBUser().InsertDBUser(id,pw);
        } catch (SQLException e) {
        throw new RuntimeException(e);
        }
        resp.sendRedirect("/view/login.jsp");
        }
}
