<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--<%--%>
<%--    String mail_id = request.getParameter("mail_id");--%>
<%--    ResultSet res = DBManager.getInstance().getDBUserMail().SelectDBUserMail(mail_id);--%>
<%--    res.next();--%>
<%--    String title = res.getString("title");--%>
<%--    String user_content = res.getString("user_content");--%>
<%--    String admin_content = res.getString("admin_content");--%>
<%--    DBManager.newInstance();--%>
<%--    if(admin_content == null){--%>
<%--        admin_content = "";--%>
<%--    }--%>
<%--%>--%>

<%--<c:set var="user_id" value="4"/>--%>

<%--<c:set var="sql_query"--%>
<%--       value="SELECT * FROM user_mail" scope="page"/>--%>
<%--<sql:query var="result" scope="page" dataSource="${dataSource}" sql="${sql_query}"/>--%>
<%--<c:remove var="sql_query" scope="page"/>--%>

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
        height: 30%;
        position: relative;
    }
    .btn_div{
        display: flex;
        justify-content: right;
        text-align: right;
        margin: 10px;
    }
    #answerText{
        width: 100%;
        height: 100%;
        resize: none;
        box-sizing: border-box;
    }
</style>



<body>
<h2>문의 내용</h2>
<hr>
<main>
    <h3><%=title%></h3>
    <div class="user_content">
        <%=user_content%>
    </div>
    <hr>

    <div class="admin_content">
       <textarea name="answerText" id="answerText"><%=admin_content%></textarea>
    </div>

    <div class="btn_div">
        <button>답변하기</button>
        <button>닫기</button>
    </div>
</main>
</body>
</html>
<script>
    const [answerBtn,closeBtn] = document.querySelectorAll('button');
    const textArea = document.querySelector("textarea");

    if (textArea.value !== ""){
        answerBtn.value = "수정하기";
    }

    answerBtn.onclick = () => {
        console.log(textArea.value);
    }
    closeBtn.onclick = () =>{
        location.href = "javascript:history.back();"
    }
</script>