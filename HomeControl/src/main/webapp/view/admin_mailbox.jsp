<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    DBManager.newInstance();
    ResultSet res = null;
    String mailCount;

    try {
        String sel = request.getParameter("sel");
        String search = request.getParameter("search");
        ResultSet allMailCount;

        if(sel!=null&&!sel.isBlank()){

            if(sel.equals("제목")){
                res = DBManager.getInstance().getDBUserMail().SelectDBUserSearchTitle(search);
            }
            else if(sel.equals("글쓴이")){
                res = DBManager.getInstance().getDBUserMail().SelectDBUserSearchUser(search);
            }
        }else{
            allMailCount = DBManager.getInstance().getDBUserMail().GetAllUserMailCount();
            if(allMailCount.next()){
                mailCount = allMailCount.getString("count");
            }
            res = DBManager.getInstance().getDBUserMail().SelectDBAllMail();

//
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    String pageNum = "1";
    if(request.getParameter("pageNum") != null){
        pageNum = request.getParameter("pageNum");
    }
%>



<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/admin_mailbox.css">
</head>

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

