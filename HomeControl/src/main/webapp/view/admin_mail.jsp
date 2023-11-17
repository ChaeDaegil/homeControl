<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

    if(admin_content == null){
        admin_content = "";
    }
%>

<html>
<head>
    <title>Title</title>
</head>
<style>

    .user_content{
        position: relative;
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
    textarea{
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
    <h3>
        <input type="text" readonly="readonly" value="<%=title%>">
    </h3>
    <div class="user_content">
        <textarea name="userContent" id="userContent" readonly><%=user_content%></textarea>
    </div>
    <div class="right"><%=uc_date%></div>
    <hr>

    <div class="admin_content">
       <textarea name="answerText" id="answerText" maxlength="149" readonly><%=admin_content%></textarea>
    </div>

    <div class="btn_div">
        <button name="answer">답변하기</button>
        <button name="close">닫기</button>
    </div>
    <form class="sendForm"  method="post" hidden="hidden"></form>
</main>
</body>
</html>
<script>
    const [answerBtn,closeBtn] = document.querySelectorAll('button');
    const textArea = document.getElementById("answerText");
    const userTextArea = document.getElementById("userContent");


    if (textArea.value !== ""){
        answerBtn.innerText = "수정하기";
    }
    else answerBtn.innerText = "답변하기";

    answerBtn.onclick = () => {
        if(answerBtn.innerText === "저장하기"){
            textArea.readOnly = true;
            const form = document.querySelector('.sendForm');
            form.action = "/update?"+"&mail_id=<%=mail_id%>&db=user_mail&admin_content="+textArea.value;
            form.submit();
        }
        else{
            answerBtn.innerText = "저장하기";
            textArea.readOnly = false;
        }


    }

    closeBtn.onclick = () =>{
        location.href = "javascript:history.back();"
    }
</script>