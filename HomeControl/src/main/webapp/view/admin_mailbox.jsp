<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!

%>

<%
    DBManager.newInstance();
    ResultSet res = null;

    // 메일 개수를 초기화
    String mailCount = "0";

    // 한페이지 최대 게시량을 지정
    final int onePageMail = 12;

    //현재 페이지파라미터를 받음
    String pageNum = request.getParameter("pageNum");
    int intPage = Integer.parseInt(pageNum);

    String sel;
    String search;
    int total_user;

    try {

        sel = request.getParameter("sel");
        search = request.getParameter("search");
        ResultSet allMailCount;



        //페이지 시작이 몇번 째 메일인지 구함
        int beginMailNum = (intPage - 1) * onePageMail;

        if(sel!=null&&!sel.isBlank()){
            if(sel.equals("제목")){

                //쪽수를 결정할 게시물개수를 얻음
                allMailCount = DBManager.getInstance().getDBUserMail().GetSearchTitleMailCount(search);
                if(allMailCount.next()){
                    mailCount = allMailCount.getString("count");
                }

                //조건에 맞는 게시물 불러옴
                res = DBManager.getInstance().getDBUserMail().SearchTitleWantPageMail(search,beginMailNum,onePageMail);
            }
            else if(sel.equals("글쓴이")){

                //쪽수를 결정할 게시물개수를 얻음
                allMailCount = DBManager.getInstance().getDBUserMail().GetSearchUserMailCount(search);
                if(allMailCount.next()){
                    mailCount = allMailCount.getString("count");
                }

                //조건에 맞는 게시물 불러옴
                res = DBManager.getInstance().getDBUserMail().SearchUserWantPageMail(search,beginMailNum,onePageMail);
            }
        }else{

            //쪽수를 결정할 게시물개수를 얻음
            allMailCount = DBManager.getInstance().getDBUserMail().GetAllUserMailCount();
            if(allMailCount.next()){
                mailCount = allMailCount.getString("count");
            }

            //조건에 맞는 게시물 불러옴
            res = DBManager.getInstance().getDBUserMail().wantPageMail(beginMailNum,onePageMail);
        }

    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    //이전페이지와 다음페이지를 구함
    int lastPage = Integer.parseInt(mailCount)%onePageMail == 0? Integer.parseInt(mailCount)/onePageMail : Integer.parseInt(mailCount)/onePageMail + 1;
    int nextPage = intPage < lastPage? intPage+1 : lastPage;
    int beforePage = intPage > 1? intPage -1 : intPage;

%>



<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/admin_mailbox.css">
</head>

<body>
<section>


<h2>문의 메일함</h2>
<hr>
<form action="#">
    <span class="left"><%=mailCount%>개 메일이 있습니다.</span>
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
        // 메일 넘버를 셈 + 출력
        int index = Integer.parseInt(mailCount) - ((intPage-1) * onePageMail);
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
            index--;
        }
    %>
    </tbody>
</table>


<%--페이지 이동 URL--%>
<div class="center">
    <a href="admin_mailbox.jsp?sel=<%=sel%>&search=<%=search%>&pageNum=<%=beforePage%>" class="pageBtn">◀ 이전</a>
    <a href="#" class="pageBtn"><%=intPage%></a>
    <a href="admin_mailbox.jsp?sel=<%=sel%>&search=<%=search%>&pageNum=<%=nextPage%>" class="pageBtn">다음 ▶</a>
</div>
</section>
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
        location.href = "/view/admin_mailbox.jsp?sel="+selecter.selectedOptions[0].value+"&search="+searchText.value+"&pageNum=1";
    }


    mail_rows.forEach(mail=>{
        mail.onclick = (event)=>{
            location.href = "/view/admin_mail.jsp?mail_id="+event.currentTarget.querySelector('td').innerText;
        }
    });

</script>

