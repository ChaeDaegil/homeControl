package com.example.homecontrol.DB.Servlet;

import com.example.homecontrol.DB.DBManager;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.Location;
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
        /////////////////////////////////////////////////////////////////////////////

        String db = req.getParameter("db");
        String type = req.getParameter("type");
        DBManager.newInstance();

        try {
            if(db.equals("machine") && type.equals("state")){
                String id_num = req.getParameter("id_num");
                String state = req.getParameter("state");
                DBManager.getInstance().getDbMachine().updateStateDBMachine(state,id_num);
                resp.sendRedirect("/view/homeControl_main.jsp");
            }
            else if(db.equals("machine") && type.equals("name")){
                String id_num = req.getParameter("id_num");
                String name = req.getParameter("name");
                DBManager.getInstance().getDbMachine().updateNameDBMachine(name,id_num);
                resp.sendRedirect("/view/homeControl_main.jsp");
            }
            else if(db.equals("user_mail")){
                String mail_id = req.getParameter("mail_id");
                String title = req.getParameter("title");
                String content = req.getParameter("content");
                String adminContent = req.getParameter("admin_content");
                String sel = req.getParameter("sel");
                String search = req.getParameter("search");
                String pageNum = req.getParameter("pageNum");

                if(adminContent.isEmpty()){
                    DBManager.getInstance().getDBUserMail().updateDBUserMailContent(mail_id,title,content);
                    resp.sendRedirect("/view/homeControl_mailbox.jsp");
                }
                else {
                    DBManager.getInstance().getDBUserMail().updateDBUserMailContent(mail_id,adminContent);
                    resp.sendRedirect("/view/admin_mailbox.jsp?sel="+sel+"&search="+search+"&pageNum="+pageNum);
                }


            }

        }catch (Exception e){
            writer.println("업데이트시 에러 발생");
            System.out.println(e);
        }
    }
}
