package com.example.homecontrol.DB.Servlet;

import com.example.homecontrol.DB.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/update")
public class updateDbServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter writer = resp.getWriter();
        String db = req.getParameter("db");
        String type = req.getParameter("type");
        DBManager.newInstance();

        try {
            if(db.equals("machine") && type.equals("state")){
                String id_num = req.getParameter("id_num");
                String state = req.getParameter("state");
                DBManager.getInstance().getDbMachine().updateStateDBMachine(state,id_num);
            }
            resp.sendRedirect("/view/homeControl.jsp");
        }catch (Exception e){
            writer.println("업데이트시 에러 발생");
            System.out.println(e);
        }
    }
}
