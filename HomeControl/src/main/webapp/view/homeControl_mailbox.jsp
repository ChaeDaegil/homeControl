<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.google.protobuf.Empty" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%

    String user_id = (String)session.getAttribute("userid");
    DBManager.newInstance();
    ResultSet res = null;
    try {
        String sel = request.getParameter("sel");
        String search = request.getParameter("search");

        if(sel!=null&&!sel.isBlank()){

            if(sel.equals("제목")){
                res = DBManager.getInstance().getDBUserMail().SelectDBUserSearchTitle(user_id,search);
            }
            else if(sel.equals("내용")){
                res = DBManager.getInstance().getDBUserMail().SelectDBUserSearchContent(user_id,search);
            }
        }else{
            res = DBManager.getInstance().getDBUserMail().SelectDBUserAllMail(user_id);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<head>
    <meta charset="UTF-8">
    <title>home_mailbox</title>
    <link rel="stylesheet" href="css/homeControl_mailbox.css">
</head>
<body>
    <h2>문의 내용</h2>
    <hr>
    <form action="">
        <span class="left"></span>
        <span class="right">
            <select>
                <option value="제목" name="sel_title">제목</option>
                <option value="내용" name="sel_content">내용</option>
            </select>
            <input type="text" class="search_text" maxlength="12">
            <button type="button" class="search_btn" >검색</button>
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
                Object object = request.getParameter("index");
                int index = 0;
                if(object!=null){
                    index = Integer.parseInt(request.getParameter("index"));
                }
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
<script defer>
    const mail_rows = document.querySelectorAll('tbody>tr');
    const writeBtn = document.querySelector('.writer_div>button');
    const searchBtn = document.querySelector('.search_btn');
    const searchText = document.querySelector('.search_text');
    const searchSelect = document.querySelector('select');

    searchBtn.onclick=()=>{
        location.href = "/view/homeControl_mailbox.jsp?sel="+searchSelect.selectedOptions[0].value+"&search="+searchText.value;
    }

    writeBtn.onclick = () =>{
        location.href = "/view/write_mail.jsp";
    };

    mail_rows.forEach(mail=>{
       mail.onclick = (event)=>{
           location.href = "/view/homeControl_mail.jsp?mail_id="+event.currentTarget.querySelector('td').innerText;
       }
    });
</script>
