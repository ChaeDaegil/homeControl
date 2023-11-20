<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.google.protobuf.Empty" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    String user_id = (String)session.getAttribute("userid");
    DBManager.newInstance();
    ResultSet res = null;
    String pageIndex;
    String search;
    String sel;
    try {
        sel = request.getParameter("sel")!=null?request.getParameter("sel"):"제목";
        search = request.getParameter("search");
        pageIndex = request.getParameter("pageIndex")!=null?request.getParameter("pageIndex"):"0";

        if (search != null && !search.trim().isEmpty()) {
            res = (sel.equals("제목"))
                    ?DBManager.getInstance().getDBUserMail().SelectDBUserSearchTitle(user_id, search, pageIndex)
                    :DBManager.getInstance().getDBUserMail().SelectDBUserSearchContent(user_id, search, pageIndex);

        } else {
            res = DBManager.getInstance().getDBUserMail().SelectDBUserAllMail(user_id, pageIndex);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<html>
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

                int index = pageIndex!=null&&!pageIndex.isBlank()?1+Integer.parseInt(pageIndex)*12:1;
                int count = 0;
                while (res.next()){
                    String ID = res.getString("ID");
                    String user_mail_id = res.getString("user_mail_id");
                    String mail_title = res.getString("title");
                    String uc_date = res.getString("uc_date");
                    String admin_content = res.getString("admin_content");
                    count = Integer.parseInt(res.getString("count"));

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
        <form action="" class="sendForm" method="post"></form>
        <span class="page">
<%--                <a href="#">◀ 이전</a>--%>
            <%
                for (int i = 0; i <= count/12; i++) {
            %>
                <a href="#"><%=i+1%></a>
            <%
                }%>
<%--                <a href="#">다음 ▶</a>--%>
        </span>

    </div>
</body>
</html>
<script defer>
    const mail_rows = document.querySelectorAll('tbody>tr');
    const writeBtn = document.querySelector('.writer_div>button');
    const searchBtn = document.querySelector('.search_btn');
    const searchText = document.querySelector('.search_text');
    const searchSelect = document.querySelector('select');
    const pageIndexTag = document.querySelectorAll('.page>a');
    let pageIndex = 0;
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
    for (let i = 0; i < pageIndexTag.length; i++) {
        pageIndexTag[i].onclick = (event)=>{
            const form = document.querySelector('.sendForm');

            form.action = "/view/homeControl_mailbox.jsp?pageIndex="+(Number(event.currentTarget.innerText)-1)+"&search=<%=search!=null?search:""%>";
            form.submit();
        }
        // if(i===0){
        //     pageIndexTag[i].onclick = (event)=>{
        //
        //     }
        // }else if(pageIndexTag.length-1===i){
        //     pageIndexTag[i].onclick = (event)=>{
        //
        //     }
        // }else{
        //     pageIndexTag[i].onclick = (event)=>{
        //     }
        // }
    }
</script>
