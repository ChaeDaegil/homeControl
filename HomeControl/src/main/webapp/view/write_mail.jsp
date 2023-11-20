<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String user_id = (String) session.getAttribute("userid");
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
        제목 : <input type="text">
        <textarea name="" id="" maxlength="149"></textarea>
    </div>
    <div class="right">
        <button class="back_btn">뒤로가기</button>
        <button class="save_btn">저장</button>
    </div>
</body>
<form class="sendForm"  method="post" hidden="hidden"></form>
</html>
<script>
    const saveBtn = document.querySelector('.save_btn');
    const backBtn = document.querySelector('.back_btn');
    const titleTag = document.querySelector('input');
    const textTag = document.querySelector('textarea');
    saveBtn.onclick = () =>{
        const form = document.querySelector('.sendForm');
        form.action = "/insert?user_id=<%=user_id%>&title="+titleTag.value+"&content="+textTag.value+"&db=user_mail";
        form.submit();
    }
    backBtn.onclick = () =>{
        location.href = "javascript:history.back();"
    }
</script>
