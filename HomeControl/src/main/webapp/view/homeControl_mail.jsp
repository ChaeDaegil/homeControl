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
    .right{
        text-align: right;
    }
    textarea{
        width: 100%;
        height: 100%;
        resize: none;
        background-color: aqua;
    }
    input{
        background-color: aqua;
    }
</style>
<%
    String mail_id = request.getParameter("mail_id");
    ResultSet res = DBManager.getInstance().getDBUserMail().SelectDBUserMail(mail_id);
    res.next();
    String title = res.getString("title");
    String user_content = res.getString("user_content");
    String uc_date = res.getString("uc_date");
    String admin_content = res.getString("admin_content");
    String ac_date = res.getString("ac_date");
    DBManager.newInstance();
%>
<body>
    <h2>문의 내용</h2>
    <hr>
    <main>
        <h3>
            <input type="text" readonly="readonly" value="<%=title%>">
        </h3>
        <div class="user_content">
            <textarea name="" id="" cols="30" rows="10" readonly="readonly"><%=user_content%></textarea>
        </div>
        <div class="right"><%=uc_date%></div>
        <hr>
        <div class="admin_content">
            <%=admin_content!=null&&!admin_content.isBlank()?admin_content:"답변 없음"%>
        </div>
        <div class="right"><%=ac_date!=null&&!ac_date.isBlank()?ac_date:""%></div>
        <div class="btn_div">
            <button class="update_btn">수정 하기</button>
            <button class="close_btn">닫기</button>
        </div>
    </main>
</body>
<form class="sendForm"  method="post" hidden="hidden"></form>
</html>
<script>
    const closeBtn = document.querySelector('.close_btn');
    const updateBtn = document.querySelector('.update_btn');
    const textArea = document.querySelector('textarea');
    const titleInput = document.querySelector('input');

    closeBtn.onclick = () =>{
        location.href = "javascript:history.back();"
    }
    updateBtn.onclick = (event) =>{
        if(updateBtn.innerText === "수정 하기"){
            updateBtn.innerText = "저장"
            textArea.readOnly = false
            textArea.style.backgroundColor = "white"
            titleInput.readOnly = false
            titleInput.style.backgroundColor = "white"
        }
        else if(updateBtn.innerText === "저장"){
            console.log(titleInput.value);
            console.log(textArea.value);
            const form = document.querySelector('.sendForm');
            form.action = "/update?&title="+titleInput.value+"&content="+textArea.value+"&mail_id=<%=mail_id%>&db=user_mail";
            form.submit();
        }
    }
</script>