<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String user_id = "4";
%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    textarea{
        width: 100%;
        height: 50%;
        resize: none;
    }
    .right{
        display: flex;
        justify-content: right;
    }
</style>
<body>
    <h2>문의 내용</h2>
    <hr>
    <div>
        <input type="text">
        <textarea name="" id="" maxlength="149"></textarea>
    </div>
    <div class="right">
        <button>저장</button>
    </div>
</body>
</html>
<script>
    const saveBtn = document.querySelector('.right');
    const titleTag = document.querySelector('input');
    const textTag = document.querySelector('textarea');
    saveBtn.onclick = () =>{
        const form = document.querySelector('.test');

        form.action = "/insert?user_id=<%=user_id%>&title=&db=user_mail";
        form.submit();
    }
</script>
