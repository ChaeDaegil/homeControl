<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%
    //String user_id =  session.getAttribute("test").toString();
    String user_id = "4";
    DBManager.newInstance();
    ResultSet res;
    try {
        res = DBManager.getInstance().getDBUserMail().SelectDBUserAllMail(user_id);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<head>
    <meta charset="UTF-8">
    <title>admin_mail</title>
    <link rel="stylesheet" href="css/homeControl_mailbox.css">
</head>
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
                    <td><%=admin_content !=null&&admin_content.isBlank()?"O":"X"%></td>
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
<script defer>
    const mail_rows = document.querySelectorAll('tbody>tr');
    mail_rows.forEach(mail=>{
       mail.onclick = (event)=>{
           location.href = "/view/homeControl_mail.jsp?mail_id="+event.currentTarget.querySelector('td').innerText;
       }
    });
</script>