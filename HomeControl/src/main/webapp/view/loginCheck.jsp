<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%
     response.setContentType("text/html");
     String id = request.getParameter("ID");
     String pw = request.getParameter("PW");
     DBManager.newInstance();
     DBManager con = DBManager.getInstance();





 try {
     ResultSet res = con.getDBUser().SelectDBUserID(id);
     res.next();
            if (res.getString("PW").equals(pw)) {
                String id_num = res.getString("id_num");
                session.setAttribute("userid",id_num);
                if(res.getString("auth").equals("1")){
                    response.sendRedirect("/view/admin.jsp");
                }
                else {
                    response.sendRedirect("/view/homeControl.jsp");
                }

            }
            else{
                response.sendRedirect("/view/login.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
