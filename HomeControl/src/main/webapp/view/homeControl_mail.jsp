<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>

    .user_content{
        border: 1px solid black;
        height: 30%;
    }
    .admin_content{
        border: 1px solid black;
        height: 30%;
    }
    .btn_div{
        display: flex;
        justify-content: right;
        text-align: right;
        margin: 10px;
    }
</style>
<%
    String mail_id = request.getParameter("mail_id");
    ResultSet res = DBManager.getInstance().getDBUserMail().SelectDBUserMail(mail_id);
    res.next();
    String title = res.getString("title");
    String user_content = res.getString("user_content");
    String admin_content = res.getString("admin_content");
    DBManager.newInstance();
%>
<body>
    <h2>문의 내용</h2>
    <hr>
    <main>
        <h3><%=res.getString("title")%></h3>
        <div class="user_content">
            <%=res.getString("title")%>
        </div>
        <hr>
        <div class="admin_content">
            <%=res.getString("title")%>
        </div>
        <div class="btn_div">
            <button>닫기</button>
        </div>
    </main>
</body>
</html>
<script>
    const closeBtn = document.querySelector('button');

    closeBtn.onclick = () =>{
        location.href = "javascript:history.back();"
    }
</script>