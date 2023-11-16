package com.example.homecontrol.DB.Servlet;

import com.example.homecontrol.DB.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delete")
public class deleteDbServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter writer = resp.getWriter();

        //String dbName = req.getParameter("dbName");
        String query = req.getParameter("query");
        DBManager.newInstance();
        try {
            DBManager.getInstance().getDbMachine().deleteDBMachine(query);
            resp.sendRedirect("/view/homeControl.jsp");
        }catch (Exception e){
            writer.println("삭제시 에러 발생");
            System.out.println(e);
        }
    }
}
