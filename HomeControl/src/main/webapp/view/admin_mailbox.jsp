<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    //String user_id =  session.getAttribute("test").toString();
//    String user_id = (String)session.getAttribute("userid");
    DBManager.newInstance();
    ResultSet res = null;

    try {
        String sel = request.getParameter("sel");
        String search = request.getParameter("search");

        if(sel!=null&&!sel.isBlank()){

            if(sel.equals("제목")){
                res = DBManager.getInstance().getDBUserMail().SelectDBUserSearchTitle(search);
            }
            else if(sel.equals("글쓴이")){
                res = DBManager.getInstance().getDBUserMail().SelectDBUserSearchUser(search);
            }
        }else{
            res = DBManager.getInstance().getDBUserMail().SelectDBAllMail();
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>



<html>
<head>
    <title>Title</title>
</head>
<style>

    a{
        text-decoration: none;
        color: black;
    }
    form{
        padding: 5px;
        display: flex;
        justify-content: space-between;
    }
    table{
        padding: 7px 0;
        width: 100%;
        text-align: center;
        table-layout: fixed;
    }
    table th{
        background-color: slategray;
        border-top: 2px solid gray;
        padding: 5px;
    }
    table td{
        border-bottom: 2px solid gray;
        padding: 5px;
        margin: 5px;
    }
    table td:nth-child(2){
        width: 50%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .center{
        text-align: center;
        padding: 5px;
    }
    hr{

    }
    table td a{
        display: inline-block;
        text-overflow: ellipsis;
        height: 100%;
        width: 100%;
    }

</style>
<body>
<h2>요기는 문의 메일함</h2>
<hr>
<form action="#">
    <span class="left">##개 메일이 있습니다.</span>
    <span class="right">
            <select>
                 <option value="제목" name="sel_title" id="sel_title">제목</option>
                <option value="글쓴이" name="sel_user" id="sel_user">글쓴이</option>
            </select>
           <input type="text" class="search_text" id="search_text" maxlength="12">
            <button type="button" class="search_btn" id="search">검색</button>
        </span>
</form>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>일시</th>
        <th>답변여부</th>
    </tr>
    </thead>

    <tbody>
    <%
        int index = 1;
        while (res.next()){
            String ID = res.getString("ID");
            String user_mail_id = res.getString("user_mail_id");
            String mail_title = res.getString("title");
            String uc_date = res.getString("uc_date");
            String admin_content = res.getString("admin_content");
    %>
    <tr>
        <td class="mail_id" hidden="hidden"><%=user_mail_id%></td>
        <td><%=index%></td>
        <td class="mail_title"><%=mail_title%></td>
        <td><%=ID%></td>
        <td><%=uc_date%></td>
        <td><%=admin_content !=null&&!admin_content.isBlank()?"O":"X"%></td>
    </tr>
    <%
            index++;
        }
    %>
    </tbody>
</table>

<div class="center">
    <a href="#">◀ 이전</a>
    <a href="#">현재 페이지</a>
    <a href="#">다음 ▶</a>
</div>

</body>
</html>

<script>

    const mail_rows = document.querySelectorAll('tbody>tr');
    const searchBtn = document.getElementById("search");
    const selecter = document.querySelector("select");
    const searchText = document.getElementById("search_text");

    searchBtn.onclick = () => {
        console.log(selecter.selectedOptions[0].value);
        console.log(searchText.value);
        location.href = "/view/admin_mailbox.jsp?sel="+selecter.selectedOptions[0].value+"&search="+searchText.value;
    }


    mail_rows.forEach(mail=>{
        mail.onclick = (event)=>{
            location.href = "/view/admin_mail.jsp?mail_id="+event.currentTarget.querySelector('td').innerText;
        }
    });
</script>

