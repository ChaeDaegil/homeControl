<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //String user_id =  session.getAttribute("test").toString();
    String user_id = "4";
    DBManager.newInstance();
    ResultSet res;
    try {
        res = DBManager.getInstance().getDBUserMail().SelectDBUserMail(user_id);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    int index = 1;

%>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin_mail</title>
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
    .writer_div{
        display: flex;
        justify-content: right;
    }
    table{
        padding: 7px 0;
        width: 100%;
        text-align: center;
        table-layout: fixed;
    }
    table th{
        background-color: slategray;
        border-top: 2px solid #808080FF;
        padding: 5px;
    }
    table td{
        border-bottom: 2px solid #808080FF;
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
<h2>문의 내용</h2>
<hr>
<form action="#">
    <span class="left"></span>
    <span class="right">
        <select>
            <option value="제목" name="제목">제목</option>
        </select>
        <input type="text">
        <input type="submit" name="search" value="검색">
    </span>
</form>
<div class="writer_div">
    <button>글쓰기</button>
</div>
<table>
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>일시</th>
            <th>확인여부</th>
        </tr>
    </thead>
    <tbody>
        <%



            while (res.next()){
                String ID = res.getString("ID");
                String mail_title = res.getString("title");
                String uc_date = res.getString("uc_date");
                String admin_content = res.getString("admin_content");
        %>
            <tr>
                <td><%=index%></td>
                <td class="mail_title"><%=mail_title%></td>
                <td><%=ID%></td>
                <td><%=uc_date%></td>
                <td><%=admin_content !=null&&admin_content.isBlank()?"O":"X"%></td>
            </tr>
        <%
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
    const mail_titles = document.getElementsByClassName("mail_title");
</script>